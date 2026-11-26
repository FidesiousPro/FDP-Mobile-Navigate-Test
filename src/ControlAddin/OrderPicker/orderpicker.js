// Procedures called from AL. The names match the procedures in OrderPicker.ControlAddin.al.

var orderPicker = { input: null, body: null, labels: null, rows: {} };

function Init(labels) {
    orderPicker.labels = labels;
    var l = labels || {};
    document.getElementById('op-label').textContent = l.orderNo || 'Order No.';
    document.getElementById('op-h-no').textContent = l.no || 'No.';
    document.getElementById('op-h-customer').textContent = l.customer || 'Customer';
    document.getElementById('op-h-date').textContent = l.postingDate || 'Posting Date';
}

function SetOrders(orders) {
    var body = orderPicker.body;
    body.innerHTML = '';
    orderPicker.rows = {};
    (orders || []).forEach(function (o) {
        var tr = document.createElement('tr');
        [o.no, o.customer, o.postingDate].forEach(function (text) {
            var td = document.createElement('td');
            td.textContent = text || '';
            tr.appendChild(td);
        });
        tr.addEventListener('click', function () { selectRow(o.no); });
        body.appendChild(tr);
        orderPicker.rows[o.no] = tr;
    });
}

function SelectOrder(orderNo) {
    selectRow(orderNo);
}

function FocusInput() {
    orderPicker.input.focus();
}

function SetStatus(text, isError) {
    var status = document.getElementById('op-status');
    status.textContent = text || '';
    status.classList.toggle('op-error', !!isError);
}

function selectRow(orderNo) {
    var rows = orderPicker.rows;
    Object.keys(rows).forEach(function (key) { rows[key].classList.remove('op-selected'); });
    var row = rows[orderNo];
    if (row) {
        row.classList.add('op-selected');
        row.scrollIntoView({ block: 'nearest' });
    }
}

function confirmOrderNo() {
    var value = orderPicker.input.value.trim();
    if (!value) { return; }
    orderPicker.input.value = '';
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnOrderEntered', [value]);
    orderPicker.input.focus();
}
