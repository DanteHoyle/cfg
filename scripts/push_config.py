#!/usr/bin/env python

# file: push_config.py
# description: If this script is still in the ../dotfiles/scripts directory,
# this will copy the configs from the repo source to the config directories
# of the running system

import sys
import os
import shutil

# imports script specific constants
from settings import CONFIG, PROGRAMS

# parses command line arguments given when the script was ran
def parse_arguments():
    from argparse import ArgumentParser
    parser = ArgumentParser()
    return

# can safely crash if key value for dict doesn't exist
def safe_check_dict(key, dictionary):
    try:
        return dictionary[key]
    except: 
        return -1

# assumes it was given a valid program dict with file and path keys
def copy_config(program):

    path = program['path']

    # adds . to beginning of file name if file should be hidden
    if program['make_hidden']:
        file = f'{CONFIG}/.{program['file']}'
    else:
        file = f'{CONFIG}/{program['file']}'

    # now we know program is set to a dict containing metadata for the program
    try:
        shutil.copy(path, file)
    except:
        return -1
    
    return True

def main():
    program_list = PROGRAMS.values()

    for p in program_list:
        print(f'Attempting to copy {p}')
        if copy_config(p):
            print(f'Success!')
        else:
            print(f'Error copying {p}')
    return

# ensures that the main function is only run if the script is called directly
if __name__ == '__main__':
    main()