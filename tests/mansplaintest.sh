#!/bin/bash

usage() { echo "Usage: $0 -s \"name of the template\" ex: Template.sol " 1>&2; exit 1; }

while getopts ":s:p:l" o; do
    case "${o}" in
        s)
            o=${OPTARG}
            echo "${o}"

            cat ./templates/"${o}"
            ;;
        l)
            ls -lha ./templates/
            #echo "${list}"
            ;;
        p)
            p=${OPTARG}
            echo "${p}"
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

#if [ -z "${s}" ] || [ -z "${p}" ]; then
#    usage
#fi

