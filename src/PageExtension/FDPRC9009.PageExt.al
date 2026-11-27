namespace FidesiousPro.ReproMobile;

using Microsoft.Warehouse.RoleCenters;

pageextension 50116 "FDP RC 9009" extends "Whse. Worker WMS Role Center"
{
    layout
    {
        addbefore(Control1901138408)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
