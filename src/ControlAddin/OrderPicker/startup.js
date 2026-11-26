// Builds the user interface once, then tells AL that the add-in is ready.
(function () {
    var host = document.getElementById('controlAddIn');
    host.innerHTML =
        '<div class="op-root">' +
        '  <label id="op-label" for="op-input"></label>' +
        '  <input id="op-input" type="text" autocomplete="off" autocapitalize="characters" enterkeyhint="done" />' +
        '  <div id="op-status" role="status" aria-live="polite"></div>' +
        '  <div class="op-list">' +
        '    <table>' +
        '      <thead><tr><th id="op-h-no"></th><th id="op-h-customer"></th><th id="op-h-date"></th></tr></thead>' +
        '      <tbody id="op-body"></tbody>' +
        '    </table>' +
        '  </div>' +
        '</div>';

    orderPicker.input = document.getElementById('op-input');
    orderPicker.body = document.getElementById('op-body');

    orderPicker.input.addEventListener('keydown', function (e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            confirmOrderNo();
        }
    });
    orderPicker.input.addEventListener('change', confirmOrderNo);
    orderPicker.input.addEventListener('input', function () { SetStatus('', false); });

    // BC rebuilds the page when the dialog is maximized or restored, which drops the focus.
    var resizeTimer = null;
    window.addEventListener('resize', function () {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function () { orderPicker.input.focus(); }, 300);
    });

    Init(null);
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnReady', []);
})();
