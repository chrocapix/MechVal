using System;
using UnityEngine;

namespace MechVal
{
	public class HeadingControl
	{
		private static Vessel vessel { get { return FlightGlobals.ActiveVessel; } }


		public HeadingControl()
		{
		}

		public void on()
		{
			//			FlightGlobals.fetch.SetVesselTarget(target);
		}


		public void Drive(FlightCtrlState s)
		{

			if (Math.Abs(s.roll - s.rollTrim) > .1f)
				return;

			double time = Planetarium.GetUniversalTime();

			int k = (int)Math.Floor(time);
			double t = time - k;
			s.roll = (float)(1 - 2 * t);
			if (k % 2 != 0)
				s.roll = -s.roll;

			s.roll *= .4f;
			// s.roll = (float)(.1 * Math.Sin(time / (2 * Math.PI) / 5));
		}

	}
}
