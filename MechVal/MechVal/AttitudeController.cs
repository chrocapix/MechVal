using System;
using UnityEngine;

namespace MechVal
{
	public class AttitudeController
	{
		readonly PIDController yaw;
		readonly PIDController pitch;
		readonly PIDController roll;

		public static Vessel vessel { get { return FlightGlobals.ActiveVessel; } }

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

		public void Drive(FlightCtrlState s, Quaternion attitude)
		{
			Transform transform = vessel.ReferenceTransform;
			var targetUp = Quaternion.Inverse(transform.rotation) * attitude * Vector3d.forward;

			double angle = Math.Abs(Vector3d.Angle(Vector3d.up, targetUp));

		}


		public void Drive(FlightCtrlState s, double yawError, double pitchError, double rollError)
		{
			s.yaw = (float)yaw.Update(yawError);
			s.pitch = (float)pitch.Update(pitchError);
			s.roll = (float)roll.Update(rollError);



		}
	}
}
