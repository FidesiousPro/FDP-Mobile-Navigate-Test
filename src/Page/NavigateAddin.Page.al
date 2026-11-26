namespace FidesiousPro.ReproMobile;

using Microsoft.Sales.Document;

/// <summary>
/// Navigate-add-in: NavigatePage whose content is one control add-in (selection field plus order list).
/// No group around the add-in: on the phone client a group becomes a footer button.
/// </summary>
page 50104 "FDP Navigate Control-Addin"
{
    ApplicationArea = All;
    Caption = 'Navigate Control Add-in';
    PageType = NavigatePage;

    layout
    {
        area(Content)
        {
            usercontrol(OrderPicker; "FDP Order Picker")
            {
                ApplicationArea = All;

                trigger OnReady()
                begin
                    InitAddin();
                    LoadOrders();
                    CurrPage.OrderPicker.FocusInput();
                end;

                trigger OnOrderEntered(OrderNo: Text)
                begin
                    SelectOrder(CopyStr(OrderNo, 1, 20));
                end;
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
        OrderNoCaptionLbl: Label 'Order No.';
        NoCaptionLbl: Label 'No.';
        CustomerCaptionLbl: Label 'Customer';
        PostingDateCaptionLbl: Label 'Posting Date';
        SelectedMsg: Label 'Selected order %1.', Comment = '%1 = order number';
        NotInListMsg: Label 'Order %1 is not in the list.', Comment = '%1 = order number';

    local procedure InitAddin()
    var
        Labels: JsonObject;
    begin
        Labels.Add('orderNo', OrderNoCaptionLbl);
        Labels.Add('no', NoCaptionLbl);
        Labels.Add('customer', CustomerCaptionLbl);
        Labels.Add('postingDate', PostingDateCaptionLbl);
        CurrPage.OrderPicker.Init(Labels);
    end;

    local procedure LoadOrders()
    var
        SalesHeader: Record "Sales Header";
        Orders: JsonArray;
        OrderLine: JsonObject;
    begin
        SalesHeader.SetLoadFields("No.", "Sell-to Customer Name", "Posting Date");
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if SalesHeader.FindSet() then
            repeat
                Clear(OrderLine);
                OrderLine.Add('no', SalesHeader."No.");
                OrderLine.Add('customer', SalesHeader."Sell-to Customer Name");
                OrderLine.Add('postingDate', Format(SalesHeader."Posting Date"));
                Orders.Add(OrderLine);
            until SalesHeader.Next() = 0;
        CurrPage.OrderPicker.SetOrders(Orders);
    end;

    local procedure SelectOrder(OrderNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.Get(SalesHeader."Document Type"::Order, OrderNo) then begin
            CurrPage.OrderPicker.SelectOrder(OrderNo);
            CurrPage.OrderPicker.SetStatus(StrSubstNo(SelectedMsg, OrderNo), false);
        end else
            CurrPage.OrderPicker.SetStatus(StrSubstNo(NotInListMsg, OrderNo), true);
        CurrPage.OrderPicker.FocusInput();
    end;
}
