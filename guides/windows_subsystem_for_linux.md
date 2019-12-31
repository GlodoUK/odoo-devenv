# Windows using WSL (Windows Subsystem for Linux)
:warning: Do not bother using WSL1. It's unusably slow. Ensure you are on WSL2[1] and your instance is using WSL2.

:warning: Ensure you are running at least Windows 10 build 19037 or newer for WSL2. Prior versions are somewhat buggy.

  1. If not already installed, install Ubuntu from the Windows App Store
  2. Open the Ubuntu WSL instance from the start menu, and inside the instance;
     * Run `mkdir -p ~/Code && cd ~/Code`
     * Clone this repository and run `sudo ./provision.sh $USER`
  3. Shutdown and restart the WSL instance. Although you can workaround the core need for this, I've found failure to do so results in other oddities.
     * Run `wsl --shutdown Ubuntu` from Windows (not within the Ubuntu WSL instance)
     * Restart the WSL instance
  4. After start up from within the WSL instance start up Docker;
     * `sudo service docker start`
     * :warning: You will need to do this each start up until https://github.com/microsoft/WSL/issues/994 is solved
  5. You can access `~/Code` from the host by following the path `\\wsl$\Ubuntu\home\YOURUSERNAME\Code`
     * Ensure you clone any projects from within the WSL instance, under `~/Code`
  6. Follow any project specific instructions


## Tips
  * Mapping network drives to the `\\wsl$\Ubuntu\...` path sometimes fails across different Insider builds. However mapping directly to the distro via the GUI always works; https://github.com/microsoft/WSL/issues/3854#issuecomment-465886991

[1] As of time of writing WSL2 is only available on Windows 10 build 18917 or newer (Insider at time of writing). 
See https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
