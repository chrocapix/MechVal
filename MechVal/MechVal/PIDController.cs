using System;
namespace MechVal
{
	public class PIDController
	{
		double kProp;
		double kIntg;
		double kDerv;
		double kWind;
		double tFilt;

		// using Kahan summation on the integral, just in case
		readonly KahanSum intg = new KahanSum();
		double derv;

		double timePrev;
		double errorPrev;

		public PIDController(double kProp, double kIntg, double kDerv)
		// this sould give sane default values to the windup and filtering constant
		: this(kProp, kIntg, kDerv, Math.Sqrt(kIntg / kDerv), kDerv / kProp / 3)
		{
		}

		public PIDController(double kProp, double kIntg, double kDerv, double kWind, double tFilt)
		{
			Set(kProp, kIntg, kDerv, kWind, tFilt);
		}

		public void Set(double kProp, double kIntg, double kDerv)
		{
			Set(kProp, kIntg, kDerv, Math.Sqrt(kIntg / kDerv), kDerv / kProp / 3);
		}

		public void Set(double kProp, double kIntg, double kDerv, double kWind, double tFilt)
		{
			this.kProp = kProp;
			this.kIntg = kIntg;
			this.kDerv = kDerv;
			this.kWind = kWind;
			this.tFilt = tFilt;

			Reset();
		}

		public void Reset()
		{
			timePrev = Planetarium.fetch.time;
			errorPrev = 0;
			intg.Set(0);
			derv = 0;
		}

		public double Update(double error)
		{
			return Update(error, Planetarium.fetch.time);
		}

		public double Update(double error, double time)
		{
			double h = Math.Max(time - timePrev, TimeWarp.fixedDeltaTime);

			double prop = kProp * error;
			// filter the derivative
			derv = (tFilt / (tFilt + h)) * derv + (kDerv / (tFilt + h)) * (error - errorPrev);
			double requestedAction = prop + intg.value + derv;

			// clamp the action to [-1,1] and do windup protection on intg
			double action = MvMath.Clamp(-1, 1, requestedAction);
			intg.Add(h * (kIntg * error - kWind * (requestedAction - action)));

			timePrev = time;
			errorPrev = error;

			return action;
		}
	}
}
