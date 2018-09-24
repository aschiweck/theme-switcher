#!/bin/bash

if [ $@ > 0 ]; then

    if [ $1 = 'light' ]; then
        emacsclient -q --eval "(load-theme 'solarized-light t)"
        echo "theme_load('current.solarized-light')" | awesome-client
        ln -sfn ~/.Xresources.d/colors.solarized-light ~/.Xresources.d/colors.current
        xrdb ~/.Xresources
    elif [ $1 = 'dark' ]; then
        emacsclient -q --eval "(load-theme 'solarized-dark t)"
        echo "theme_load('current.solarized-dark')" | awesome-client
        ln -sfn ~/.Xresources.d/colors.solarized-dark ~/.Xresources.d/colors.current
        xrdb ~/.Xresources
    else
        echo "unimplemented"
        exit 1
    fi

fi

exit 0
