#! /bin/bash
#
# Script name rdpNIAMApp

if ! command -v xfreerdp &> /dev/null
then
    echo "xfreerdp could not be found"
    echo "Using command 'sudo apt-get install freerdp' to install and try again"
    exit 1
fi

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Usage : "
    echo "rpdNIAMApp -1|2|3|4|5"
    exit 1
fi

while getopts ':12345' opt
do
case "$opt" in
    '1')app="||NetGuardIAMClient"
        ip="10.240.178.1"
        ;;
    '2')app="||NetGuardIAMClient"
        ip="10.240.178.2"
        ;;
    '3')app="||NetGuardIAMClient"
        ip="10.240.178.3"
        ;;
    '4')app="||NiamClient"
        ip="10.240.178.4"
        ;;
    '5')app="||NetGuardIAMClient"
        ip="10.240.178.5"
        ;;

    *)  echo "Invalid option $opt"
        echo "Usage : "
        echo "rpdNIAMApp -1|2|3|4|5"
        exit 1
        ;;
esac
done

xfreerdp /v:$ip:3390 /app:$app +clipboard /printer /drives  /bpp:32 /monitors:2 /multimon
