import os
import subprocess

# Execute script to toggle theme mode.
subprocess.call(["sh", os.path.expanduser("~/.config/scripts/toggle-light-dark-themes.sh")])

# Reload tmux config.
keyboard.send_keys("<alt>+q")
keyboard.send_keys("r")

# Detach tmux.
keyboard.send_keys("<alt>+q")
time.sleep(0.1)
keyboard.send_keys("d")

# Close konsole. Must be reopened manually.
time.sleep(0.5)
keyboard.send_keys("<ctrl>+<shift>+w")