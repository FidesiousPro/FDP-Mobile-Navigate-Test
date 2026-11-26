namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Sales.Comment;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

permissionset 50106 "FDP Repro All"
{
    Assignable = true;
    Caption = 'Mobile Navigate Test';

    Permissions =
        tabledata "Sales Header" = RIMD,
        tabledata "Sales Line" = RD,
        tabledata "Sales Comment Line" = RD,
        tabledata Customer = RIMD,
        tabledata "Gen. Business Posting Group" = R,
        tabledata "VAT Business Posting Group" = R,
        tabledata "Customer Posting Group" = R,
        page "FDP Navigate Repeater" = X,
        page "FDP Navigate Subform" = X,
        page "FDP Navigate Control-Addin" = X,
        page "FDP Order Overview Part" = X,
        page "FDP Repro Launcher" = X,
        codeunit "FDP Test Data" = X;
}
