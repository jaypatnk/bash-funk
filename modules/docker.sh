#!/usr/bin/env bash
#
# Copyright 2015-2019 by Vegard IT GmbH, Germany, https://vegardit.com
# SPDX-License-Identifier: Apache-2.0
#
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/docker.md
#


function -is-loadable() {
    hash docker &>/dev/null
}

if ${BASH_FUNK_PREFIX:--}is-loadable; then
function -dockly() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-dockly() {
    local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
        for __arg in "$@"; do
        case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        if [[ $__optionWithValue == "--" ]]; then
            __params+=("$__arg")
            continue
        fi
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Starts Dockly (https://lirantal.github.io/dockly/)."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue="--"
              ;;
            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    ######### dockly ######### START

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly

    ######### dockly ######### END
}
function __complete-dockly() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}dockly -- ${BASH_FUNK_PREFIX:--}dockly

function -swarm-cluster-id() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-swarm-cluster-id() {
    local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
        for __arg in "$@"; do
        case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        if [[ $__optionWithValue == "--" ]]; then
            __params+=("$__arg")
            continue
        fi
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Prints the Swarm cluster ID."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue="--"
              ;;
            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    ######### swarm-cluster-id ######### START

docker info 2>/dev/null | grep --color=never -oP '(?<=ClusterID: ).*'

    ######### swarm-cluster-id ######### END
}
function __complete-swarm-cluster-id() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}swarm-cluster-id -- ${BASH_FUNK_PREFIX:--}swarm-cluster-id

function -test-docker() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-docker() {
    local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
        for __arg in "$@"; do
        case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        if [[ $__optionWithValue == "--" ]]; then
            __params+=("$__arg")
            continue
        fi
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue="--"
              ;;
            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    ######### test-docker ######### START

${BASH_FUNK_PREFIX:--}dockly --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}swarm-cluster-id --selftest && echo || return 1

    ######### test-docker ######### END
}
function __complete-test-docker() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-docker -- ${BASH_FUNK_PREFIX:--}test-docker


function -help-docker() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}dockly\033[0m  -  Starts Dockly (https://lirantal.github.io/dockly/)."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}swarm-cluster-id\033[0m  -  Prints the Swarm cluster ID."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-docker\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( dockly swarm-cluster-id test-docker )

else
    echo "SKIPPED"
fi
unset -f -- ${BASH_FUNK_PREFIX:--}is-loadable
