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

		protected void ItemLabel(string labelText, int num)
		{
			GUILayout.Label(labelText, GUILayout.ExpandWidth(false), GUILayout.Width(.9f * pos.width / num));
		}
		protected void TextField(string labelText, int num)
		{
			GUILayout.TextField(labelText, GUILayout.Width(.9f * pos.width / num));
		}

		public virtual void WindowGUI(int id)
		{
			guiCalls++;
			if (GUI.Button(new Rect(pos.width - 18, 2, 16, 16), "X"))
			{
				WindowVisible = false;
			}
			GUI.DragWindow(new Rect(0, 0, 10000, 20));
			double yaw, pitch, roll;
			mechVal.attitude.computeErrors(out yaw, out pitch, out roll);

			GUILayout.BeginVertical();

			GUILayout.BeginHorizontal();
			ItemLabel("", 4);
			ItemLabel("mul", 4);
			ItemLabel("error", 4);
			ItemLabel("cmd", 4);
			GUILayout.EndHorizontal();


			GUILayout.BeginHorizontal();
			ItemLabel("yaw ", 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.yawMul), 4);
			TextField(string.Format("{0:0.0}", yaw), 4);
			TextField(string.Format("{0:0.000}", mechVal.lastYaw), 4);
			GUILayout.EndHorizontal();

			GUILayout.BeginHorizontal();
			ItemLabel("pitch", 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.pitchMul), 4);
			TextField(string.Format("{0:0.0}", pitch), 4);
			TextField(string.Format("{0:0.000}", mechVal.lastPitch), 4);
			GUILayout.EndHorizontal();

			GUILayout.BeginHorizontal();
			ItemLabel("roll", 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.rollMul), 4);
			TextField(string.Format("{0:0.0}", roll), 4);
			TextField(string.Format("{0:0.000}", mechVal.lastRoll), 4);
			GUILayout.EndHorizontal();

			GUILayout.BeginHorizontal();
			ItemLabel("PID", 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.kProp), 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.kIntg), 4);
			TextField(string.Format("{0:0.0}", mechVal.attitude.kDerv), 4);
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
