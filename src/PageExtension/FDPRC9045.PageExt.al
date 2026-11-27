namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.RoleCenters;

pageextension 50133 "FDP RC 9045" extends "Acc. Payable Administrator RC"
{
    layout
    {
        addbefore(APAdministratorActivities)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
