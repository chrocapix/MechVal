using System;
using UnityEngine;

namespace MechVal
{
	public class AttitudeController
	{
		public static Vessel vessel { get { return FlightGlobals.ActiveVessel; } }

		readonly PIDController yaw;
		readonly PIDController pitch;
		readonly PIDController roll;

		public QuaternionD attitude = QuaternionD.identity;

		public AttitudeController()
			: this(1, .5, 1)
		{
		}

		public AttitudeController(double kProp, double kIntg, double kDerv)
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

		public void computeAngles(out double yawError, out double pitchError, out double rollError)
		{
			// This is shamelessly ripped off from MechJeb2.
			// TODO: Understand it and make sure I didn't screw it up.
			Transform transform = vessel.ReferenceTransform;
			Vector3d attitudeFwd = attitude * Vector3d.forward;
			Vector3d targetUp = QuaternionD.Inverse(transform.rotation) * attitudeFwd;

			double angle = Math.Abs(Vector3d.Angle(Vector3d.up, targetUp));

			yawError = -targetUp.z;
			pitchError = targetUp.x;
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
			computeAngles(out yawError, out pitchError, out rollError);
			Drive(s, yawError, pitchError, rollError);
		}


		public void Drive(FlightCtrlState s, double yawError, double pitchError, double rollError)
		{
			s.yaw = (float)yaw.Update(yawError);
			s.pitch = (float)pitch.Update(pitchError);
			s.roll = (float)roll.Update(rollError);
		}
	}
}
