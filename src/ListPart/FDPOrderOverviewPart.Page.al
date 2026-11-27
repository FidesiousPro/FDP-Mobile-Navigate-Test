namespace FidesiousPro.ReproMobile;

using Microsoft.Sales.Document;

/// <summary>
/// The Overzicht: sales orders as a ListPart. Used by the Navigate Subform page (50101).
/// </summary>
page 50102 "FDP Order Overview Part"
{
    ApplicationArea = All;
    Caption = 'Order Overview';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Order));

    layout
    {
        area(Content)
        {
            repeater(Orders)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the sales order.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the name of the customer.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date.';
                }
            }
        }
    }

    /// <summary>
    /// Moves the cursor to the given order. Returns false when it does not exist in the list.
    /// </summary>
    procedure SelectOrder(OrderNo: Code[20]): Boolean
    begin
        exit(Rec.Get(Rec."Document Type"::Order, OrderNo));
    end;
}
