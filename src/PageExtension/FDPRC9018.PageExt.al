namespace FidesiousPro.ReproMobile;

using Microsoft.RoleCenters;

pageextension 50125 "FDP RC 9018" extends "Administrator Role Center"
{
    layout
    {
        addbefore(Control1904484608)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
