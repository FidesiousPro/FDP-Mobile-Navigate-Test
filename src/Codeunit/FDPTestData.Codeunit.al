namespace FidesiousPro.ReproMobile;

using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

/// <summary>
/// Creates and removes the Testorders (TEST-001..TEST-020). Sandbox use only.
/// </summary>
codeunit 50105 "FDP Test Data"
{
    var
        OrderCount: Integer;
        NoPrefixTok: Label 'TEST-', Locked = true;
        NoPostingGroupErr: Label 'No Gen. Business Posting Group or Customer Posting Group exists in this company. Create them first, or use a company with standard data.';
        TestCustomerNoTok: Label 'TESTKLANT', Locked = true;
        TestCustomerNameTxt: Label 'Test customer (mobile repro)';
        CreatedMsg: Label '%1 test orders created, %2 already existed.', Comment = '%1 = created, %2 = existing';
        DeletedMsg: Label '%1 test orders deleted.', Comment = '%1 = number deleted';
        DeletedWithCustomerMsg: Label '%1 test orders and the test customer deleted.', Comment = '%1 = number deleted';

    procedure TestOrdersExist(): Boolean
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetFilter("No.", NoPrefixTok + '*');
        exit(not SalesHeader.IsEmpty());
    end;

    procedure CreateTestOrders(ShowMessage: Boolean)
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        i: Integer;
        Created: Integer;
        Existing: Integer;
        OrderNo: Code[20];
    begin
        if not Customer.Get(TestCustomerNoTok) then begin
            Customer.Init();
            Customer."No." := TestCustomerNoTok;
            Customer.Insert(true);
            Customer.Validate(Name, TestCustomerNameTxt);
            SetPostingGroups(Customer);
            Customer.Modify(true);
        end;

        for i := 1 to GetOrderCount() do begin
            OrderNo := CopyStr(NoPrefixTok + Format(i, 3, '<Integer,3><Filler Char,0>'), 1, MaxStrLen(OrderNo));
            if SalesHeader.Get(SalesHeader."Document Type"::Order, OrderNo) then
                Existing += 1
            else begin
                SalesHeader.Init();
                SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                SalesHeader."No." := OrderNo;
                SalesHeader.Insert(true);
                SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
                SalesHeader.Modify(true);
                Created += 1;
            end;
        end;
        if ShowMessage then
            Message(CreatedMsg, Created, Existing);
    end;

    procedure DeleteTestOrders(ShowMessage: Boolean)
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        Deleted: Integer;
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetFilter("No.", NoPrefixTok + '*');
        Deleted := SalesHeader.Count();
        SalesHeader.DeleteAll(true);

        if Customer.Get(TestCustomerNoTok) then begin
            SalesHeader.Reset();
            SalesHeader.SetRange("Sell-to Customer No.", Customer."No.");
            if SalesHeader.IsEmpty() then begin
                Customer.Delete(true);
                if ShowMessage then
                    Message(DeletedWithCustomerMsg, Deleted);
                exit;
            end;
        end;
        if ShowMessage then
            Message(DeletedMsg, Deleted);
    end;

    local procedure SetPostingGroups(var Customer: Record Customer)
    var
        GenBusPostingGroup: Record "Gen. Business Posting Group";
        VATBusPostingGroup: Record "VAT Business Posting Group";
        CustomerPostingGroup: Record "Customer Posting Group";
    begin
        if not GenBusPostingGroup.FindFirst() then
            Error(NoPostingGroupErr);
        if not CustomerPostingGroup.FindFirst() then
            Error(NoPostingGroupErr);
        Customer.Validate("Gen. Bus. Posting Group", GenBusPostingGroup.Code);
        Customer.Validate("Customer Posting Group", CustomerPostingGroup.Code);
        if VATBusPostingGroup.FindFirst() then
            Customer.Validate("VAT Bus. Posting Group", VATBusPostingGroup.Code);
    end;

    local procedure GetOrderCount(): Integer
    begin
        if OrderCount = 0 then
            OrderCount := 20;
        exit(OrderCount);
    end;
}
