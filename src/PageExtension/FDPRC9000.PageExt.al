namespace FidesiousPro.ReproMobile;

using Microsoft.Warehouse.RoleCenters;

pageextension 50109 "FDP RC 9000" extends "Whse. WMS Role Center"
{
    layout
    {
        addbefore(Control1903327208)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
