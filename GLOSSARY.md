# Glossary

Taal van dit project: Nederlands. AL-termen blijven Engels.

## Doel

**Repro-extensie**
Een kleine BC-extensie die alleen bestaat om een gedragsverschil in de BC-client aan te tonen. Geen productiecode.
_Niet:_ testapp, demo-app.

## Varianten

**Overzicht**
De lijst met records op de pagina waaruit een gebruiker een nummer kiest. Technisch een repeater, direct op de pagina of in een subform.
_Niet:_ grid.

**Selectieveld**
Het invoerveld boven het Overzicht. Een nummer typen kiest een record uit het Overzicht. Het veld hoort de focus te hebben zodra de pagina opent.
_Niet:_ zoekveld, scanveld.

**Repeater-variant** (page 50100, `FDP Navigate Repeater`)
Een NavigatePage met het Overzicht als repeater direct op de pagina, zonder part.

**Subform-variant** (page 50101, `FDP Navigate Subform`)
Een NavigatePage met het Overzicht in een subform: een ListPart met repeater.
_Niet:_ SubPage.

**Standaardvariant**
Page 1877 uit de standaard BC, als referentie die dezelfde bug toont. Het is een wizard die BTW-groepen aanmaakt in een nieuwe omgeving.

## Waarnemingen

**Vijf-records-limiet**
In de mobiele BC-app toont een Overzicht in een Subform-variant maximaal 5 records. Het 6e record verschijnt niet. Te testen: of de Repeater-variant alle records toont.

**Focusverschil**
Een mogelijk verschil in of het Selectieveld de focus krijgt zodra de pagina opent, tussen de Repeater-variant en de Subform-variant. Nog te testen.

**Mobiele app**
De BC-app op telefoon of tablet. Dit is de client waarin de bugs zich voordoen. De Phone- en Tablet-client in de browser tellen niet als bewijs.

## Testdata

**Testorder**
Een door de Repro-extensie aangemaakte verkooporder (`TEST-001` t/m `TEST-020`). Er moeten er meer dan 5 zijn, anders is de Vijf-records-limiet niet te zien.
