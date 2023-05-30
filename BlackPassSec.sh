#!/bin/bash

generate_password() {
    pass_number=$1
    pass_length=$2
    chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+{}[]"

    for ((i=0; i<pass_number; i++)); do
        password=$(cat /dev/urandom | tr -dc "$chars" | fold -w $pass_length | head -n 1)
        echo "SENHA $((i+1)) GERADA: $password"
        echo "$password" >> password.txt
    done

    echo "SENHAS SALVAS EM PASSWORD.TXT NO DIRETÓRIO DA EXECUÇÃO."
}

print_banner() {
    echo -e "\e[38;2;0;128;0m---------------------------------------------------------"
    echo -e "\e[38;2;255;255;0m                          Draius                         "
    echo -e "\e[38;2;255;255;255m ☢ ☢ ☢ ☢ ☢ ☢ ☢           𓅓  𓅓  𓅓           ☢ ☢ ☢ ☢ ☢ ☢ ☢ "
    echo -e "\e[38;2;255;0;0m                        PASS WORDS                       "
    echo -e "\e[38;2;0;128;0m---------------------------------------------------------"
    echo -e "\e[38;2;255;0;0m  \e[38;2;0;255;255m      ᚠ ᚢ ᚦ ᚨ ᚱ ᚷ ᚹ ᚺ ᚾ ᛁ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛞ ᛟ \e[38;2;255;0;0m       "
    echo -e "\e[38;2;0;128;0m---------------------------------------------------------\e[0m"
}

print_banner
read -p $'\e[33mNÚMERO DE SENHAS GERADAS: \e[0m' pass_number
read -p $'\e[33mQUANTIDADE DE CARACTERES: \e[0m' pass_length

if [[ $pass_length -lt 1 || $pass_number -lt 1 ]]; then
	echo -e "\e[31mSOMENTE NÚMEROS\e[0m"
else
    generate_password $pass_number $pass_length
fi
