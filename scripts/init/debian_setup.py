#!/usr/bin/env python3
""" 
    File: debian_setup.py
    Description: reads a text file and downloads programs using apt-get
"""
import subprocess
import shlex
import argparse

def parse_args():
    """Handles arguments passed to script when ran in prompt"""
    parser = argparse.ArgumentParser(prog='debian_setup.py',
                                     description='This script conveniently downloads debian packages listed in a file',
                                     epilog='Created July 2024')
    parser.add_argument()

def get_package_list(text_file: str = 'debian_packages') -> list[str]:
    """A wrapper function for shlex.split"""

    with open(text_file, 'r', encoding='UTF-8') as file:
        # shlex removes
        return shlex.split(file, comments=True)


def download_packages_from_list(package_list: list[str],
                                safe: bool = True) -> subprocess.CompletedProcess[bytes] | None:
    """ Uses apt-get to install packages from a user provided list """

    command_statement_list = ['sudo', 'apt-get', 'install'] + package_list
    # for c in command_statement_list:
    #     print(c)

    if safe:
        user_input = input("Do you you want to run this command? (y/n): ").strip().lower()

    if safe is False or user_input in ('y', 'yes'):
        return subprocess.run(command_statement_list, check=True, capture_output=True)
    elif user_input in ('n', 'no'):
        return None
    else:
        raise ValueError("Incorrect input for (y/n)")


def main():
    """ debian_setup.py main function """
    package_list = get_package_list()
    output = download_packages_from_list(package_list)

    print(output)


if __name__ == '__main__':
    main()
