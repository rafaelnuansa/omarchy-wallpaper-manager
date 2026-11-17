import QtQuick
import QtQuick.Dialogs
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Commons as Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "rafael.wallpaper"
  property bool panelOpen: false
  readonly property string helperPath: Quickshell.env("HOME") + "/.config/omarchy/plugins/rafael.wallpaper/bin/rafael-wallpaper-tool"

  function togglePanel() { panelOpen = !panelOpen }
  function close() { panelOpen = false }

  implicitWidth: trigger.implicitWidth
  implicitHeight: trigger.implicitHeight

  BarIconButton {
    id: trigger
    anchors.fill: parent
    bar: root.bar
    text: "󰸉"
    slotSize: Style.bar.statusSlot
    tooltipText: "Wallpaper"
    onPressed: function(mouseButton) { root.togglePanel() }
  }

  PopupCard {
    id: panel
    anchorItem: trigger
    bar: root.bar
    owner: root
    open: root.panelOpen
    contentWidth: Style.space(340)
    contentHeight: actions.implicitHeight + Style.space(32)

    Column {
      id: actions
      anchors.fill: parent
      spacing: Style.space(8)

      Text {
        text: "Wallpaper tema"
        textFormat: Text.PlainText
        color: Commons.Color.popups.text
        font.family: Style.font.family
        font.pixelSize: Style.font.title
        font.bold: true
      }
      Text {
        text: "Pilih wallpaper atau tambahkan gambar ke tema yang sedang aktif."
        textFormat: Text.PlainText
        color: Commons.Color.popups.text
        opacity: 0.78
        wrapMode: Text.Wrap
        width: actions.width
        font.family: Style.font.family
        font.pixelSize: Style.font.bodySmall
      }
      Button {
        width: actions.width
        text: "Pilih wallpaper"
        iconText: "󰸉"
        bordered: true
        onClicked: { root.panelOpen = false; root.bar.run("omarchy theme bg-switcher") }
      }
      Button {
        width: actions.width
        text: "Tambah gambar ke tema"
        iconText: "󰐕"
        bordered: true
        onClicked: imageDialog.open()
      }
      Button {
        width: actions.width
        text: "Buka folder wallpaper tema"
        iconText: ""
        bordered: true
        onClicked: {
          folderProcess.command = [root.helperPath, "open-folder"]
          folderProcess.running = true
          root.panelOpen = false
        }
      }
      Button {
        width: actions.width
        text: "Tutup"
        bordered: true
        onClicked: root.panelOpen = false
      }
    }
  }

  FileDialog {
    id: imageDialog
    title: "Tambahkan wallpaper ke tema aktif"
    currentFolder: "file://" + Quickshell.env("HOME")
    nameFilters: ["Gambar wallpaper (*.png *.jpg *.jpeg *.webp *.avif)"]
    onAccepted: {
      addProcess.command = [root.helperPath, "add", selectedFile.toLocalFile()]
      addProcess.running = true
      root.panelOpen = false
    }
  }

  Process {
    id: addProcess
    onExited: function(exitCode) {
      if (exitCode !== 0) console.warn("Wallpaper could not be added")
    }
  }

  Process { id: folderProcess }
}
