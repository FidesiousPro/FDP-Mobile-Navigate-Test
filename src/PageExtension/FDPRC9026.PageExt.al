namespace FidesiousPro.ReproMobile;

using Microsoft.CRM.RoleCenters;

pageextension 50130 "FDP RC 9026" extends "Sales & Relationship Mgr. RC"
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
