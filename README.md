# Cross-platform Standardised Odoo Development Environment
## (for dockery-odoo based projects)

### Linux using Docker (Native)
  1. Ensure both docker CE, docker-compose and git are installed through your distro's package manager
  2. Ensure your git email and name are correctly configured
     * Run `git config --global user.email "youremail"`
     * Run `git config --global user.name "your name"`
  3. Follow any project specific instructions past

### MacOS, Windows or Linux using Virtual Machines
  * This will pre-configure a VM for you, with the necessary development environment pre-reqs for most Odoo related projects
    * The instructions will have you checkout all code inside the VM. This is to speed up disk access, and enable hot code reloading reliably across all OS'. If you attempt to do the reverse you'll have serious development slow downs.
  * If you are on Linux, it is *highly* recommended to use Docker natively (see above), rather than VMs
  * It is *not* recommended to use a VM per-project, at this time, but reuse it for multiple projects.
  * If you are migrating from a previous version of our dev environment that uses Unison for file syncing between host and guest VM, ensure you have pushed any work to the origin repository, delete the existing VM and cloned repo(s) and start over with these instructions.

  1. Ensure you have [git](https://git-scm.com/) (or any other git client installed), plus one of the following virtualisation environments are installed;
     * [VirtualBox](https://www.virtualbox.org/)
     * [Parallels](https://www.parallels.com/)
     * VMware Fusion or Vagrant VMware Workstation
     * HyperV [1]
     * libvirt [2]
  2. Ensure [vagrant](https://www.vagrantup.com/) is installed
  3. Clone this repository and run `vagrant up` from the checked out directory
  4. Your development environment is now setup
     * Run `vagrant ssh` to enter the VM
       * Run `git config --global user.email "youremail"`
       * Run `git config --global user.name "your name"`
       * Ensure you clone any projects from within the VM, into `~/Code`
       * You can access `~/Code` from the host by following the network sharing
         instructions from the `vagrant up` command.
     * From the host, in a terminal window open to the cloned directory:
       * To shutdown the VM you can issue `vagrant halt` at anytime
       * To boot up the VM you can issue `vagrant up` at anytime
       * To destroy the VM you can issue `vagrant destroy` at anytime
  5. Follow any project specific instructions

[1] Due to how Hyper-V works you will see issues with port forwarding, etc. not working as expected. 
    You will need to access the VM via the IP address assigned, rather than localhost.
[2] Requires [libvirt provider](https://github.com/vagrant-libvirt/vagrant-libvirt) to be installed.

### Windows using WSL (Windows Subsystem for Linux)
:warning: Do not bother using WSL1. It's unusably slow. Ensure you are on WSL2[1] and your instance is using WSL2.

  1. If not already installed, install Ubuntu from the Windows App Store
  2. Open the Ubuntu WSL instance from the start menu
     * Run `mkdir -p ~/Code && cd ~/Code`
     * Clone this repository and run `sudo ./provision.sh $USER`
     * Close and reopen the WSL instance
  3. You can access `~/Code` from the host by following the path `\\wsl$\Ubuntu\home\YOURUSERNAME\Code`
     * Ensure you clone any projects from within the WSL instance, under `~/Code`
  4. Follow any project specific instructions

[1] As of time of writing WSL2 is only available on Windows 10 build 18917 (Insider at time of writing). 
See https://docs.microsoft.com/en-us/windows/wsl/wsl2-install

## Editor/IDE Setup
  * Use any editor you like, as long as it has support for [editorconfig](https://editorconfig.org/)

## General Dockery-Odoo Development Tips
  * Edit your code on your desktop using any editor of your choice. Code should hot reload.
  * With the web debugger enabled (which it is by default) any exceptions that occur will result in a clickable link in the Odoo logs.

  * Most dockery-odoo projects are setup with a docker-compose.yml, allowing you to
    * `docker-compose up odoo` will give you an Odoo install running at
      http://localhost/ with hot code reload enable and web debugger setup
    * `docker-compose run shell -d database` will give you an Odoo
      shell connected to `database`
    * `docker-compose run scaffold new_module_name` will generate a scaffold
      for a new custom module in the `src` directory with that given module name
    * `docker-compose run tests -i module_to_test -d database` will run any tests 
      for a given module, and if not already installed the dependent modules.
    * Investigate per-project docker-compose.yml for additional info.
  * `sudo docker system prune --volumes` will help reduce the file size of any docker images overtime.