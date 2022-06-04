#!/bin/bash
#set -o verbose
#echo all commands while running
usage() { echo "Usage: $0 	-s show template \"name of the template\" ex: Template.sol 
				-l list existing templates 
				-a add a new template #using Template.sol as template for said template
				-d delete a template
				"
	1>&2; exit 1; }

while getopts ":s:a:d:lt:" o; do
    case "${o}" in
        s)
		clear
        echo ""
            s=${OPTARG}
	    echo "####################################################################"
        echo "#      This is the ${s} template.    "
	    echo "####################################################################"

	    echo "####################################################################"

            cat ./templates/"${s}"

	    echo "####################################################################"
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
        t)
		t=${OPTARG}

        qfind=$(find ./templates -type f -iname "*${t}*" | wc -l) # -print
        afind=$(find ./templates -type f -iname "*${t}*") 
#            echo "you chose -t option"
        #echo $qfind
        if [ $qfind -le "1" ] 
        then 
            echo "####################################################################"
            echo "#      This is the ${t} template.    "
            echo "# - used with the -t option"
	        echo "####################################################################"

	        echo "####################################################################"

            cat ${afind}

            echo "####################################################################"

        else
             echo "Search result:"
             for a in $afind
             do
                echo $a
             done
             echo "There are $qfind results."
        fi
	   
	    
	    #echo ""
        #echo "${qfind}"
        #t=${OPTARG}
	    #cp ./templates/Template.sol ./templates/Template-${a}.sol
            #vim ./templates/Template-${a}.sol
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

