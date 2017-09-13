using System;
using KSP.IO;
using KSP.UI.Screens;
using UnityEngine;


namespace MechVal
{
	[KSPAddon(KSPAddon.Startup.Flight, false)]
	public class MechVal : MonoBehaviour
	{
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
		}

		private void SetWindowClose()
		{
			print("Mech_Val: close window");
			visible = false;
			print("Mech_Val: visible " + visible);
		}


	}
}
