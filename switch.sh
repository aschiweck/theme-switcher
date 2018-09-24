#!/bin/bash

if [ $@ > 0 ]; then

    if [ $1 = 'light' ]; then
        emacsclient -q --eval "(load-theme 'solarized-light t)"
        echo "theme_load('current.solarized-light')" | awesome-client
        ln -sfn ~/.mutt.d/colors.solarized-light ~/.mutt.d/colors.current
        ln -sfn ~/.Xresources.d/colors.solarized-light ~/.Xresources.d/colors.current
        [ -f ~/.Xresources ] && /usr/bin/xrdb -I $HOME -merge ~/.Xresources
    elif [ $1 = 'dark' ]; then
        emacsclient -q --eval "(load-theme 'solarized-dark t)"
        echo "theme_load('current.solarized-dark')" | awesome-client
        ln -sfn ~/.mutt.d/colors.solarized-dark ~/.mutt.d/colors.current
        ln -sfn ~/.Xresources.d/colors.solarized-dark ~/.Xresources.d/colors.current
        [ -f ~/.Xresources ] && /usr/bin/xrdb -I $HOME -merge ~/.Xresources
    else
        echo "unimplemented"
        exit 1
    fi

    TERMS=$(ps aux | grep urxvt | grep -v grep | awk '{ print $2}')
    for PID in ${TERMS}; do
        kill -1 ${PID}
    done

fi
