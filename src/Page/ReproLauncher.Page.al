namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.VAT.Setup;

/// <summary>
/// Entry point: three buttons that each open one variant, plus test data.
/// </summary>
page 50103 "FDP Repro Launcher"
{
    ApplicationArea = All;
    Caption = 'Mobile ListPart Repro';
    PageType = Card;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(OpenNavigateRepeater)
            {
                Caption = '1. Navigate repeater';
                Image = Navigate;
                ToolTip = 'Opens the NavigatePage with the orders in a repeater on the page. Creates the test orders first if they do not exist, and deletes them when you close the page.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Repeater");
                end;
            }
            action(OpenNavigateSubform)
            {
                Caption = '2. Navigate subform';
                Image = Navigate;
                ToolTip = 'Opens the NavigatePage with the orders in a subform (ListPart with repeater). Creates the test orders first if they do not exist, and deletes them when you close the page.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Subform");
                end;
            }
            action(OpenNavigateAddin)
            {
                Caption = '3. Navigate Control Add-in';
                Image = Navigate;
                ToolTip = 'Opens the NavigatePage with a control add-in: selection field with the order list below it. Creates the test orders first if they do not exist, and deletes them when you close the page.';

                trigger OnAction()
                begin
                    RunWithTestOrders(Page::"FDP Navigate Control-Addin");
                end;
            }
            action(OpenStandardVariant)
            {
                Caption = '4. Standard variant (page 1877)';
                Image = Setup;
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
            action(CreateTestOrders)
            {
                Caption = 'Create test orders';
                Image = CreateDocuments;
                ToolTip = 'Creates sales orders TEST-001 to TEST-020 if they do not exist.';

                trigger OnAction()
                var
                    TestData: Codeunit "FDP Test Data";
                begin
                    TestData.CreateTestOrders(true);
                end;
            }
            action(DeleteTestOrders)
            {
                Caption = 'Delete test orders';
                Image = Delete;
                ToolTip = 'Deletes all sales orders whose number starts with TEST-, and the test customer TESTKLANT if it has no other orders.';

                trigger OnAction()
                var
                    TestData: Codeunit "FDP Test Data";
                begin
                    TestData.DeleteTestOrders(true);
                end;
            }
        }
        area(Promoted)
        {
            actionref(OpenNavigateRepeater_Promoted; OpenNavigateRepeater) { }
            actionref(OpenNavigateSubform_Promoted; OpenNavigateSubform) { }
            actionref(OpenNavigateAddin_Promoted; OpenNavigateAddin) { }
            actionref(OpenStandardVariant_Promoted; OpenStandardVariant) { }
            actionref(CreateTestOrders_Promoted; CreateTestOrders) { }
            actionref(DeleteTestOrders_Promoted; DeleteTestOrders) { }
        }
    }

    var
        DeleteFirstQst: Label 'The test orders (TEST-001..020) still exist and block the VAT setup, because their customer has a VAT Bus. Posting Group. Delete them first?';

    local procedure RunWithTestOrders(PageId: Integer)
    var
        TestData: Codeunit "FDP Test Data";
        CreatedHere: Boolean;
    begin
        if not TestData.TestOrdersExist() then begin
            TestData.CreateTestOrders(false);
            CreatedHere := true;
            // Commit is required: Page.RunModal is not allowed inside an open write transaction.
            Commit();
        end;

        Page.RunModal(PageId);

        if CreatedHere then
            TestData.DeleteTestOrders(false);
    end;
}
