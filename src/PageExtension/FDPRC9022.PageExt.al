namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50108 "FDP RC 9022" extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
