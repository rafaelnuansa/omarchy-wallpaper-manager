# Theme Wallpaper Picker

A local Omarchy bar widget for the active theme.

- Left click: open Omarchy's wallpaper picker.
- Middle click: choose an image, copy it into the active theme's `backgrounds/`, and apply it.
- Right click: open Omarchy's per-theme wallpaper folder.
- CLI: `rafael-wallpaper-tool add /path/to/image`.

Supported image formats: PNG, JPG/JPEG, WebP, AVIF. The add action copies the image into `~/.config/omarchy/themes/<active-theme>/backgrounds/`; it never deletes or overwrites an existing wallpaper.
