-- Keep OMP completion menus readable without changing other Tern popups.
-- Anchored placement already keeps 8px clear of the pane. Removing the generic
-- overlay padding keeps the card, its rim and its contents on the same width.
tern.css("autocomplete-width", [[
.sf-overlay.at-caret[data-role="omp.autocomplete"] {
    padding: 0;
}

.sf-overlay[data-role="omp.autocomplete"] > .sf-ov-card {
    width: 720px;
    min-width: 0;
    max-width: calc(100% - 16px);
}

/* Match Reader's 736px composer and its gutters: the dock's 10px is unscaled,
   while the composer's 12px follows UI zoom. Keep native vertical placement. */
.sf-chat-reader .sf-overlay.at-caret[data-role="omp.autocomplete"] > .sf-ov-card {
    width: 736px;
    max-width: calc(100% - 24px - 20px / var(--sf-zoom, 1));
    left: 50% !important;
    translate: -50% 0;
}
]])
