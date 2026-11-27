namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50111 "FDP RC 9003" extends "Acc. Receivables Adm. RC"
{
    layout
    {
        addbefore(Control1902899408)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
