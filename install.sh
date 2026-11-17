#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd -- "$(dirname -- "$0")" && pwd)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
plugin_dir="$config_home/omarchy/plugins/rafael.wallpaper"
mkdir -p "$plugin_dir"
cp -a "$repo_dir/plugin/." "$plugin_dir/"
python - "$config_home/omarchy/shell.json" <<'PYJSON'
import json, pathlib, sys
p=pathlib.Path(sys.argv[1])
data=json.loads(p.read_text())
right=data.setdefault("bar",{}).setdefault("layout",{}).setdefault("right",[])
if not any(x.get("id")=="rafael.wallpaper" for x in right):
    index=next((i+1 for i,x in enumerate(right) if x.get("id")=="omarchy.tray"),len(right))
    right.insert(index,{"id":"rafael.wallpaper"})
p.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n")
PYJSON
omarchy restart shell
printf 'Wallpaper Manager installed.\n'
