using System;
using UnityEngine;

namespace MechVal.Window
{

	public class BasicWindow
	{
		private MechVal mechVal;

		public bool WindowVisible = false;
		public string title = "MechVal proto";
		public Rect pos = new Rect(100, 100, 300, 200);

		public long guiCalls = 0;

		public BasicWindow(MechVal mechVal)
		{
			this.mechVal = mechVal;
		}

		protected void ItemLabel(string labelText)
		{
			GUILayout.Label(labelText, GUILayout.ExpandWidth(false), GUILayout.Width(pos.width / 2));
		}

		public virtual void WindowGUI(int id)
		{
			guiCalls++;
			if (GUI.Button(new Rect(pos.width - 18, 2, 16, 16), "X"))
			{
				WindowVisible = false;
			}
			GUI.DragWindow(new Rect(0, 0, 10000, 20));

			GUILayout.BeginVertical();
			GUILayout.BeginHorizontal();

			ItemLabel("Pouet");
			GUILayout.TextField(string.Format("{0:0.0}", 42), GUILayout.Width(60));

			GUILayout.EndHorizontal();
			GUILayout.EndVertical();

		}

		public void drawGUI()
		{
			guiCalls++;
			if (WindowVisible)
			{
				GUI.skin = HighLogic.Skin;
				GUILayout.Window(42246758, pos, WindowGUI, title, GUILayout.MinWidth(300));
			}
		}
	}

}
