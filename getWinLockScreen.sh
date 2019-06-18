#! /bin/bash

# ls | grep -v *.sh | awk '{print $1}' | xargs ./mulrename.sh
# echo "$@"

# %userprofile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
# ~/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets/
# su -c "cp $scriptname /usr/bin/monitor" root && echo "Congratulations! Script Installed, now run monitor Command" || echo "Installation failed"

lockscreen_location="$HOME/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets/"

function rename {
    if [[ ! -z "${1}" ]]; then
        echo "the name ${1}"
    else
        echo "Error."
    fi
}

# ls "$lockscreen_location" | awk '{print $1}' && echo "Success get the lock screen image list." || echo "Failed."
# ls "$lockscreen_location" | awk '{system("rename "$1)}' && echo "Success get the lock screen image list." || echo "Failed."

image_file=`ls "$lockscreen_location"`
#  | awk '{print $5}' | awk -F" " '{print $0}'
# echo $image_file

for i in $image_file; do
    # ls | grep $i
    # echo `file "$lockscreen_location$i" | grep -e 'JPEG image data'`
    if [[ ! -z `file "$lockscreen_location$i" | grep -e 'JPEG image data' | grep -e '1920x1080'` ]]; then
        if [[ ! -d "$HOME/Pictures/WP" ]]; then
            echo "directory WP not exist, create it."
            mkdir "$HOME/Pictures/WP"
        fi
        echo "copying $i.jpg"
        cp "$lockscreen_location$i" "$HOME/Pictures/WP/$i.jpg"
        # echo `file "$lockscreen_location$i"`
    fi
    # cp "$lockscreen_location$i" "$HOME/Pictures/WP/$i.jpg"
done