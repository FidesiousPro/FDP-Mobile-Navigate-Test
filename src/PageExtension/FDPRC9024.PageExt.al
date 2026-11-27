namespace FidesiousPro.ReproMobile;

using Microsoft.RoleCenters;

pageextension 50129 "FDP RC 9024" extends "Security Admin Role Center"
{
    layout
    {
        addbefore(Control7)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
