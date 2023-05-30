import random
import string

def generate_password(pass_number, pass_length):
    chars = string.ascii_letters + string.digits + string.punctuation
    for i in range(pass_number):
        password = ''.join(random.choice(chars) for _ in range(pass_length))
        print(f'SENHA {i+1} GERADA: {password}')

def banner():
    print("****************************************")
    print("$                                      $")
    print("$              Bem-vindo               $")
    print("$                                      $")
    print("****************************************")

if __name__ == '__main__':
    banner()
    pass_number = int(input("NÚMERO DE SENHAS GERADAS: "))
    pass_length = int(input("QUANTIDADE DE CARACTERES: "))
    if pass_length < 1 or pass_number < 1:
        print("SOMENTE NÚMEROS")
    else:
        generate_password(pass_number, pass_length)

