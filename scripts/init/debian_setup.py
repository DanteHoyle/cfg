#!/usr/bin/env python3
""" 
    File: debian_setup.py
    Description: reads a text file and downloads programs using apt-get
"""

import subprocess
import shlex
import argparse

def parse_args() -> tuple[str, bool]:
    """Handles arguments passed to script when ran in prompt"""
    parser = argparse.ArgumentParser(prog='debian_setup.py',
                                     description='This script conveniently downloads debian packages listed in a file',
                                     epilog='Created July 2024')

    parser.add_argument('-s', '--safe', help='echos apt-get command instead of running it', 
                                        action='store_true', 
                                        default=False)
    parser.add_argument('-f', '--file_path', help='path of debian_packages', default='debian_packages')

    args = parser.parse_args()
    return args.packages, args.safe

def get_package_list_from_file(text_file: str = 'debian_packages') -> list[str]:
    """A wrapper function for shlex.split"""

    with open(text_file, 'r', encoding='UTF-8') as file:
        # shlex removes
         shlex.split(file, comments=True)


def download_packages_from_list(package_list: list[str],
                                safe: bool = True) -> None:
    """ Uses apt-get to install packages from a user provided list """

    command_statement_list = ['sudo', 'apt-get', 'install'] + package_list
    user_input = None

    if safe:
        print(f'auto-generated command: {" ".join(command_statement_list)}')
        user_input = input('Do you you want to run this command? (y/n): ').strip().lower()

    if user_input in ('y', 'yes', None):
        shell_output = subprocess.run(command_statement_list, check=True, capture_output=True)
        shell_output.check_returncode() # Raises CalledProcessError if return code wasn't 0
    elif user_input in ('n', 'no'):
        return None
    else:
        raise ValueError(f'User input is not out in expected range. {user_input} is not in ("yes", "y", "no", "n")')


def main():
    """ debian_setup.py main function """
    file, safe = parse_args()
    debian_packages = get_package_list_from_file(text_file=file)
    download_packages_from_list(debian_packages, safe=safe)

    if safe is False or user_input in ('y', 'yes'):
        return shell_output.stdout.decode()
    elif user_input in ('n', 'no'):
        return None
    else:
        raise RuntimeError("Incorrect input for (y/n)")


def main():
    package_list: list[str] = get_package_list()
    output = download_packages_from_list(package_list)

if __name__ == '__main__':
    main()
