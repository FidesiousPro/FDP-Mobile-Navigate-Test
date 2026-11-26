namespace FidesiousPro.ReproMobile;

/// <summary>
/// Selection field with the order list below it. The add-in fills the full height of the page
/// and puts the focus on the selection field itself (AL cannot do either on a NavigatePage).
/// </summary>
controladdin "FDP Order Picker"
{
    Scripts = 'src\ControlAddin\OrderPicker\orderpicker.js';
    StartupScript = 'src\ControlAddin\OrderPicker\startup.js';
    StyleSheets = 'src\ControlAddin\OrderPicker\orderpicker.css';
    RequestedHeight = 700;
    MinimumHeight = 250;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    /// <summary>Raised when the add-in has built its user interface and can receive data.</summary>
    event OnReady();

    /// <summary>Raised when the user confirms an order number in the selection field (Enter or leaving the field).</summary>
    event OnOrderEntered(OrderNo: Text);

    /// <summary>Sets the captions: { orderNo, no, customer, postingDate }.</summary>
    procedure Init(Labels: JsonObject);

    /// <summary>Replaces the list with [ { no, customer, postingDate } ].</summary>
    procedure SetOrders(Orders: JsonArray);

    /// <summary>Highlights and scrolls to the order with the given number.</summary>
    procedure SelectOrder(OrderNo: Text);

    /// <summary>Puts the cursor in the selection field.</summary>
    procedure FocusInput();

    /// <summary>Shows a message under the selection field. A modal Message would take the focus away from the field.</summary>
    procedure SetStatus(Text: Text; IsError: Boolean);
}
