function sync_theme --argument flavor
    if test -z "$flavor"
        # If no argument, detect from macOS defaults
        set -l style (defaults read -g AppleInterfaceStyle 2>/dev/null)
        if test "$style" = Dark
            set flavor mocha
        else
            set flavor latte
        end
    end
end
