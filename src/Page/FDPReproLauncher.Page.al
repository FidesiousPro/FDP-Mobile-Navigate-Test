namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.VAT.Setup;

/// <summary>
/// Entry point: three buttons that each open one variant, plus test data.
/// </summary>
page 50103 "FDP Repro Launcher"
{
    ApplicationArea = All;
    Caption = 'Mobile Navigate Test';
    PageType = NavigatePage;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Intro)
            {
                InstructionalText = 'Choose a test variant';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenNavigateRepeater)
            {
                Caption = '1. Repeater';
                Image = Navigate;
                InFooterBar = true;
                ToolTip = 'Opens the NavigatePage with the orders in a repeater on the page. Use Create test orders first if the test orders do not exist.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Repeater");
                end;
            }
            action(OpenNavigateSubform)
            {
                Caption = '2. Subform';
                Image = Navigate;
                InFooterBar = true;
                ToolTip = 'Opens the NavigatePage with the orders in a subform (ListPart with repeater). Use Create test orders first if the test orders do not exist.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Subform");
                end;
            }
            action(OpenNavigateAddin)
            {
                Caption = '3. Control Add-in';
                Image = Navigate;
                InFooterBar = true;
                ToolTip = 'Opens the NavigatePage with a control add-in: selection field with the order list below it. Use Create test orders first if the test orders do not exist.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Control-Addin");
                end;
            }
            action(OpenStandardVariant)
            {
                Caption = '4. Page 1877';
                Image = Setup;
                InFooterBar = true;
                ToolTip = 'Opens page 1877 from the standard application. Do not choose Finish: it creates VAT groups. Existing test orders are deleted first, because their customer blocks the VAT setup.';

                trigger OnAction()
                var
                    TestData: Codeunit "FDP Test Data";
                begin
                    if TestData.TestOrdersExist() then begin
                        if not Confirm(DeleteFirstQst) then
                            exit;
                        TestData.DeleteTestOrders(false);
                        Commit();
                    end;
                    Page.RunModal(Page::"VAT Setup Wizard");
                end;
            }
        }
    }

    var
        DeleteFirstQst: Label 'The test orders (TEST-001..020) still exist and block the VAT setup, because their customer has a VAT Bus. Posting Group. Delete them first?';

    local procedure RunWithTestOrders(PageId: Integer)
    begin
        Page.RunModal(PageId);
    end;
}
