# Ubuntu 14.04 LTS with Docker in VirtualBox

#### System information

- OS: Ubuntu 14.04 LTS
- Provider: VirtualBox
- RAM: 2GB
- CPUs: 2
- Installed software:
  * docker-engine (latest)
  * docker-compose (v1.8.1)
  * git (latest)
  * nano (latest)
  * Chromium browser (latest)

### Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Running

```shell
git clone git@github.com:mikkopiu/vagrant-environments.git
cd vb-ubuntu14.04-docker
vagrant up --provision --provider virtualbox && vagrant reload && vagrant vbguest --do install && vagrant reload
```

### Extra configuration

Set VM keyboard layout to Finnish from the GUI
```
System Settings > Keyboard > Text Input > + <select Finnish>
```

or from the terminal:
```shell
dpkg-reconfigure keyboard-configuration
```

Copy your SSH key to `~/.ssh`, easiest through the Vagrant folder which is shared by default and mounted to VM at `/vagrant`

Set Git credentials
```shell
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
