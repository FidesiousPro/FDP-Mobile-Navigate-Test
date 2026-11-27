namespace FidesiousPro.ReproMobile;

using Microsoft.Manufacturing.RoleCenters;

pageextension 50119 "FDP RC 9012" extends "Shop Supervisor Role Center"
{
    layout
    {
        addbefore(Control1905423708)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
