#!/bin/bash

usage() { echo "Usage: $0 	-s show template \"name of the template\" ex: Template.sol 
				-l list existing templates 
				-a add a new template #using Template.sol as template for said template
				-d delete a template
				"
	1>&2; exit 1; }

while getopts ":s:a:d:l" o; do
    case "${o}" in
        s)
            o=${OPTARG}
            echo "${o}"

            cat ./templates/"${o}"
            ;;
        l)
		clear
		echo "Here is a list of templates:"
		echo "############################"
	   ls -lha ./templates/ | tail -n +4 | awk '{print $NF}'
	   	echo "############################"
            ;;
        d)
            d=${OPTARG}
	    rm -rf ./templates/${d}
            ;;
        a)
            a=${OPTARG}
	    cp ./templates/Template.sol ./templates/Template-${a}.sol
            vim ./templates/Template-${a}.sol
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
