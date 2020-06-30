# Bootstrapping Glodo's Odoo Development Environment

- This project will help you bootstrap a development environment for Linux (natively), WSL or a VM (through Vagrant)
- Primarily it is designed to work with Ubuntu based distros
- It is intended to be quick to setup across a series of devices and ensure all staff are working on a similar setup and are not having to debug too many platform issues
- Each Odoo project is setup as a series of containers, built from source code, using Doodba - this is not covered under this repository

## Environment Setup
You will need access to Linux and Docker for a supported development environment.
This repository provides both guides and any applicable code for setting this up under the following:

  * [Linux using Docker (Native)](guides/linux_native.md) - Recommended on Linux
  * [Windows using WSL (Windows Subsystem for Linux)](guides/windows_subsystem_for_linux.md) - Recommended over Virtual Machines under Windows 10 2004 or newer
  * [MacOS, Windows or Linux using Virtual Machines](guides/virtual_machine_using_vagrant.md)

### Environment Maintenance
  
  * You will want to periodically run `docker system prune` to clean up any unused docker containers, images, etc.
  * You may also want to periodically run `docker system prune --volumes`, this will also clean up volumes as well as containers, images, etc.
  * If you are using a VM, or WSL, you should also periodically run `sudo apt-get update && sudo apt-get upgrade`

### Editor/IDE Setup & Code Conventions
Use any editor you like, as long as it has support for [editorconfig](https://editorconfig.org/) and is enabled/installed.

For further conventions please see [guides/code_conventions.md](guides/code_conventions.md).

### Git Client Setup
Ensure your git email and name are correctly configured, where ever you use it. If you are calling git from within WSL/VMs then please ensure it is configured within there as well.

 * Run `git config --global user.email "youremail"`
 * Run `git config --global user.name "your name"`
