namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50112 "FDP RC 9004" extends "Bookkeeper Role Center"
{
    layout
    {
        addbefore(Control1901197008)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
