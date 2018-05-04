#!/usr/bin/env bash
#
# Copyright 2015-2018 by Vegard IT GmbH, Germany, https://vegardit.com
# SPDX-License-Identifier: Apache-2.0
# 
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/compression.md
#

function -tar-gz() {
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
        echo; echo "Usage: $__fn [OPTION]... ARCHIVE PATH1 [PATH]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-tar-gz() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _checkpoint _help _selftest _ARCHIVE _PATH=()
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... ARCHIVE PATH1 [PATH]..."
                echo
                echo "Compresses the given files using tar and gzip displaying a real-time progress bar."
                echo
                echo "Requirements:"
                echo "  + Command 'cut' must be available."
                echo "  + Command 'du' must be available."
                echo "  + Command 'tail' must be available."
                echo "  + Command 'tar' must be available."
                echo "  + Command 'gzip' must be available."
                echo
                echo "Parameters:"
                echo -e "  \033[1mARCHIVE\033[22m (required, file)"
                echo "      The file path of the archive to create."
                echo -e "  \033[1mPATH\033[22m (1 or more required, path)"
                echo "      Files and directories to compress."
                echo
                echo "Options:"
                echo -e "\033[1m    --checkpoint\033[22m "
                echo "        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin."
                echo "    -----------------------------"
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

            --checkpoint)
                _checkpoint=1
            ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
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
        if [[ ! $_ARCHIVE ]]; then
            _ARCHIVE=$__param
            continue
        fi
        _PATH+=("$__param")
        continue
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_ARCHIVE ]]; then
        if [[ -e "$_ARCHIVE" && ! -f "$_ARCHIVE" ]]; then echo "$__fn: Error: Path '$_ARCHIVE' for parameter ARCHIVE is not a file."; return 64; fi
    else
        echo "$__fn: Error: Parameter ARCHIVE must be specified."; return 64
    fi
    if [[ ${#_PATH[@]} -lt 1 ]]; then echo "$__fn: Error: For parameter PATH 1 value(s) must be specified. Found: ${#_PATH[@]}."; return 64; fi
    if [[ $_PATH ]]; then
        local __param
        for __param in "${_PATH[@]}"; do
        true
        done
    fi

    if ! hash "cut" &>/dev/null; then echo "$__fn: Error: Required command 'cut' not found on this system."; return 64; fi
    if ! hash "du" &>/dev/null; then echo "$__fn: Error: Required command 'du' not found on this system."; return 64; fi
    if ! hash "tail" &>/dev/null; then echo "$__fn: Error: Required command 'tail' not found on this system."; return 64; fi
    if ! hash "tar" &>/dev/null; then echo "$__fn: Error: Required command 'tar' not found on this system."; return 64; fi
    if ! hash "gzip" &>/dev/null; then echo "$__fn: Error: Required command 'gzip' not found on this system."; return 64; fi

    ######### tar-gz ######### START

if hash pv && [[ ! $_checkpoint ]]; then
    local total_bytes=$(du -csb "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar -cf - "${_PATH[@]}" | pv -s $total_bytes | gzip > "$_ARCHIVE"
else
    printf '=> %s\n' "${_PATH[@]}"
    local total_kb=$(du -csk "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar cfvz "${_ARCHIVE}" "${_PATH[@]}" --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi

    ######### tar-gz ######### END
}
function __complete-tar-gz() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --checkpoint --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}tar-gz -- ${BASH_FUNK_PREFIX:--}tar-gz

function -tar-zstd() {
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
        echo; echo "Usage: $__fn [OPTION]... ARCHIVE PATH1 [PATH]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-tar-zstd() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _checkpoint _help _selftest _ARCHIVE _PATH=()
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... ARCHIVE PATH1 [PATH]..."
                echo
                echo "Compresses the given files using tar and zstd (https://github.com/facebook/zstd) displaying a real-time progress bar."
                echo
                echo "Requirements:"
                echo "  + Command 'cut' must be available."
                echo "  + Command 'du' must be available."
                echo "  + Command 'tail' must be available."
                echo "  + Command 'tar' must be available."
                echo "  + Command 'zstd' must be available."
                echo
                echo "Parameters:"
                echo -e "  \033[1mARCHIVE\033[22m (required, file)"
                echo "      The file path of the archive to create."
                echo -e "  \033[1mPATH\033[22m (1 or more required, path)"
                echo "      Files and directories to compress."
                echo
                echo "Options:"
                echo -e "\033[1m    --checkpoint\033[22m "
                echo "        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin."
                echo "    -----------------------------"
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

            --checkpoint)
                _checkpoint=1
            ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
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
        if [[ ! $_ARCHIVE ]]; then
            _ARCHIVE=$__param
            continue
        fi
        _PATH+=("$__param")
        continue
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_ARCHIVE ]]; then
        if [[ -e "$_ARCHIVE" && ! -f "$_ARCHIVE" ]]; then echo "$__fn: Error: Path '$_ARCHIVE' for parameter ARCHIVE is not a file."; return 64; fi
    else
        echo "$__fn: Error: Parameter ARCHIVE must be specified."; return 64
    fi
    if [[ ${#_PATH[@]} -lt 1 ]]; then echo "$__fn: Error: For parameter PATH 1 value(s) must be specified. Found: ${#_PATH[@]}."; return 64; fi
    if [[ $_PATH ]]; then
        local __param
        for __param in "${_PATH[@]}"; do
        true
        done
    fi

    if ! hash "cut" &>/dev/null; then echo "$__fn: Error: Required command 'cut' not found on this system."; return 64; fi
    if ! hash "du" &>/dev/null; then echo "$__fn: Error: Required command 'du' not found on this system."; return 64; fi
    if ! hash "tail" &>/dev/null; then echo "$__fn: Error: Required command 'tail' not found on this system."; return 64; fi
    if ! hash "tar" &>/dev/null; then echo "$__fn: Error: Required command 'tar' not found on this system."; return 64; fi
    if ! hash "zstd" &>/dev/null; then echo "$__fn: Error: Required command 'zstd' not found on this system."; return 64; fi

    ######### tar-zstd ######### START

if hash pv && [[ ! $_checkpoint ]]; then
    printf '=> %s\n' "${_PATH[@]}"
    local total_bytes=$(du -csb "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar -cf - "${_PATH[@]}" | pv -s $total_bytes | zstd > "$_ARCHIVE"
else
    local total_kb=$(du -csk "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar cfv "${_ARCHIVE}" "${_PATH[@]}" -Izstd --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi

    ######### tar-zstd ######### END
}
function __complete-tar-zstd() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --checkpoint --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}tar-zstd -- ${BASH_FUNK_PREFIX:--}tar-zstd

function -test-compression() {
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
function __impl-test-compression() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
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
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
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

    ######### test-compression ######### START

${BASH_FUNK_PREFIX:--}tar-gz --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}tar-zstd --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}untar-gz --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}untar-zstd --selftest && echo || return 1

    ######### test-compression ######### END
}
function __complete-test-compression() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-compression -- ${BASH_FUNK_PREFIX:--}test-compression

function -untar-gz() {
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
        echo; echo "Usage: $__fn [OPTION]... ARCHIVE [TARGET_DIR]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-untar-gz() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _checkpoint _help _selftest _ARCHIVE _TARGET_DIR
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... ARCHIVE [TARGET_DIR]"
                echo
                echo "Decompresses the given archive using gzip and tar displaying a real-time progress bar."
                echo
                echo "Requirements:"
                echo "  + Command 'cut' must be available."
                echo "  + Command 'du' must be available."
                echo "  + Command 'tar' must be available."
                echo "  + Command 'gzip' must be available."
                echo
                echo "Parameters:"
                echo -e "  \033[1mARCHIVE\033[22m (required, file)"
                echo "      Archive to decompress."
                echo -e "  \033[1mTARGET_DIR\033[22m (default: '.', directory)"
                echo "      Decompress location."
                echo
                echo "Options:"
                echo -e "\033[1m    --checkpoint\033[22m "
                echo "        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin."
                echo "    -----------------------------"
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

            --checkpoint)
                _checkpoint=1
            ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
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
        if [[ ! $_ARCHIVE ]]; then
            _ARCHIVE=$__param
            continue
        fi
        if [[ ! $_TARGET_DIR ]]; then
            _TARGET_DIR=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ ! $_TARGET_DIR ]]; then _TARGET_DIR="."; fi

    if [[ $_ARCHIVE ]]; then
        if [[ ! -e "$_ARCHIVE" ]]; then echo "$__fn: Error: File '$_ARCHIVE' for parameter ARCHIVE does not exist."; return 64; fi
        if [[ -e "$_ARCHIVE" && ! -f "$_ARCHIVE" ]]; then echo "$__fn: Error: Path '$_ARCHIVE' for parameter ARCHIVE is not a file."; return 64; fi
        if [[ ! -r "$_ARCHIVE" ]]; then echo "$__fn: Error: File '$_ARCHIVE' for parameter ARCHIVE is not readable by user '$USER'."; return 64; fi
    else
        echo "$__fn: Error: Parameter ARCHIVE must be specified."; return 64
    fi
    if [[ $_TARGET_DIR ]]; then
        if [[ ! -e "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR does not exist."; return 64; fi
        if [[ -e "$_TARGET_DIR" && ! -d "$_TARGET_DIR" ]]; then echo "$__fn: Error: Path '$_TARGET_DIR' for parameter TARGET_DIR is not a directory."; return 64; fi
        if [[ ! -r "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR is not readable by user '$USER'."; return 64; fi
        if [[ ! -w "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR is not writeable by user '$USER'."; return 64; fi
    fi

    if ! hash "cut" &>/dev/null; then echo "$__fn: Error: Required command 'cut' not found on this system."; return 64; fi
    if ! hash "du" &>/dev/null; then echo "$__fn: Error: Required command 'du' not found on this system."; return 64; fi
    if ! hash "tar" &>/dev/null; then echo "$__fn: Error: Required command 'tar' not found on this system."; return 64; fi
    if ! hash "gzip" &>/dev/null; then echo "$__fn: Error: Required command 'gzip' not found on this system."; return 64; fi

    ######### untar-gz ######### START

if hash pv && [[ ! $_checkpoint ]]; then
    pv "${_ARCHIVE}" --interval 0.5 | tar xzfv - -C "$_TARGET_DIR"
else
    local total_kb=$(du -k "${_ARCHIVE}" | cut -f1) &&
    tar xzfv "${_ARCHIVE}" -C "$_TARGET_DIR" --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi

    ######### untar-gz ######### END
}
function __complete-untar-gz() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --checkpoint --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}untar-gz -- ${BASH_FUNK_PREFIX:--}untar-gz

function -untar-zstd() {
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
        echo; echo "Usage: $__fn [OPTION]... ARCHIVE [TARGET_DIR]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-untar-zstd() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _checkpoint _help _selftest _ARCHIVE _TARGET_DIR
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... ARCHIVE [TARGET_DIR]"
                echo
                echo "Deompresses the given archive using zstd (https://github.com/facebook/zstd) and tar displaying a real-time progress bar."
                echo
                echo "Requirements:"
                echo "  + Command 'cut' must be available."
                echo "  + Command 'du' must be available."
                echo "  + Command 'tar' must be available."
                echo "  + Command 'zstd' must be available."
                echo
                echo "Parameters:"
                echo -e "  \033[1mARCHIVE\033[22m (required, file)"
                echo "      Archive to decompress."
                echo -e "  \033[1mTARGET_DIR\033[22m (default: '.', directory)"
                echo "      Decompress location."
                echo
                echo "Options:"
                echo -e "\033[1m    --checkpoint\033[22m "
                echo "        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin."
                echo "    -----------------------------"
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

            --checkpoint)
                _checkpoint=1
            ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
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
        if [[ ! $_ARCHIVE ]]; then
            _ARCHIVE=$__param
            continue
        fi
        if [[ ! $_TARGET_DIR ]]; then
            _TARGET_DIR=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ ! $_TARGET_DIR ]]; then _TARGET_DIR="."; fi

    if [[ $_ARCHIVE ]]; then
        if [[ ! -e "$_ARCHIVE" ]]; then echo "$__fn: Error: File '$_ARCHIVE' for parameter ARCHIVE does not exist."; return 64; fi
        if [[ -e "$_ARCHIVE" && ! -f "$_ARCHIVE" ]]; then echo "$__fn: Error: Path '$_ARCHIVE' for parameter ARCHIVE is not a file."; return 64; fi
        if [[ ! -r "$_ARCHIVE" ]]; then echo "$__fn: Error: File '$_ARCHIVE' for parameter ARCHIVE is not readable by user '$USER'."; return 64; fi
    else
        echo "$__fn: Error: Parameter ARCHIVE must be specified."; return 64
    fi
    if [[ $_TARGET_DIR ]]; then
        if [[ ! -e "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR does not exist."; return 64; fi
        if [[ -e "$_TARGET_DIR" && ! -d "$_TARGET_DIR" ]]; then echo "$__fn: Error: Path '$_TARGET_DIR' for parameter TARGET_DIR is not a directory."; return 64; fi
        if [[ ! -r "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR is not readable by user '$USER'."; return 64; fi
        if [[ ! -w "$_TARGET_DIR" ]]; then echo "$__fn: Error: Directory '$_TARGET_DIR' for parameter TARGET_DIR is not writeable by user '$USER'."; return 64; fi
    fi

    if ! hash "cut" &>/dev/null; then echo "$__fn: Error: Required command 'cut' not found on this system."; return 64; fi
    if ! hash "du" &>/dev/null; then echo "$__fn: Error: Required command 'du' not found on this system."; return 64; fi
    if ! hash "tar" &>/dev/null; then echo "$__fn: Error: Required command 'tar' not found on this system."; return 64; fi
    if ! hash "zstd" &>/dev/null; then echo "$__fn: Error: Required command 'zstd' not found on this system."; return 64; fi

    ######### untar-zstd ######### START

if hash pv && [[ ! $_checkpoint ]]; then
    pv "${_ARCHIVE}" --interval 0.5 | zstd -d | tar xfv - -C "$_TARGET_DIR"
else
    local total_kb=$(du -k "${_ARCHIVE}" | cut -f1) &&
    tar xfv "${_ARCHIVE}" -C "$_TARGET_DIR" -Izstd --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi

    ######### untar-zstd ######### END
}
function __complete-untar-zstd() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --checkpoint --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}untar-zstd -- ${BASH_FUNK_PREFIX:--}untar-zstd


function -help-compression() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}tar-gz ARCHIVE PATH1 [PATH]...\033[0m  -  Compresses the given files using tar and gzip displaying a real-time progress bar."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}tar-zstd ARCHIVE PATH1 [PATH]...\033[0m  -  Compresses the given files using tar and zstd (https://github.com/facebook/zstd) displaying a real-time progress bar."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-compression\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}untar-gz ARCHIVE [TARGET_DIR]\033[0m  -  Decompresses the given archive using gzip and tar displaying a real-time progress bar."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}untar-zstd ARCHIVE [TARGET_DIR]\033[0m  -  Deompresses the given archive using zstd (https://github.com/facebook/zstd) and tar displaying a real-time progress bar."

}
__BASH_FUNK_FUNCS+=( tar-gz tar-zstd test-compression untar-gz untar-zstd )

alias -- ${BASH_FUNK_PREFIX:--}tgz="${BASH_FUNK_PREFIX:--}tar-gz"
alias -- ${BASH_FUNK_PREFIX:--}tzst="${BASH_FUNK_PREFIX:--}tar-zstd"
alias -- ${BASH_FUNK_PREFIX:--}utgz="${BASH_FUNK_PREFIX:--}untar-gz"
alias -- ${BASH_FUNK_PREFIX:--}utzst="${BASH_FUNK_PREFIX:--}untar-zstd"
