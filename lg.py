#!/usr/bin/env python3
# This is a tool to launch lazygit in the repo of the given file or directory.
# Usage: lg.py [file|directory]
import os, sys, subprocess


sample = os.path.abspath(sys.argv[1] if len(sys.argv) > 1 else os.getcwd())
path = sample if os.path.isdir(sample) else os.path.dirname(sample)
while path != '/':  # walk upwards until we find a .git directory
    if os.path.isdir(os.path.join(path, '.git')):
        break
    path = os.path.dirname(path)
print(f"Launching lazygit at {path}...")
subprocess.run(['lazygit', '-p', path])

