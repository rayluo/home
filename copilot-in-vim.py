"""Setup copilot in vim"""
import os, pathlib, shutil, stat, subprocess, sys, tempfile, urllib.request


def setup_node(
    download_dir: pathlib.Path,
    source="https://nodejs.org/dist/v21.5.0/node-v21.5.0-linux-x64.tar.xz",  # Came from https://nodejs.org/en/download/current
    unzip_dir="/tmp",
    executable_path=os.path.expanduser("~"),
):
    filename = download_dir / "node.tar.xz"
    with open(filename, "wb") as f:
        f.write(urllib.request.urlopen(source).read())
    shutil.unpack_archive(filename, unzip_dir)
    subprocess.run(f"ln -s {unzip_dir}/node-v21.5.0-linux-x64/bin/node {executable_path}", shell=True)


def ensure_home_path():
    detector = "check_whether_home_is_in_path.sh"
    detector_in_home = os.path.expanduser(f"~/{detector}")
    with open(detector_in_home, "w") as f:
        f.write("echo hello world")
    os.chmod(detector_in_home, os.stat(detector_in_home).st_mode | stat.S_IEXEC)
    if not shutil.which(detector):
        sys.exit("Error: Do this once to ensure your home is in PATH: export PATH=$PATH:~")


def setup_copilot_plugin():
    plugin_location = "~/.vim/pack/github/start/copilot.vim"
    if not os.path.exists(os.path.expanduser(plugin_location)):
        subprocess.run(  # Derivef from https://github.com/github/copilot.vim
            f"git clone https://github.com/github/copilot.vim.git {plugin_location}",
            shell=True)
        print("Setup copilot plugin for Vim ... OK")
    else:
        print("Copilot plugin already exists ... OK")


ensure_home_path()
print("Files in HOME is executable ... OK")
with tempfile.TemporaryDirectory() as tmpdirname:
    if not shutil.which("node"):
        setup_node(pathlib.Path(tmpdirname))
    print("Setup node ... OK")
setup_copilot_plugin()

print("If you haven't already, go download a recent vim AppImage from here: "
    "https://github.com/vim/vim-appimage/releases")
print("Restart Vim, and then run `:Copilot setup` in your vim")

