namespace FidesiousPro.ReproMobile;

using Microsoft.Manufacturing.RoleCenters;

pageextension 50118 "FDP RC 9011" extends "Shop Supervisor Mfg Foundation"
{
    layout
    {
        addbefore(Control1907234908)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
