## What is this?

A script and an Extension Atrribute to use in Jamf for checking if mac  HW is Big Sur compatible.

Easy enough to modify for future version by modifying the list and renaming the output file in both script and EA.

### To use
add the script to jamf, create a policy set to *run once* (it's not like the hardware type will change!) and add the script to the policy.
Scope to *all computers* and set run at *checkin*

Add the EA to jamf as a type script.

The EA will return either;
1. Not tested
2. Compatible
3. Not compatible

This can then be used in reports and smart groups.