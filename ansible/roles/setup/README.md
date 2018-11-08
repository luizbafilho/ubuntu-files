Ubuntu Setup
=========

This role has my configs for an ubuntu desktop using i3

Requirements
------------

- Ubuntu Xenial
- Ansible

Role Variables
--------------

The following table lists this role's variables and their default values.

| Variable | Description | Default |
|---|---|---|
| `apt_packages` | A list of packages you want to install w/ `apt` | [lightdm, mate-desktop-environment-extras, i3, arc-theme, numix-gtk-theme, numix-icon-theme, fonts-powerline, fonts-hack, fonts-font-awesome, build-essential, libdbus-1-dev, curl, rofi, lm-sensors, docker-ce, autojump, zsh, pavucontrol] |
| `config_files` | A list of maps describing all the config files you wanna template out | [{ dest: "/home/{{ user }}/.config/i3/config", src: "i3.conf.j2"},{ dest: "/home/{{ user }}/.config/compton.conf", src: "compton.conf.j2"},{ dest: "/home/{{ user }}/.config/i3/i3status-rs.toml", src: "i3status-rs.toml.j2"},{ dest: "/home/{{ user}}/.Xresources", src: "Xresources.j2"}] |
| `dconf_params` | A list of maps describing all the [`dconf(1)`](https://linux.die.net/man/1/dconf) parameters you want to set | [{ key: /org/mate/desktop/session/required-components-list, value: "['windowmanager', 'filemanager', 'dock']"}, { key: /org/mate/desktop/session/required-components/windowmanager, value: "'i3'" }, { key: /org/mate/desktop/background/show-desktop-icons, value: "false" }, { key: /org/mate/desktop/interface/gtk-theme, value: "'Arc-Dark'" }, { key: /org/mate/desktop/interface/icon-theme, value: "'Numix'" }, { key: /org/mate/desktop/font-rendering/dpi, value: "140.0" }, { key: /org/mate/desktop/peripherals/mouse/cursor-size, value: "40" }] |
| `deb_packages` | A list of packages you want to install w/ `dpkg` | ["https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb", "https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable", "https://zoom.us/client/latest/zoom_amd64.deb"] |
| `i3.fontsize` | `i3`'s font size to use overall | 10 |
| `i3.status` | `i3`'s font size to use on it's status bar | 10 |
| `network_interface` | Network card name you're gonna be tracking with `istatus-rs` | `wlp8s0 ` |
| `priv_config_files` | A list of maps describing all the config files you wanna template out that needs privileged access to be placed | [{ dest: "/etc/rc.local", src: "rc.local.j2"}] |
| `screen.dpi` | Screen scale (in dots per inch) you'll wanna use | `140 ` |
| `user` | The username to use across the whole playbook execution. NOTE: This role does not create any users | `luiz` |


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: setup, user: luiz }

License
-------

BSD
