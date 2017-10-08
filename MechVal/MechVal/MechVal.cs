using System;
using System.Runtime.InteropServices;
using KSP.IO;
using KSP.UI.Screens;
using UnityEngine;


namespace MechVal
{

	[KSPAddon(KSPAddon.Startup.Flight, false)]
	public class MechVal : MonoBehaviour
	{
		[DllImport("MechValCore.dll")]
		private static extern int fnMechValCore();

		//	Boolean visible = false;
		public AttitudeController attitude = new AttitudeController();

		public double lastYaw;
		public double lastPitch;
		public double lastRoll;

		public ApplicationLauncherButton button;
		public Window.BasicWindow basicWindow;

		public static Vessel getVessel { get { return FlightGlobals.ActiveVessel; } }

		public MechVal()
		{
		}

		public void Start()
		{
			print("mech_val starting");
			print("mech_val_core says " + fnMechValCore());
			CreateButtonIcon();
			basicWindow = new Window.BasicWindow(this);
		}



		private void CreateButtonIcon()
		{
			button = ApplicationLauncher.Instance.AddModApplication(
					SetWindowOpen,
				SetWindowClose,
			null,
			null,
			null,
			null,
				ApplicationLauncher.AppScenes.FLIGHT | ApplicationLauncher.AppScenes.MAPVIEW,
			GameDatabase.Instance.GetTexture("MechVal/Textures/icon", false)
			);
		}

		private void autopilotON()
		{
			attitude.Reset();
			getVessel.OnFlyByWire += new FlightInputCallback(fly);
		}

		private void autopilotOFF()
		{
			getVessel.OnFlyByWire -= new FlightInputCallback(fly);
		}

		private void fly(FlightCtrlState s)
		{
			attitude.Drive(s);
			lastYaw = s.yaw;
			lastPitch = s.pitch;
			lastRoll = s.roll;
		}

		private void OnGUI()
		{
			basicWindow.drawGUI();
		}

		private void SetWindowOpen()
		{
			//visible = true;
			basicWindow.WindowVisible = true;
			Mesg("open");
			//			print("mech_Val: open window " + basicWindow.WindowVisible);
			//			print("mech_val: " + basicWindow.guiCalls +  "gui calls");

			Vessel vessel = getVessel;

			if (vessel == null)
			{
				//				print("mech_val: no vessel");
			}
			else
			{
				double mass = vessel.GetTotalMass();
				String vesselName = vessel.GetName();

				//				print("mech_val: vessel " + vesselName + ": mass " + mass + " deltav " + vessel.GetDeltaV() + " autopilot on");
				autopilotON();
			}
		}

		private void SetWindowClose()
		{
			//visible = false;
			basicWindow.WindowVisible = false;
			//			print("mech_Val: close window " + basicWindow.WindowVisible);
			Mesg("close");
			if (getVessel == null) return;

			//			print("mech_val: disable autopilot");
			autopilotOFF();
		}

		private void Mesg(string operation)
		{
			print("mech_val: " + basicWindow.guiCalls + " gui calls after " + operation);
		}

		public void OnDestroy()
		{
			ApplicationLauncher.Instance.RemoveModApplication(button);
			Mesg("destroy");
		}

	}
}
