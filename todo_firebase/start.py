import os


def main():
    options = { 1: 'Start Flutter',
    2: 'Self-Sign App',
    3: 'Exit'}
    print('Flutter ToDo App\n1) Start Emulator\n2) Read Self-Sign Key-Information\n3) Exit')
    choice = int(input('Enter your choice: '))
    if choice not in options:
        print('Invalid choice')
        return
    elif choice == 1:
        print('Starting Flutter Emulator ...')
        os.system('flutter doctor && flutter emulator --launch pixel')
    elif choice == 2:
        print('Read Sign-Key')
        os.system('keytool -list -v -alias androiddebugkey -keystore C:\debug.keystore')
    elif choice == 3:
        exit(0)
    
if __name__ =='__main__':
    try: 
        main()
    except KeyboardInterrupt:
        print('\nExiting ...')
        exit(0)