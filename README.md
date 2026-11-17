# Omarchy Wallpaper Manager

A GUI bar widget for changing the wallpaper or adding an image to the currently active Omarchy theme.

## GUI

Click the picture icon in the Omarchy bar. The panel offers:

- **Pilih wallpaper** — opens the built-in Omarchy wallpaper picker.
- **Tambah gambar ke tema** — opens a graphical image chooser, copies the image to the active theme's wallpaper directory, and applies it.
- **Buka folder wallpaper tema** — opens the same destination folder used by the add action.

Supported formats: PNG, JPG/JPEG, WebP, and AVIF. A duplicate filename gets a timestamp suffix instead of being overwritten.

## Wallpaper destination

The plugin reads the active theme slug from `~/.local/state/omarchy/current/theme.name` each time it runs:

- User themes in `~/.config/omarchy/themes/<slug>/` use `~/.config/omarchy/themes/<slug>/backgrounds/`.
- Stock themes use `~/.config/omarchy/backgrounds/<slug>/`, following Omarchy's user-background convention.

## Install

Run `./install.sh` from this repository. It copies the plugin into `~/.config/omarchy/plugins/rafael.wallpaper`, adds it to the bar's right group in `shell.json`, and restarts Omarchy Shell.

All plugin code and image-copy operations run locally. The plugin does not download images.
