#!/usr/bin/env python3
"""
link-to-path
This script takes a file path as an argument, and will create a symbolic link to ~/.local/bin
"""

import os
import sys
import click
import platform
from typing import Never
from pathlib import Path

PATH_DIRECTORY = Path.home() / '.local' / 'bin'

def write_error_and_exit(msg: str, exit_code: int) -> Never:
    formatted_msg = f"{click.style("Error!", fg="red", bold=True)} {msg}"
    click.echo(formatted_msg, err=True)
    sys.exit(exit_code)

@click.command()
@click.argument('source_path', type=click.Path(path_type=Path))
@click.option('--test', type=click.BOOL, default=False)
def symlink_file_to_path(source_path: Path, test: bool):

    system = platform.system()
    is_compatible_os = (system == 'Linux')

    # exit early if not being ran from linux
    if not is_compatible_os:
        write_error_and_exit(f'Error! This script must be ran from linux, but current system is: {system}', os.EX_OSERR)

    filename = source_path.name

    symlink_src = source_path.resolve()
    symlink_dst = PATH_DIRECTORY / filename
    print(f"Source: {symlink_src}")
    print(F"Destination: {symlink_dst}")

    if not symlink_src.exists():
        write_error_and_exit(f"The source file doesn't exist. Source File: {symlink_src}", os.EX_OSFILE)
    elif symlink_dst.exists():
        write_error_and_exit(f"The destination file already exists. Destination File: {symlink_dst}", os.EX_CANTCREAT)

    if test:
        click.echo("Exiting test mode without creating symbolic link!")

    try:
        os.symlink(symlink_src, symlink_dst)
    except Exception as e:
        write_error_and_exit(f'OS Error: {e}', os.EX_OSERR)

if __name__ == "__main__":
    symlink_file_to_path()
