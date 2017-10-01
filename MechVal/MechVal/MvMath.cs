using System;
namespace MechVal
{
	public static class MvMath
	{
		public static double Clamp(double min, double max, double value)
		{
			return Math.Max(min, Math.Min(max, value));
		}
	}
}
