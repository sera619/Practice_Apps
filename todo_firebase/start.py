import os
from time import sleep
class BColors:
    BACKBLUE = '\033[44m'
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKBLUE = '\033[92m'
    ORANGE = '\033[93m'
    RED = '\033[31m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    CLEAR = '\033[0m'

CLEARWIN = print("\033c")
CLEARCONSOLE = lambda: os.system('cls' if os.name == 'nt' else 'clear')

def Blue(text):
    return (BColors.OKCYAN+BColors.BOLD + text + BColors.CLEAR)

def Green(text):
    return (BColors.OKBLUE+BColors.BOLD + text + BColors.CLEAR)

def Orange(text):
    return (BColors.ORANGE+BColors.BOLD + text + BColors.CLEAR)       

def Red(text):
    return (BColors.RED+BColors.BOLD + text + BColors.CLEAR)

def main():
    os.system('cls')
    options = { 1: 'Start Flutter',
    2: 'Self-Sign App',
    3: 'Buildrunner',
    0: 'Exit'}
    print(Orange('>>> Flutter Development-Launcher\n\n1) Start Emulator\n2) Read Self-Sign Key-Information\n3) AutoRoute code generation\n\n0) Exit\n'))
    choice = int(input(Green('>>> Enter option: ')))
    if choice not in options:
        os.system('cls')
        print(Red('>>> Invalid choice'))
        sleep(1.5)
        os.system('cls')
        return main()
    elif choice == 1:
        print(Blue('>>> Starting Flutter Emulator ...'))
        os.system('flutter doctor && flutter emulator --launch pixel')
    elif choice == 2:
        print(Blue('>>> Read Sign-Key ... '))
        os.system('keytool -list -v -alias androiddebugkey -keystore C:\debug.keystore')
    elif choice == 3:
        print(Blue('>>> Buildrunner ... '))
        os.system('flutter packages pub run build_runner build')
    elif choice == 0:
        exit(0)

    
if __name__ =='__main__':
    try: 
        main()
    except KeyboardInterrupt:
        print(Orange('\n>>> Exiting ...'))
        exit(0)