namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50110 "FDP RC 9001" extends "Accounting Manager Role Center"
{
    layout
    {
        addbefore(Control1902304208)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
