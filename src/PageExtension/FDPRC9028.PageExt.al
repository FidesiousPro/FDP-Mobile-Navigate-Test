namespace FidesiousPro.ReproMobile;

using Microsoft.RoleCenters;

pageextension 50132 "FDP RC 9028" extends "Team Member Role Center"
{
    layout
    {
        addbefore(Control3)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
