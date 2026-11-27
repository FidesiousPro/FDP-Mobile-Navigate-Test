namespace FidesiousPro.ReproMobile;

using Microsoft.Sales.RoleCenters;

pageextension 50114 "FDP RC 9006" extends "Order Processor Role Center"
{
    layout
    {
        addbefore(Control1901851508)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
