namespace FidesiousPro.ReproMobile;

/// <summary>
/// Navigate-subform: NavigatePage with the orders in a subform (ListPart with repeater).
/// </summary>
page 50101 "FDP Navigate Subform"
{
    ApplicationArea = All;
    Caption = 'Navigate - Subform';
    PageType = NavigatePage;

    layout
    {
        area(Content)
        {
            group(Selection)
            {
                ShowCaption = false;
                Visible = not Dummy;
                field(OrderNo; OrderNo)
                {
                    Caption = 'Order No.';
                    ToolTip = 'Type a sales order number to move to that order in the list.';

                    trigger OnValidate()
                    begin
                        SelectOrder();
                    end;
                }
                field(OnlyFiveRows; OnlyFiveRowsTxt)
                {
                    Editable = false;
                    ShowCaption = false;
                    Style = Unfavorable;
                    StyleExpr = true;
                    ToolTip = 'The part shows at most five rows in the BC mobile app.';
                }
                part(Lines; "FDP Order Overview Part")
                {
                    Caption = 'Orders';
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
        Dummy: Boolean;
        OnlyFiveRowsTxt: Text;
        OnlyFiveRowsLbl: Label 'Only five rows';
        SelectedMsg: Label 'Selected order %1.', Comment = '%1 = order number';
        NotInListMsg: Label 'Order %1 is not in the list.', Comment = '%1 = order number';

    trigger OnOpenPage()
    begin
        OnlyFiveRowsTxt := OnlyFiveRowsLbl;
    end;

    local procedure SelectOrder()
    begin
        if OrderNo = '' then
            exit;
        if CurrPage.Lines.Page.SelectOrder(OrderNo) then
            Message(SelectedMsg, OrderNo)
        else
            Message(NotInListMsg, OrderNo);
        OrderNo := '';
    end;
}
