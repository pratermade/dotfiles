# How to Replicate My tmux Setup

This guide walks you through setting up the same tmux environment used on this machine:
**tmux 3.6b** on **macOS (26.5.1)** with a Catppuccin theme, mouse support, arrow-key pane navigation, and a top-aligned status bar showing CPU, RAM, battery, uptime, and session info.

---

## 1. Install tmux

### macOS (Homebrew)
```bash
brew install tmux
```

### Linux (Debian/Ubuntu)
```bash
sudo apt install tmux
```

### Linux (Fedora)
```bash
sudo dnf install tmux
```

### Linux (Arch)
```bash
sudo pacman -S tmux
```

---

## 2. Install TPM (tmux Plugin Manager)

TPM manages all the plugins. Clone it into `~/.config/tmux/plugins/tpm`:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

---

## 3. Install Plugins

All plugins live under `~/.config/tmux/plugins/`. Clone each one:

### Catppuccin Theme
```bash
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin
```

### tmux-cpu (CPU usage display)
```bash
git clone https://github.com/tmux-plugins/tmux-cpu.git ~/.config/tmux/plugins/tmux-cpu
```

### tmux-battery (Battery indicator)
```bash
git clone https://github.com/tmux-plugins/tmux-battery.git ~/.config/tmux/plugins/tmux-battery
```

### tmux-mem-cpu-load (Optional — installed but not active in config)
```bash
git clone https://github.com/thewtex/tmux-mem-cpu-load.git ~/.config/tmux/plugins/tmux-mem-cpu-load
```

---

## 4. Install tmux Configuration

Create or replace `~/.tmux.conf` with the included tmux.conf

---

## 6. Load the Configuration

Either restart tmux entirely, or reload the config from within tmux:

1. Press `Ctrl-b` then `r` (the `bind r source-file` line makes this work)
2. Or exit all tmux sessions and start fresh:
   ```bash
   tmux kill-server
   tmux
   ```

---

## 7. Install Additional Plugins via TPM (optional)

To add more plugins managed by TPM, edit `~/.tmux.conf` and add them to the `@plugin` list:

```bash
set -g @plugin 'other-user/other-plugin'
```

Then within tmux press `Ctrl-b` then `I` (capital i) to install.

---

## 8. Customizing the Catppuccin Theme

The Catppuccin theme can be customized by setting variables before it's loaded. For example, to pick a specific flavor, add this line **before** the `run catppuccin.tmux` line in `~/.tmux.conf`:

```bash
set -g @catppuccin_flavor 'mocha'   # options: latte, frappe, macchiato, mocha
```

---

## 9. Known Notes

- **tmux-mem-cpu-load** is cloned in `~/.config/tmux/plugins/` but not referenced in the active config. Remove it if unused.
- The **battery plugin** only shows useful info on laptops. On a desktop, it will likely show nothing or `N/A`.
- The old `~/.tmux/` directory (containing a separate copy of `tpm`, `tmux-cpu`, `tmux-battery`) is a legacy install. The active config uses `~/.config/tmux/plugins/` only. You can safely remove `~/.tmux/`.

## 10. Catppuccin Plugin Structure

Catppuccin changed its directory layout between versions. Make sure your clone uses the **flat structure** (files directly in the plugin directory, not inside a `tmux/` subdirectory). If the status bar is blank or shows errors, re-clone the plugin:

```bash
rm -rf ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin
```

Then reload tmux: `Ctrl-b r` (or `tmux source-file ~/.tmux.conf`).

