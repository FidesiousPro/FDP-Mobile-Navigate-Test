namespace FidesiousPro.ReproMobile;

using System.IO;

pageextension 50127 "FDP RC 9021" extends "RapidStart Services RC"
{
    layout
    {
        addbefore(Activities)
        {
            part(FDPReproLauncherPart; "FDP Repro Launcher Part")
            {
                ApplicationArea = All;
            }
        }
    }
}
