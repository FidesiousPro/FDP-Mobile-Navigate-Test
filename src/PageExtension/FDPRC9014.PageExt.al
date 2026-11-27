namespace FidesiousPro.ReproMobile;

using Microsoft.Projects.RoleCenters;

pageextension 50121 "FDP RC 9014" extends "Job Resource Manager RC"
{
    layout
    {
        addbefore(Control1904257908)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
