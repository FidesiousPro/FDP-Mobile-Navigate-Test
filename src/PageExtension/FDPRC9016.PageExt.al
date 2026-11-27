namespace FidesiousPro.ReproMobile;

using Microsoft.Service.RoleCenters;

pageextension 50123 "FDP RC 9016" extends "Service Dispatcher Role Center"
{
    layout
    {
        addbefore(Control1904652008)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
