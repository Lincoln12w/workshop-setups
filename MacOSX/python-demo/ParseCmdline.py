"""
Description:
    Test argparser.

Author: lincoln12w
Github: https://github.com/Lincoln12w

Module:
    argparse
    Doc: https://docs.python.org/2/howto/argparse.html &
        https://docs.python.org/3/library/argparse.html

APIs:
ArgumentParser.add_argument()
    action - The basic type of action to be taken when this
            argument is encountered.
        store - This just stores the argument's value. This
            is the default action.
        store_const - This stores the value specified by the
            const keyword argument.
        store_true/store_false -
        append - Appends each argument value to a list.
        append_const - Appends the value specified by the const
            keyword argument to a list.
    count - This counts the number of times a keyword argument occurs.
    nargs - The number of command-line arguments that should be consumed.
        N - N arguments from the command line will be gathered
            together into a list.
        ? - One argument will be consumed from the command line if possible.
        * - All command-line arguments present are gathered into a list.
        + - Just like '*'. And, an error message will be generated if
            there was none.
    argparse.REMAINDER - All the remaining command-line arguments are
        gathered into a list.
    const - A constant value required by some action and nargs selections.
    default - The value produced if the argument is absent from
        the command line.
    type - The type to which the command-line argument should be converted.
        can take any callable that takes a single string and returns the
        converted value.
    choices - A container of the allowable values for the argument.
    required - Whether or not the command-line option may be omitted
        (optionals only).
    dest - The name of the attribute to be added to the object returned by
        parse_args().

ArgumentParser.add_subparsers()
ArgumentParser.add_argument_group()
ArgumentParser.add_mutually_exclusive_group()

Modify History
--------------
00a 16apr17 lzw create
01a 26apr17 lzw update
"""

import argparse


def form_parser():
    """
    Create a parser.
    """
    parser = argparse.ArgumentParser()

    # Positional arguments
    parser.add_argument("lhs", help="left hand side value", type=int)
    # Set choices
    parser.add_argument("op",
                        help="operations", choices=['+', '-', '*', '/', '%'])
    parser.add_argument("rhs", help="right hand side value", type=int)

    # Optional arguments
    # Set default value
    parser.add_argument("--name", help="name of the actions", default="test")
    # Set as a flag
    parser.add_argument("-v", "--verbose",
                        help="turn on verbosity", action="store_true")
