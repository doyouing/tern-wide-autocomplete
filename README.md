# Tern Wide Autocomplete

A small **Tern UI plugin** that widens OMP's native autocomplete menus and aligns them with the composer in Tern's **Reader** layout.

This is not an OMP plugin or extension. Install and manage it with Tern's `tern plugin` commands, not OMP's `/plugins` commands. It targets Tern's native OMP autocomplete UI, not general shell completion or every application's autocomplete.

## What it changes

The plugin applies CSS only to overlays with the `omp.autocomplete` role:

- **Reader:** centers the popup horizontally and matches the composer's 736px maximum logical width and responsive gutters, accounting for Tern's UI zoom. Native vertical placement at the caret is preserved.
- **Other chat layouts:** uses a 720px popup width, constrained to fit the pane with at least 8px clearance on each side.
- Removes the generic anchored-overlay padding to avoid a doubled border, and allows the popup to shrink in narrow panes.

It does not change completion results, keyboard behavior, or unrelated popups. Long single-line descriptions can still be ellipsized in narrow panes; widening the menu does not guarantee that every description is fully visible.

## Requirements

- Tern with its plugin system and OMP autocomplete UI.
- OMP running inside Tern.
- Git on `PATH` for installation directly from GitHub.

There are no additional runtime dependencies, package-manager setup, or build steps. The only Luau entry point registers CSS with `tern.css`.

## Install

Run in a terminal on the machine displaying your Tern windows:

```sh
tern plugin install github.com/doyouing/tern-wide-autocomplete
```

Installation normally applies live; restarting OMP is not required. If Tern is not running, the plugin loads on the next start.

List installed Tern plugins, explicitly reload them, or locate the plugins directory:

```sh
tern plugin list
tern plugin reload
tern plugin dir
```

The plugin ID is **`tern-wide-autocomplete`**; the current package version is **1.0.3**. Open an OMP composer and type `/` or `/model` to see the menu. `tern plugin list` confirms the package is registered, but its daemon catalog does not detect every window-side loading error.

## Update or remove

Reinstall from the repository's default branch to update:

```sh
tern plugin install github.com/doyouing/tern-wide-autocomplete --force
```

**`--force` replaces the installed package, including any custom edits inside it.** Save those edits elsewhere first. It does not replace a linked development checkout; unlink that checkout before installing a copy.

Remove an installed copy:

```sh
tern plugin remove tern-wide-autocomplete
```

For a linked checkout, use `tern plugin unlink tern-wide-autocomplete` instead; unlinking leaves the checkout intact.

## Local checkout and development

```sh
git clone https://github.com/doyouing/tern-wide-autocomplete.git
cd tern-wide-autocomplete
```

To install a copy of the checkout:

```sh
tern plugin install .
```

Use `tern plugin install . --force` to replace an existing installed copy. Edits to the checkout do not affect that copy until you reinstall.

For live development, link the checkout instead. An installed copy and a development link cannot share the same plugin ID. If a copy is already installed, preserve any custom edits and remove it first:

```sh
tern plugin remove tern-wide-autocomplete
```

Then, from the checkout:

```sh
tern plugin link .
```

Tern watches the linked directory and reloads on edits. Update a linked checkout with `git pull`; use `tern plugin reload` when an explicit reload is needed. To return to a normal installation:

```sh
tern plugin unlink tern-wide-autocomplete
tern plugin install github.com/doyouing/tern-wide-autocomplete
```

## Tested scope and compatibility

The layout rules were verified with **Tern 0.9.5** and **OMP 18.12.6** on **macOS Apple Silicon**, using the **Reader** layout:

- Viewport widths: 320, 420, 600, 760, 800, 1000, and 1280px.
- Font sizes: 13, 16, and 20.
- Autocomplete opened by typing `/` and `/model`.
- The final 21 geometry scenarios measured popup-to-composer horizontal edge differences of at most 0.01px.

Precise edge alignment was verified only in Reader. Other layouts retain the general 720px rule but have not received the same geometry verification. Other platforms, versions, and skins are not claimed as tested. There is no permanent automated test suite.

User-installed plugin files normally survive Tern app updates. Compatibility is not guaranteed across updates: this plugin relies on Tern's internal CSS selectors, layout dimensions, and `--sf-zoom` behavior, which may change.

## Package layout

The repository is directly installable, with `plugin.toml` at its root:

```text
tern-wide-autocomplete/
  plugin.toml
  window.luau
  README.md
  LICENSE
```

- `plugin.toml`: package identity, version, and window entry point.
- `window.luau`: scoped autocomplete CSS registered through `tern.css`.
- `README.md`: installation, behavior, and compatibility notes.
- `LICENSE`: MIT license terms.

For Tern's package-management and styling details, see the official [distribution guide](https://docs.stencil.so/tern/guides/distribution.html), [CLI reference](https://docs.stencil.so/tern/reference/cli.html), and [global CSS documentation](https://docs.stencil.so/tern/guides/chrome.html#global-css).

## License

[MIT](LICENSE). Copyright (c) 2026 kkange.
