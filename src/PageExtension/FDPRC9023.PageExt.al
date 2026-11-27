namespace FidesiousPro.ReproMobile;

using Microsoft.AccountantPortal;

pageextension 50128 "FDP RC 9023" extends "Accounting Services RC"
{
    layout
    {
        addbefore(Control1)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
