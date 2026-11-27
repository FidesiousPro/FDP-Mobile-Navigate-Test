namespace FidesiousPro.ReproMobile;

using Microsoft.RoleCenters;

pageextension 50126 "FDP RC 9019" extends "CEO and President Role Center"
{
    layout
    {
        addbefore(Control21)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
