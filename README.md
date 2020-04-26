To run this, modify hosts.yaml to point at the machine you want to set up and run
the following from the repository:

    ANSIBLE_ROLES_PATH=roles ansible-playbook playbooks/setup.yaml -i hosts.yaml --ask-become-pass

TODO:

- set Fira Mono as default font
- set zsh as default shell
- uninstall gnome-desktop
