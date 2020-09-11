#!/bin/zsh
# Check if computer supports Big Sur (https://everymac.com/mac-answers/macos-11-big-sur-faq/macos-big-sur-macos-11-compatbility-list-system-requirements.html). 

checkList="/tmp/.BigSurList.txt"
modelIdentifier=$( sysctl -n hw.model )
folderPath="/Library/Management"
#dateString=$( date '+%Y%m%d-%H%M%S-%Z' )
resultFile="bigsur_support"

# To test uncomment one line below. 
#modelIdentifier="Macmini1,1"  #bad
#modelIdentifier="iMac4,1" #bad
#modelIdentifier="Macmini"  #bad
#modelIdentifier="MacBook1,1"  # bad
#modelIdentifier="MacBook6,1" # bad
#modelIdentifier="MacBookAir8,2" # good
#modelIdentifier="MacBookAir9,1"  # good
#modelIdentifier="MacBookPro16,2" # good


# Create folder if it doesn't exit

mkdir -p $folderPath
chown root:admin $folderPath
touch "$folderPath$resultFile"
# Create checkList file

# create list file to check against
# update this list for OS changes or new hardware
cat << 'EOF' > $checkList
iMac14,4
iMac15,1
iMac16,1
iMac16,2
iMac17,1
iMac18,1
iMac18,2
iMac18,3
iMac19,1
iMac19,2
iMacPro1,1
MacBook8,1
MacBook9,1
MacBook10,1
MacBookAir6,1
MacBookAir6,2
MacBookAir7,1
MacBookAir7,2
MacBookAir8,1
MacBookAir8,2
MacBookAir9,1
MacBookPro11,1
MacBookPro11,2
MacBookPro11,3
MacBookPro11,4
MacBookPro11,5
MacBookPro12,1
MacBookPro13,1
MacBookPro13,2
MacBookPro13,3
MacBookPro14,1
MacBookPro14,2
MacBookPro14,3
MacBookPro15,1
MacBookPro15,2
MacBookPro15,3
MacBookPro15,4
MacBookPro16,1
MacBookPro16,2
MacBookPro16,3
Macmini7,1
Macmini8,1
MacPro6,1
MacPro7,1
EOF



if [[ -e "$checkList" ]];then
    # grep -w matches whole line, stops partial matching
    # grep -c gives a count output, 1 is a match 0 isn't
    yes=$(grep -w -c $modelIdentifier $checkList)
    echo "*** $yes ***"
    if [[ "$yes" == "1" ]];then
        echo "Supported" > "$folderPath"/"$resultFile"
        echo "*** Supported *****"
    else
        echo "Not_Supported" > "$folderPath"/"$resultFile"
        echo "*** Not_Supported ****"
    fi
else
    echo "$checkList does not exist."
    exit 1
fi

rm "$checkList"

exit 0