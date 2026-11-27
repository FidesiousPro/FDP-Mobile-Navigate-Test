namespace FidesiousPro.ReproMobile;

using Microsoft.Projects.RoleCenters;

pageextension 50122 "FDP RC 9015" extends "Job Project Manager RC"
{
    layout
    {
        addbefore(Control33)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
