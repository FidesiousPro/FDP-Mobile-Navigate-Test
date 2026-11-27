namespace FidesiousPro.ReproMobile;

using Microsoft.Manufacturing.RoleCenters;

pageextension 50117 "FDP RC 9010" extends "Production Planner Role Center"
{
    layout
    {
        addbefore(Control1905113808)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
