namespace FidesiousPro.ReproMobile;

using Microsoft.Manufacturing.RoleCenters;

pageextension 50120 "FDP RC 9013" extends "Machine Operator Role Center"
{
    layout
    {
        addbefore(Control1900316508)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
