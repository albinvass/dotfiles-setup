#!/bin/sh


# Thanks ohmyzsh
# Default settings
REPO=${REPO:-albinvass/dotfiles-setup}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
DOTS=${DOTS:-~/.adots}
CLONE=${CLONE:-yes}
COPY=${COPY:-no}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

clone_repo() {
    git clone \
        --branch "$BRANCH"\
        "$REMOTE" "$DOTS" || {
        error "Git clone of dots failed"
        exit 1
    }
}

main() {
    setup_color

    if stat "$DOTS" 1>/dev/null 2>&1; then
        rm -rf "$DOTS"
    fi

	# Parse arguments
	while [ $# -gt 0 ]; do
		case $1 in
            --local) REMOTE=$(dirname $(dirname $0)) ;;
		esac
		shift
	done

    clone_repo

    cd "$DOTS"
    pip3 install --user ansible
    export ANSIBLE_ROLES_PATH=roles
    ansible-playbook playbooks/setup.yaml \
        --ask-become-pass \
        -i hosts.yaml
}

main "$@"
