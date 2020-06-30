# Windows using WSL (Windows Subsystem for Linux)
:warning: Ensure you using WSL2[1] and your instance is using WSL2. WSL1 is unusably slow for Odoo and . It's unusably slow.

  1. Ensure WSL is installed - https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
  2. Ensure you are using WSL2 by default `wsl --set-default-version 2`
  2. If not already installed, install Ubuntu from the Windows App Store.
     * If Ubuntu was already installed, convert it to WSL2
  2. Open the Ubuntu WSL instance from the start menu, and inside the instance;
     * Run `mkdir -p ~/Code && cd ~/Code`
     * Clone this repository and run `sudo ./provision.sh $USER`
  3. Shutdown and restart the WSL instance. Although you can workaround the core need for this, I've found failure to do so results in other oddities.
     * Run `wsl --shutdown Ubuntu` from Windows (not within the Ubuntu WSL instance)
     * Restart the WSL instance
  4. If you are running WSL1, after the first start up (everytime you reboot) you will need to run `sudo service docker start`
  5. You can access `~/Code` from the host by following the path `\\wsl$\Ubuntu\home\YOURUSERNAME\Code`
     * Ensure you clone any projects from within the WSL instance, under `~/Code`
  6. Follow any project specific instructions


## Tips
  * Mapping network drives to the `\\wsl$\Ubuntu\...` path sometimes fails across different Insider builds
    However mapping directly to the distro via the GUI always works; https://github.com/microsoft/WSL/issues/3854#issuecomment-465886991

[1] As of time of writing WSL2 is only available on Windows 10 Release 2004, or Windows 10 Insider >= build 18917. If you are on insider builds ensure you are running >= build 19037 (prior versions are somewhat buggy).
