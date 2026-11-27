namespace FidesiousPro.ReproMobile;

using Microsoft.Service.RoleCenters;

pageextension 50124 "FDP RC 9017" extends "Service Technician Role Center"
{
    layout
    {
        addbefore(Control1900744308)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
