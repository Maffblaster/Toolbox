#!/bin/bash

# This bash script accepts an executable binary as input. It attempts to generate a list of dependencies based on the system's currently installed packages.

# MIT LICENSE

VERSION="0.0.1"

while [ $# -ge 2 ]; do
        case "$1" in
                --)
                    # No more options left.
                    shift
                    break
                   ;;
                -s|--searchpath)
                        searchpath="$2"
                        shift
                        ;;
                -h|--help)
			printf "depgen <option> <binpkg>\n"
                        printf "depgen v${VERSION}\n"
                        exit 0
                        ;;
		*)
			printf "depgen <option> <binpkg>\n"
			;;
        esac

        shift
done

echo ${1}
