namespace FidesiousPro.ReproMobile;

using Microsoft.Warehouse.RoleCenters;

pageextension 50115 "FDP RC 9008" extends "Whse. Basic Role Center"
{
    layout
    {
        addbefore(Control1906245608)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
