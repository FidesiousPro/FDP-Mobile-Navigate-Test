namespace FidesiousPro.ReproMobile;

using Microsoft.Sales.Document;

/// <summary>
/// Navigate-repeater: NavigatePage with the orders in a repeater directly on the page.
/// </summary>
page 50100 "FDP Navigate Repeater"
{
    ApplicationArea = All;
    Caption = 'Navigate Repeater';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = NavigatePage;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Order));

    layout
    {
        area(Content)
        {
            group(Selection)
            {
                ShowCaption = false;
                field(OrderNo; OrderNo)
                {
                    Caption = 'Order No.';
                    ToolTip = 'Type a sales order number to move to that order in the list.';

                    trigger OnValidate()
                    begin
                        SelectOrder();
                    end;
                }
            }
            repeater(Orders)
            {
                Caption = 'Orders';
                Editable = false;
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

    actions
    {
        area(Processing)
        {
            action(Close)
            {
                Caption = 'Close';
                InFooterBar = true;
                ToolTip = 'Closes the page.';

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        OrderNo: Code[20];
        SelectedMsg: Label 'Selected order %1.', Comment = '%1 = order number';
        NotInListMsg: Label 'Order %1 is not in the list.', Comment = '%1 = order number';

    local procedure SelectOrder()
    begin
        if OrderNo = '' then
            exit;
        if Rec.Get(Rec."Document Type"::Order, OrderNo) then
            Message(SelectedMsg, OrderNo)
        else
            Message(NotInListMsg, OrderNo);
        OrderNo := '';
    end;
}
