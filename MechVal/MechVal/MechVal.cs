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

		Boolean visible = false;
		HeadingControl headingCtrl = null;

		public ApplicationLauncherButton button;

		public static Vessel getVessel { get { return FlightGlobals.ActiveVessel; } }

		public MechVal()
		{
		}

		public void Start()
		{
			print("mech_val starting");
			print("mech_val_core says " + fnMechValCore());
			CreateButtonIcon();


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
			if (headingCtrl != null) return;

			headingCtrl = new HeadingControl();
			headingCtrl.on();
			getVessel.OnFlyByWire += new FlightInputCallback(fly);
		}

		private void autopilotOFF()
		{
			if (headingCtrl == null) return;

			getVessel.OnFlyByWire -= new FlightInputCallback(fly);
			headingCtrl = null;
		}

		private void fly(FlightCtrlState s)
		{
			headingCtrl.Drive(s);
		}

		private void SetWindowOpen()
		{
			visible = true;
			print("mech_Val: open window " + visible);

			Vessel vessel = getVessel;

			if (vessel == null)
			{
				print("mech_val: no vessel");
			}
			else
			{
				double mass = vessel.GetTotalMass();
				String vesselName = vessel.GetName();

				print("mech_val: vessel " + vesselName + ": mass " + mass + " deltav " + vessel.GetDeltaV() + " autopilot on");
				autopilotON();
			}
		}

		private void SetWindowClose()
		{
			visible = false;
			print("mech_Val: close window " + visible);
			if (getVessel == null) return;

			print("mech_val: disable autopilot");
			autopilotOFF();
		}


	}
}
