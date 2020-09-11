#!/bin/sh

###############################################
# EA to record HW support check               #
# works in conjunction ewith the check script #
###############################################
resultFile="/Library/Management/bigsur_support"

value="Not tested"

if [[ -e "$resultFile" ]]; then
   value=$(cat $resultFile) 
fi

echo "<result>$value</result>"