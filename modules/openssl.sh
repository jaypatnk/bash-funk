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
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/openssl.md
#


function -is-loadable() {
    hash openssl &>/dev/null

}

if ${BASH_FUNK_PREFIX:--}is-loadable; then
function -gen-x509cert() {
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
        echo; echo "Usage: $__fn [OPTION]... FQ_DNS_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-gen-x509cert() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _CAkey _CAcert _keysize _validity _subject _aliases _dh1024 _force _help _selftest _FQ_DNS_NAME
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
                echo "Usage: $__fn [OPTION]... FQ_DNS_NAME"
                echo
                echo "Generates a (self-signed) X509 server certificate."
                echo
                echo "Parameters:"
                echo -e "  \033[1mFQ_DNS_NAME\033[22m (required, pattern: \"[*a-zA-Z0-9_.-]+\")"
                echo "      Ffully qualified DNS name of the server."
                echo
                echo "Options:"
                echo -e "\033[1m    --CAcert FILE\033[22m (file)"
                echo "        Certificate file of the signing CA."
                echo -e "\033[1m    --CAkey FILE\033[22m (file)"
                echo "        Private key file of the signing CA."
                echo -e "\033[1m    --aliases NAME1[,...]\033[22m (pattern: \"[*a-zA-Z0-9_.-]+\")"
                echo "        Additional DNS aliases (alternative subject names)."
                echo -e "\033[1m    --dh1024\033[22m "
                echo "        Generate a certificate with DH 1024 params, that will also works with older Java 5/6 clients which otherwise would throw 'Could not generate DH keypair' exception."
                echo -e "\033[1m-f, --force\033[22m "
                echo "        Do not prompt before overwriting."
                echo -e "\033[1m    --keysize SIZE\033[22m (integer: 1-?)"
                echo "        Number of bits of the private key. Default is 2048."
                echo -e "\033[1m    --subject VALUE\033[22m "
                echo "        Certificate subject instead of '/CN=<COMMON_NAME>'."
                echo -e "\033[1m    --validity DAYS\033[22m "
                echo "        Validity in days. Default is 1095."
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

            --CAkey)
                _CAkey="@@##@@"
                __optionWithValue=CAkey
            ;;

            --CAcert)
                _CAcert="@@##@@"
                __optionWithValue=CAcert
            ;;

            --keysize)
                _keysize="@@##@@"
                __optionWithValue=keysize
            ;;

            --validity)
                _validity="@@##@@"
                __optionWithValue=validity
            ;;

            --subject)
                _subject="@@##@@"
                __optionWithValue=subject
            ;;

            --aliases)
                _aliases="@@##@@"
                __optionWithValue=aliases
            ;;

            --dh1024)
                _dh1024=1
            ;;

            --force|-f)
                _force=1
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
                    CAkey)
                        _CAkey=$__arg
                        __optionWithValue=
                      ;;
                    CAcert)
                        _CAcert=$__arg
                        __optionWithValue=
                      ;;
                    keysize)
                        _keysize=$__arg
                        __optionWithValue=
                      ;;
                    validity)
                        _validity=$__arg
                        __optionWithValue=
                      ;;
                    subject)
                        _subject=$__arg
                        __optionWithValue=
                      ;;
                    aliases)
                        _aliases=(${__arg//,/ })
                        __optionWithValue=
                      ;;
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_FQ_DNS_NAME ]]; then
            _FQ_DNS_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_CAkey ]]; then
        if [[ $_CAkey == "@@##@@" ]]; then echo "$__fn: Error: Value FILE for option --CAkey must be specified."; return 64; fi
        if [[ ! -e "$_CAkey" ]]; then echo "$__fn: Error: File '$_CAkey' for option --CAkey does not exist."; return 64; fi
        if [[ -e "$_CAkey" && ! -f "$_CAkey" ]]; then echo "$__fn: Error: Path '$_CAkey' for option --CAkey is not a file."; return 64; fi
        if [[ ! -r "$_CAkey" ]]; then echo "$__fn: Error: File '$_CAkey' for option --CAkey is not readable by user '$USER'."; return 64; fi
    fi
    if [[ $_CAcert ]]; then
        if [[ $_CAcert == "@@##@@" ]]; then echo "$__fn: Error: Value FILE for option --CAcert must be specified."; return 64; fi
        if [[ ! -e "$_CAcert" ]]; then echo "$__fn: Error: File '$_CAcert' for option --CAcert does not exist."; return 64; fi
        if [[ -e "$_CAcert" && ! -f "$_CAcert" ]]; then echo "$__fn: Error: Path '$_CAcert' for option --CAcert is not a file."; return 64; fi
        if [[ ! -r "$_CAcert" ]]; then echo "$__fn: Error: File '$_CAcert' for option --CAcert is not readable by user '$USER'."; return 64; fi
    fi
    if [[ $_keysize ]]; then
        if [[ $_keysize == "@@##@@" ]]; then echo "$__fn: Error: Value SIZE for option --keysize must be specified."; return 64; fi
        if [[ ! "$_keysize" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_keysize' for option --keysize is not a numeric value."; return 64; fi
        if [[ $_keysize -lt 1 ]]; then echo "$__fn: Error: Value '$_keysize' for option --keysize is too low. Must be >= 1."; return 64; fi
    fi
    if [[ $_validity ]]; then
        if [[ $_validity == "@@##@@" ]]; then echo "$__fn: Error: Value DAYS for option --validity must be specified."; return 64; fi
    fi
    if [[ $_subject ]]; then
        if [[ $_subject == "@@##@@" ]]; then echo "$__fn: Error: Value VALUE for option --subject must be specified."; return 64; fi
    fi
    if [[ $_aliases ]]; then
        [[ $_aliases == "@@##@@" ]] && _aliases=()
        if [[ ${#_aliases[@]} -lt 1 ]]; then echo "$__fn: Error: For option --aliases a list with at least 1 value(s) must be specified. Found: ${#_aliases[@]}."; return 64; fi
        local __param
        for __param in "${_aliases[@]}"; do
            if [[ ! "$__param" =~ ^[*a-zA-Z0-9_.-]+$ ]]; then echo "$__fn: Error: Value '$__param' for option --aliases does not match required pattern '[*a-zA-Z0-9_.-]+'."; return 64; fi
        done
        true
    fi

    if [[ $_FQ_DNS_NAME ]]; then
        if [[ ! "$_FQ_DNS_NAME" =~ ^[*a-zA-Z0-9_.-]+$ ]]; then echo "$__fn: Error: Value '$_FQ_DNS_NAME' for parameter FQ_DNS_NAME does not match required pattern '[*a-zA-Z0-9_.-]+'."; return 64; fi
    else
        echo "$__fn: Error: Parameter FQ_DNS_NAME must be specified."; return 64
    fi

    ######### gen-x509cert ######### START

if [[ ! ${_force:-} ]]; then
    if [[ -e "${_FQ_DNS_NAME}.key" ]]; then
        echo "${_FQ_DNS_NAME}.key already exists. Use option --force to overwrite."
        return 1
    fi
    if [[ -e "${_FQ_DNS_NAME}.csr" ]]; then
        echo "${_FQ_DNS_NAME}.csr already exists. Use option --force to overwrite."
        return 1
    fi
    if [[ -e "${_FQ_DNS_NAME}.crt" ]]; then
        echo "${_FQ_DNS_NAME}.crt already exists. Use option --force to overwrite."
        return 1
    fi
fi

if [[ ${_CAkey:-} && ! ${_CAcert:-} ]]; then
    echo "Using option --CAkey requires option --CAcert";
    return 1
fi

if [[ ${_CAcert:-} && ! ${_CAkey:-} ]]; then
    echo "Using option --CAcert requires option --CAkey";
    return 1
fi

local _subject=${_subject:-/CN=${_FQ_DNS_NAME}}

openssl genrsa -out "${_FQ_DNS_NAME}.key" ${_keysize:-2048} || return 1
echo " -> file [${_FQ_DNS_NAME}.key] created."

openssl req -new -key "${_FQ_DNS_NAME}.key" -out "${_FQ_DNS_NAME}.csr" -subj "${_subject}" || return 1
echo " -> file [${_FQ_DNS_NAME}.csr] created."
echo "Generating certificate with subject [$_subject]..."

local opts="x509 -req -sha256 -days ${_validity:-1095} -in \"${_FQ_DNS_NAME}.csr\" -out \"${_FQ_DNS_NAME}.crt\""

if [[ ${_CAcert:-} ]]; then
    local caSerialFile="${_CAcert%.*}.srl"
    if [[ -e $caSerialFile ]]; then
        opts="$opts -CA \"$_CAcert\" -CAkey \"$_CAkey\" -CAserial \"$caSerialFile\" "
    else
        opts="$opts -CA \"$_CAcert\" -CAkey \"$_CAkey\" -CAcreateserial "
    fi
else
    opts="$opts -set_serial 01 -signkey \"${_FQ_DNS_NAME}.key\" "
fi

if [[ ${_aliases:-} ]]; then
    local altName altNames
    for altName in "${_aliases[@]}"; do
        if [[ $altNames ]]; then
            altNames="$altNames, DNS:$altName"
        else
            altNames="DNS:$altName"
        fi
    done
    local extfile="$(mktemp)"
    echo subjectAltName="$altNames" > $extfile
    eval "openssl $opts -extfile $extfile" || return 1
    rm $extfile
else
    eval "openssl $opts" || return 1
fi
echo " -> file [${_FQ_DNS_NAME}.crt] created."

if [[ ${_dh1024:-} ]]; then
    # http://httpd.apache.org/docs/current/ssl/ssl_faq.html#javadh
    # will degrade website rating to B on https://www.ssllabs.com/ssltest/
    openssl dhparam 1024 >> "${_FQ_DNS_NAME}.crt"
fi

    ######### gen-x509cert ######### END
}
function __complete-gen-x509cert() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --CAkey --CAcert --keysize --validity --subject --aliases --dh1024 --force -f --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}gen-x509cert -- ${BASH_FUNK_PREFIX:--}gen-x509cert

function -gen-x509rootca() {
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
        echo; echo "Usage: $__fn [OPTION]... COMMON_NAME"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-gen-x509rootca() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _validity _keysize _subject _force _help _selftest _COMMON_NAME
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
                echo "Usage: $__fn [OPTION]... COMMON_NAME"
                echo
                echo "Generates a self-signed X509 root CA certificate."
                echo
                echo "Parameters:"
                echo -e "  \033[1mCOMMON_NAME\033[22m (required, pattern: \"[a-zA-Z0-9_.-]+\")"
                echo "      Common name of the CA."
                echo
                echo "Options:"
                echo -e "\033[1m-f, --force\033[22m "
                echo "        Do not prompt before overwriting."
                echo -e "\033[1m    --keysize SIZE\033[22m (integer: 1-?)"
                echo "        Number of bits of the private key. Default is 4096."
                echo -e "\033[1m    --subject VALUE\033[22m "
                echo "        Certificate subject instead of '/CN=<COMMON_NAME>'."
                echo -e "\033[1m    --validity DAYS\033[22m "
                echo "        Validity in days. Default is 3650."
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

            --validity)
                _validity="@@##@@"
                __optionWithValue=validity
            ;;

            --keysize)
                _keysize="@@##@@"
                __optionWithValue=keysize
            ;;

            --subject)
                _subject="@@##@@"
                __optionWithValue=subject
            ;;

            --force|-f)
                _force=1
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
                    validity)
                        _validity=$__arg
                        __optionWithValue=
                      ;;
                    keysize)
                        _keysize=$__arg
                        __optionWithValue=
                      ;;
                    subject)
                        _subject=$__arg
                        __optionWithValue=
                      ;;
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_COMMON_NAME ]]; then
            _COMMON_NAME=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_validity ]]; then
        if [[ $_validity == "@@##@@" ]]; then echo "$__fn: Error: Value DAYS for option --validity must be specified."; return 64; fi
    fi
    if [[ $_keysize ]]; then
        if [[ $_keysize == "@@##@@" ]]; then echo "$__fn: Error: Value SIZE for option --keysize must be specified."; return 64; fi
        if [[ ! "$_keysize" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_keysize' for option --keysize is not a numeric value."; return 64; fi
        if [[ $_keysize -lt 1 ]]; then echo "$__fn: Error: Value '$_keysize' for option --keysize is too low. Must be >= 1."; return 64; fi
    fi
    if [[ $_subject ]]; then
        if [[ $_subject == "@@##@@" ]]; then echo "$__fn: Error: Value VALUE for option --subject must be specified."; return 64; fi
    fi

    if [[ $_COMMON_NAME ]]; then
        if [[ ! "$_COMMON_NAME" =~ ^[a-zA-Z0-9_.-]+$ ]]; then echo "$__fn: Error: Value '$_COMMON_NAME' for parameter COMMON_NAME does not match required pattern '[a-zA-Z0-9_.-]+'."; return 64; fi
    else
        echo "$__fn: Error: Parameter COMMON_NAME must be specified."; return 64
    fi

    ######### gen-x509rootca ######### START

if [[ ! ${_force:-} ]]; then
    if [[ -e "${_COMMON_NAME}.key" ]]; then
        echo "${_COMMON_NAME}.key already exists. Use option --force to overwrite."
        return 1
    fi
    if [[ -e "${_COMMON_NAME}.crt" ]]; then
        echo "${_COMMON_NAME}.crt already exists. Use option --force to overwrite."
        return 1
    fi
fi

local _subject=${_subject:-/CN=${_COMMON_NAME}}

openssl genrsa -out "${_COMMON_NAME}.key" ${_keysize:-4096} || return 1
echo " -> file [${_COMMON_NAME}.key] created."

echo "Generating certificate with subject [$_subject]..."
openssl req -x509 -new -key "${_COMMON_NAME}.key" -days ${_validity:-3650} -out "${_COMMON_NAME}.crt" -subj "${_subject}" || return 1
echo " -> file [${_COMMON_NAME}.crt] created."

    ######### gen-x509rootca ######### END
}
function __complete-gen-x509rootca() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --validity --keysize --subject --force -f --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}gen-x509rootca -- ${BASH_FUNK_PREFIX:--}gen-x509rootca

function -test-openssl() {
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
function __impl-test-openssl() {
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

    ######### test-openssl ######### START

${BASH_FUNK_PREFIX:--}gen-x509cert --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}gen-x509rootca --selftest && echo || return 1

    ######### test-openssl ######### END
}
function __complete-test-openssl() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-openssl -- ${BASH_FUNK_PREFIX:--}test-openssl


function -help-openssl() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}gen-x509cert FQ_DNS_NAME\033[0m  -  Generates a (self-signed) X509 server certificate."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}gen-x509rootca COMMON_NAME\033[0m  -  Generates a self-signed X509 root CA certificate."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-openssl\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( gen-x509cert gen-x509rootca test-openssl )

else
    echo "SKIPPED"
fi
unset -f -- ${BASH_FUNK_PREFIX:--}is-loadable