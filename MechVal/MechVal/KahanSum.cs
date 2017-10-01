using System;
namespace MechVal
{
	public class KahanSum
	{
		public double value;
		public double error;

		public KahanSum(double value = 0)
		{
			this.value = value;
			this.error = 0;
		}

		public void Set(double x)
		{
			value = x;
			error = 0;
		}

		public double Add(double x)
		{
			double prev = value;
			double diff = x - error;
			value += diff;
			error = (value - prev) - diff;
			return value;
		}
	}
}
