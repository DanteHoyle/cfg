#!/usr/bin/env python

import sys, os, shutil

def helloworld():
    relative_path = sys.argv[0]
    absolute_path = os.path.abspath(relative_path)

    print(f"relative path: {relative_path}")
    print(f"absolute path: {absolute_path}")

def argparse_tester():
   import argparse 
   parser = argparse.ArgumentParser()
   parser.add_argument("echo", help="echos string")
   args = parser.parse_args()
   print(args.echo)

def main():
    argparse_tester()



if __name__ == '__main__':
    main()