

def run_list():
    print('list!!!')

def run_add():
    print('add!!!')

def main():
    while True:
        cmd = input(f'(l)list, (a)dd, (q)uit >')

        if cmd == 'q':
            break

        elif cmd == 'l':
            run_list()
        elif cmd == 'a':
            run_add()

        print(f'execute {cmd}')

if __name__ == '__main__' :
    main()