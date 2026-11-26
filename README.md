# FDP Mobile ListPart Repro

Repro extension for two suspected bugs in the Business Central mobile app. Terms are defined in `GLOSSARY.md` (Dutch).

Target: cloud sandbox **FAT** in tenant **FidesiousPro** (`.vscode/launch.json`). Application 27, runtime 16.

> **Only use in a throwaway sandbox.** The extension creates and deletes sales orders `TEST-001..020`, and page 1877 creates VAT groups when you choose Finish.

## The two observations

Both test pages are a NavigatePage. They differ only in how the orders are shown: in a repeater directly on the page, or in a subform (ListPart with repeater).

1. **Record limit.** A ListPart (subform) on a NavigatePage shows at most 5 records in the BC mobile app. The 6th record is not shown. Test whether a repeater directly on the NavigatePage shows all records.
2. **Focus.** On a NavigatePage the input field above the list should have the focus when the page opens, so you can type an order number straight away. Test whether this differs between the repeater and the subform. AL has no `Activate()` for page fields, so focus cannot be forced from code.

## What is in the app

Start from search: **Mobile ListPart Repro** (page 50103). It has four buttons and two test-data actions.

| Button | Opens | Page type of the main page |
|---|---|---|
| 1. Navigate repeater | page 50100 | NavigatePage + repeater on the page |
| 2. Navigate subform | page 50101 | NavigatePage + ListPart (subform with repeater) |
| 3. Navigate add-in | page 50104 | NavigatePage + control add-in `FDP Order Picker` (field and list in one add-in, fills the page height) |
| 4. Standard variant | page 1877 (standard BC) | wizard, shows the same limit with VAT groups |

Other actions: **Create test orders** (20 sales orders, idempotent) and **Delete test orders**.

Buttons 1, 2 and 3 create the test orders automatically if they do not exist, and delete them again when you close the page. Button 4 first deletes existing test orders (after a confirmation), because their customer has a VAT Bus. Posting Group, which makes the VAT Setup show "Manual setup required".

## How to run the test

1. Publish to FAT from VS Code (F5, or Ctrl+F5 without debugging).
2. Assign permission set **FDP Repro All** to the test user.
3. In the web client: open the launcher, choose **Create test orders**.
4. On a phone or tablet in the BC mobile app: open the launcher, run each variant.
5. For variants 1, 2 and 3: type `TEST-007` in **Order No.** without tapping the field first.
6. For variant 4: open page 1877 in an environment with more than 5 VAT groups. **Do not choose Finish.**
