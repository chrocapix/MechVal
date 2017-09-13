using System;
namespace MechVal.Window
{

	public class PersistentWindow
	{
		[Persistent]
		public float left;
		[Persistent]
		public float top;
		[Persistent]
		public float width;
		[Persistent]
		public float height;

		public PersistentWindow()
		{
			left = top = width = height = 0;
		}

		public PersistentWindow(float left, float top, float width, float height)
		{
			this.left = left;
			this.top = top;
			this.width = width;
			this.height = height;
		}
	}

}
