# FDP Mobile Navigate Test

Repro extension for two suspected bugs in the Business Central mobile app. Terms are defined in `GLOSSARY.md` (Dutch).

Target: a Business Central cloud sandbox. Application 29, runtime 18.

> **Only use in a throwaway sandbox.** The extension creates and deletes sales orders `TEST-001..020`, and page 1877 creates VAT groups when you choose Finish.

## The two observations

Both test pages are a NavigatePage. They differ only in how the orders are shown: in a repeater directly on the page, or in a subform (ListPart with repeater).

1. **Record limit.** A ListPart (subform) on a NavigatePage shows at most 5 records in the BC mobile app. The 6th record is not shown. Test whether a repeater directly on the NavigatePage shows all records.
2. **Focus.** On a NavigatePage the input field above the list should have the focus when the page opens, so you can type an order number straight away. Test whether this differs between the repeater and the subform. AL has no `Activate()` for page fields, so focus cannot be forced from code.

## What is in the app

Start from the Role Center or from search.

- **Role Center.** On 27 standard Role Centers (for example Business Manager) the part **Mobile Navigate Test** (page 50149, `FDP Repro Launcher Part`) is shown above the Activities. It has three tiles: **Mobile Navigate Test** (opens the launcher), **Create test orders** and **Delete test orders**.
- **Launcher.** Search for **Mobile Navigate Test** (page 50103). It is a NavigatePage with four buttons in the footer. Close it with the cross.

| Button | Opens | Page type of the main page |
|---|---|---|
| 1. Repeater | page 50100 | NavigatePage + repeater on the page |
| 2. Subform | page 50101 | NavigatePage + ListPart (subform with repeater) |
| 3. Control Add-in | page 50104 | NavigatePage + control add-in `FDP Order Picker` (field and list in one add-in, fills the page height) |
| 4. Page 1877 | page 1877 (standard BC) | wizard, shows the same limit with VAT groups |

Pages 50100 and 50101 show a red note under the title: "No focus on the Order No. field." and "Only five rows."

The test orders (20 sales orders, `TEST-001..020`, customer `TESTKLANT`) are only created and deleted with the tiles **Create test orders** and **Delete test orders**. Buttons 1, 2 and 3 do not create or delete them. Button 4 first deletes existing test orders (after a confirmation), because their customer has a VAT Bus. Posting Group, which makes the VAT Setup show "Manual setup required".

## How to run the test

1. Publish to your sandbox from VS Code (F5, or Ctrl+F5 without debugging).
2. Assign permission set **FDP Repro All** to the test user.
3. In the web client: on the Role Center, choose the tile **Create test orders**.
4. On a phone or tablet in the BC mobile app: use the tile **Mobile Navigate Test** to open the launcher and run each variant.
5. For variants 1, 2 and 3: type `TEST-007` in **Order No.** without tapping the field first.
6. For variant 4: open page 1877 in an environment with more than 5 VAT groups. **Do not choose Finish.**
7. When done, choose the tile **Delete test orders**.
