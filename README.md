# Cross-platform Standardised Odoo Development Environment
## (for dockery-odoo based projects)

Each project is setup as a series of containers, built from source code.
All Odoo projects (at this time) are based upon either the edge or stable versions of [Dockery](https://xoe-labs.github.io/dockery-odoo/).

## Environment Setup
You will need access to Linux and Docker for a supported development environment.
This repository provides both guides and any applicable code for setting this up under the following:

  * [Linux using Docker (Native)](guides/linux_native.md)
  * [Windows using WSL (Windows Subsystem for Linux)](guides/windows_subsystem_for_linux.md)
  * [MacOS, Windows or Linux using Virtual Machines](guides/virtual_machine_using_vagrant.md)

### Editor/IDE Setup & Code Conventions
Use any editor you like, as long as it has support for [editorconfig](https://editorconfig.org/) and is enabled/installed.

For further conventions please see [guides/code_conventions.md](guides/code_conventions.md).

### Git Client Setup
Ensure your git email and name are correctly configured, where ever you use it. If you are calling git from within WSL/VMs then please ensure it is configured within there as well.

 * Run `git config --global user.email "youremail"`
 * Run `git config --global user.name "your name"`

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
