namespace FidesiousPro.ReproMobile;

using Microsoft.Sales.RoleCenters;

pageextension 50113 "FDP RC 9005" extends "Sales Manager Role Center"
{
    layout
    {
        addbefore(Control1907692008)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
