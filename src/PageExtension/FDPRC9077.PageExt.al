namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50134 "FDP RC 9077" extends "Account Receivables"
{
    layout
    {
        addbefore("Account Receivables KPIs")
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
