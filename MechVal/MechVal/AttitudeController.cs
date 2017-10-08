using System;
using UnityEngine;

namespace MechVal
{
	public class AttitudeController
	{
		public static Vessel vessel { get { return FlightGlobals.ActiveVessel; } }

		public double yawMul = 1;
		public double pitchMul = 1;
		public double rollMul = 1;

		public double kProp = 1;
		public double kIntg = .5;
		public double kDerv = 1;

		readonly PIDController yaw;
		readonly PIDController pitch;
		readonly PIDController roll;

		public double yawAction;
		public double pitchAction;
		public double rollAction;

		public QuaternionD attitude = QuaternionD.identity;


		public AttitudeController()
		{
			yaw = new PIDController(kProp, kIntg, kDerv);
			pitch = new PIDController(kProp, kIntg, kDerv);
			roll = new PIDController(kProp, kIntg, kDerv);
		}

		public void Reset()
		{
			yaw.Reset();
			pitch.Reset();
			roll.Reset();
		}

		public void SetMultiplier(double yawMul, double pitchMul, double rollMul)
		{
			this.yawMul = yawMul;
			this.pitchMul = pitchMul;
			this.rollMul = rollMul;

			UpdateParameters();
		}

		public void UpdateParameters()
		{
			yaw.Set(yawMul * kProp, yawMul * kIntg, yawMul * kDerv);
			pitch.Set(pitchMul * kProp, pitchMul * kIntg, pitchMul * kDerv);
			roll.Set(rollMul * kProp, rollMul * kIntg, rollMul * kDerv);

			Reset();
		}

		public void computeErrors(out double yawError, out double pitchError, out double rollError)
		{
			// This is shamelessly ripped off from MechJeb2.
			// TODO: Understand it and make sure I didn't screw it up.
			Transform transform = vessel.ReferenceTransform;
			Vector3d attitudeFwd = attitude * Vector3d.forward;
			Vector3d targetUp = QuaternionD.Inverse(transform.rotation) * attitudeFwd;

			double angle = Math.Abs(Vector3d.Angle(Vector3d.up, targetUp));

			yawError = targetUp.x;
			pitchError = -targetUp.z;
			{
				// Numerically safe normalization of the 2D vector (yawError, pitchError)
				double normLinf = Math.Max(Math.Abs(yawError), Math.Abs(pitchError));
				if (normLinf > 0)
				{
					yawError /= normLinf;
					pitchError /= normLinf;

					double normL2 = Math.Sqrt(yawError * yawError + pitchError * pitchError);

					// normL2 can't be 0 here because after dividing by normLinf one the *Rot is 1.
					yawError /= normL2;
					pitchError /= normL2;
				}
			}

			yawError *= angle;
			pitchError *= angle;

			Vector3d normal = Vector3d.Cross(attitudeFwd, transform.up);
			Vector3d rightDeRot = QuaternionD.AngleAxis(angle, normal) * attitude * Vector3d.right;
			rollError = Vector3d.Angle(transform.right, rightDeRot)
							* Math.Sign(Vector3d.Dot(transform.forward, rightDeRot));
		}

		public void Drive(FlightCtrlState s)
		{
			double yawError, pitchError, rollError;
			computeErrors(out yawError, out pitchError, out rollError);
			Drive(s, yawError, pitchError, rollError);
		}


		public void Drive(FlightCtrlState s, double yawError, double pitchError, double rollError)
		{
			s.yaw = (float)(yawAction = yaw.Update(yawError));
			s.pitch = (float)(pitchAction = pitch.Update(pitchError));
			s.roll = (float)(rollAction = roll.Update(rollError));
		}
	}
}
