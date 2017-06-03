#!/usr/bin/env bash
#
# Copyright (c) 2015-2017 Vegard IT GmbH, http://vegardit.com
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
function -fn-copy() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... OLD_FUNC_NAME NEW_FUNC_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-fn-copy() {
    [ -p /dev/stdout ] && local -r __in_pipe=1 || true
    [ -t 1 ] || local  -r __in_subshell=1
    local -r __fn=${FUNCNAME[0]/__impl/}
    local __arg __optionWithValue __params=()
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... OLD_FUNC_NAME NEW_FUNC_NAME"
                echo
                echo "Creates an in-memory copy of the Bash function with the given name."
                echo
                echo "Parameters:"
                echo -e "  \033[1mOLD_FUNC_NAME\033[22m (required)"
                echo "      Name of the function to copy."
                echo -e "  \033[1mNEW_FUNC_NAME\033[22m (required)"
                echo "      Name of the function copy."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
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
        if [[ ! $_OLD_FUNC_NAME ]]; then
            _OLD_FUNC_NAME=$__param
            continue
        fi
        if [[ ! $_NEW_FUNC_NAME ]]; then
            _NEW_FUNC_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_OLD_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter OLD_FUNC_NAME must be specified."; return 64
    fi
    if [[ $_NEW_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter NEW_FUNC_NAME must be specified."; return 64
    fi


    ######################################################
if ! declare -F $_OLD_FUNC_NAME > /dev/null; then
    echo "Error: A function with the name $_OLD_FUNC_NAME does not exist."
    return 1
fi
eval "$(echo "$_NEW_FUNC_NAME()"; declare -f $_OLD_FUNC_NAME | tail -n +2)"
}
function __complete-fn-copy() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}fn-copy -- ${BASH_FUNK_PREFIX:--}fn-copy

function -fn-exists() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... FUNC_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-fn-exists() {
    [ -p /dev/stdout ] && local -r __in_pipe=1 || true
    [ -t 1 ] || local  -r __in_subshell=1
    local -r __fn=${FUNCNAME[0]/__impl/}
    local __arg __optionWithValue __params=()
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... FUNC_NAME"
                echo
                echo "Determines if a Bash function with the given name exists."
                echo
                echo "Parameters:"
                echo -e "  \033[1mFUNC_NAME\033[22m (required)"
                echo "      Name of the function to determine."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "\033[1m-v, --verbose\033[22m "
                echo "        Prints additional information during command execution."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn name-of-nonexistant-function\033[22m"
                echo
                echo -e "$ \033[1m$__fn -v name-of-nonexistant-function\033[22m"
                echo "A function with the name 'name-of-nonexistant-function' does not exist."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo -e "$ \033[1m$__fn name-of-nonexistant-function\033[22m"
                __stdout=$($__fn name-of-nonexistant-function); __rc=$?
                echo $__stdout
                if [[ $__rc != 1 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [1]."; return 64; fi
                __regex=""
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> [31mFAILED[0m - stdout [$__stdout] does not match required pattern []."; return 64; fi
                echo "--> [32mOK[0m"
                echo -e "$ \033[1m$__fn -v name-of-nonexistant-function\033[22m"
                __stdout=$($__fn -v name-of-nonexistant-function); __rc=$?
                echo $__stdout
                if [[ $__rc != 1 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [1]."; return 64; fi
                __regex="A function with the name 'name-of-nonexistant-function' does not exist."
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> [31mFAILED[0m - stdout [$__stdout] does not match required pattern [A function with the name 'name-of-nonexistant-function' does not exist.]."; return 64; fi
                echo "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            --verbose|-v)
                local _verbose=1
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
        if [[ ! $_FUNC_NAME ]]; then
            _FUNC_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter FUNC_NAME must be specified."; return 64
    fi


    ######################################################
if declare -F $_FUNC_NAME> /dev/null; then
    [[ $_verbose ]] && echo "A function with the name '$_FUNC_NAME' exists." || :
    return 0
else
    [[ $_verbose ]] && echo "A function with the name '$_FUNC_NAME' does not exist." || :
    return 1
fi
}
function __complete-fn-exists() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest --verbose -v "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}fn-exists -- ${BASH_FUNK_PREFIX:--}fn-exists

function -fn-rename() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... OLD_FUNC_NAME NEW_FUNC_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-fn-rename() {
    [ -p /dev/stdout ] && local -r __in_pipe=1 || true
    [ -t 1 ] || local  -r __in_subshell=1
    local -r __fn=${FUNCNAME[0]/__impl/}
    local __arg __optionWithValue __params=()
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... OLD_FUNC_NAME NEW_FUNC_NAME"
                echo
                echo "Renames the Bash function with the given name."
                echo
                echo "Parameters:"
                echo -e "  \033[1mOLD_FUNC_NAME\033[22m (required)"
                echo "      Current name of the function."
                echo -e "  \033[1mNEW_FUNC_NAME\033[22m (required)"
                echo "      New name for the function ."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
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
        if [[ ! $_OLD_FUNC_NAME ]]; then
            _OLD_FUNC_NAME=$__param
            continue
        fi
        if [[ ! $_NEW_FUNC_NAME ]]; then
            _NEW_FUNC_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_OLD_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter OLD_FUNC_NAME must be specified."; return 64
    fi
    if [[ $_NEW_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter NEW_FUNC_NAME must be specified."; return 64
    fi


    ######################################################
if ! declare -F $_OLD_FUNC_NAME > /dev/null; then
    echo "Error: A function with the name $_OLD_FUNC_NAME does not exist."
    return 1
fi

eval "$(echo "$_NEW_FUNC_NAME()"; declare -f $_OLD_FUNC_NAME | tail -n +2)"

unset -f $_OLD_FUNC_NAME
}
function __complete-fn-rename() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}fn-rename -- ${BASH_FUNK_PREFIX:--}fn-rename

function -fn-unload() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... FUNC_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-fn-unload() {
    [ -p /dev/stdout ] && local -r __in_pipe=1 || true
    [ -t 1 ] || local  -r __in_subshell=1
    local -r __fn=${FUNCNAME[0]/__impl/}
    local __arg __optionWithValue __params=()
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... FUNC_NAME"
                echo
                echo "Unloads the Bash function with the given name."
                echo
                echo "Parameters:"
                echo -e "  \033[1mFUNC_NAME\033[22m (required)"
                echo "      Name of the function to unload."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "\033[1m-v, --verbose\033[22m "
                echo "        Prints additional information during command execution."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            --verbose|-v)
                local _verbose=1
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
        if [[ ! $_FUNC_NAME ]]; then
            _FUNC_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_FUNC_NAME ]]; then
        true
    else
        echo "$__fn: Error: Parameter FUNC_NAME must be specified."; return 64
    fi


    ######################################################
if ! declare -F $_FUNC_NAME > /dev/null; then
    [[ $_verbose ]] && echo "A function with the name '$_FUNC_NAME' does not exist." || :
    return 0
fi

unset -f $_FUNC_NAME
}
function __complete-fn-unload() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest --verbose -v "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}fn-unload -- ${BASH_FUNK_PREFIX:--}fn-unload

function -test-functions() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-functions() {
    [ -p /dev/stdout ] && local -r __in_pipe=1 || true
    [ -t 1 ] || local  -r __in_subshell=1
    local -r __fn=${FUNCNAME[0]/__impl/}
    local __arg __optionWithValue __params=()
    for __arg in "$@"; do
        case $__arg in

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
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
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




    ######################################################
${BASH_FUNK_PREFIX:--}fn-copy --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}fn-exists --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}fn-rename --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}fn-unload --selftest && echo || return 1
}
function __complete-test-functions() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-functions -- ${BASH_FUNK_PREFIX:--}test-functions


function -help-functions() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}fn-copy OLD_FUNC_NAME NEW_FUNC_NAME\033[0m  -  Creates an in-memory copy of the Bash function with the given name."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}fn-exists FUNC_NAME\033[0m  -  Determines if a Bash function with the given name exists."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}fn-rename OLD_FUNC_NAME NEW_FUNC_NAME\033[0m  -  Renames the Bash function with the given name."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}fn-unload FUNC_NAME\033[0m  -  Unloads the Bash function with the given name."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-functions\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( fn-copy fn-exists fn-rename fn-unload test-functions )
