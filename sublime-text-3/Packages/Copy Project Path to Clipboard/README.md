# Copy Project Path to Clipboard for Sublime Text

Just a small and dumb command to, you guessed it, copy the current *project* path (not the current file path) to the clipboard. Useful to paste the path to your console or your file explorer after switching projects.

You can use the command via the Command Palette or also via shortcut, by default `Alt+Shift+C` on Linux and Windows.

If you want to define your own shortcut:

```
{ "keys": ["alt+q", "alt+c"], "command": "copy_project_path_to_clipboard" },
```
