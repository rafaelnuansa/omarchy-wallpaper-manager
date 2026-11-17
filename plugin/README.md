# Theme Wallpaper Manager

A graphical Omarchy bar widget for selecting and adding wallpapers without typing commands. Click the wallpaper icon to open the panel. Opening the picker first syncs supported images from the custom theme source into Omarchy's live theme snapshot, so wallpapers added to the theme become selectable.

- **Pilih wallpaper** opens Omarchy's built-in picker.
- **Tambah gambar ke tema** opens an image chooser, saves the image to the active theme, updates the live theme snapshot, and applies it.
- **Buka folder wallpaper tema** opens the persistent wallpaper folder for the active theme.

For a user theme, the persistent location is `~/.config/omarchy/themes/<slug>/backgrounds/`; the image is also mirrored to Omarchy's active theme snapshot so it appears immediately in the built-in picker. For a stock theme, it uses Omarchy's writable `~/.config/omarchy/backgrounds/<slug>/` folder. The active theme is detected each time, so the plugin works after switching themes.

Supported formats match the Omarchy picker: PNG, JPG/JPEG, GIF, BMP, and WebP. Duplicate filenames get a timestamp suffix and are never overwritten.
