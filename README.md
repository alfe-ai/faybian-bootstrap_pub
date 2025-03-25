# Faybian OS / Bootstrap
Faybian OS / Bootstrap: A FLOSS Project which modifies a fresh install of Debian 13 Testing, to add Faybian OS features and customizations.

---
### Prerequisite
- A fresh installation of Debian 13 Testing (amd64)
  - Can be obtained from: https://www.debian.org/devel/debian-installer/  
  - Weekly ISO is suggested: https://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-dvd/

---
### Usage

Download and execute `faybian_bootstrap.sh` from https://github.com/alfe-ai/faybian-bootstrap_pub/raw/refs/heads/main/faybian_bootstrap.sh

You may execute the following one-liner to download and execute the bootstrap script:
```
wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O faybian_bootstrap.sh "https://github.com/alfe-ai/faybian-bootstrap_pub/raw/refs/heads/main/faybian_bootstrap.sh?$(date +%s)" && chmod +x faybian_bootstrap.sh && echo "Please enter root password below." && su -c "./faybian_bootstrap.sh"
```

---
### Helpful Commands

```
wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O faybian_bootstrap.sh "https://github.com/alfe-ai/faybian-bootstrap_pub/raw/refs/heads/main/faybian_bootstrap.sh?$(date +%s)" && cat faybian_bootstrap.sh
```

```
rm faybian_bootstrap.sh && nano faybian_bootstrap.sh && cat faybian_bootstrap.sh 
```

```
chmod +x faybian_bootstrap.sh && su -c "./faybian_bootstrap.sh"
```

---
### Todo

https://extensions.gnome.org/extension/1160/dash-to-panel/

---
### License

Licensed under Creative Commons Zero v1.0 Universal License  
Permissions:
- ✔️ Commercial use
- ✔️ Modification
- ✔️ Distribution
- ✔️ Private use

Please see https://github.com/alfe-ai/faybian-bootstrap_pub/blob/main/LICENSE for more details.


