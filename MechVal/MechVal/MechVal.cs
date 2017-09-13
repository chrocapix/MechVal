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

		Boolean visible;

		public ApplicationLauncherButton button;

		public MechVal()
		{
		}

		public void Start()
		{
			CreateButtonIcon();
		}



		private void CreateButtonIcon()
		{
			button = ApplicationLauncher.Instance.AddModApplication(
					SetWindowOpen,
				SetWindowOpen,
			null,
			null,
			null,
			null,
			ApplicationLauncher.AppScenes.ALWAYS,
			GameDatabase.Instance.GetTexture("MechVal/Textures/icon", false)
			);
		}

		private void SetWindowOpen()
		{
			print("Mech_Val: open window");
			visible = true;
			print("Mech_Val: visible " + visible);

			print("Mech_val_core says " + fnMechValCore());
		}

		private void SetWindowClose()
		{
			print("Mech_Val: close window");
			visible = false;
			print("Mech_Val: visible " + visible);
			print("Mech_val_core says " + fnMechValCore());
		}


	}
}
