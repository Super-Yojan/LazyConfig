function zjs
    set -l search_paths \
        ~/git \
        ~/Academy/Research/ \
        ~/Creative \
        ~/Personal

    set -l selected
    if test (count $argv) -eq 1
        set selected $argv[1]
    else
        # Find directories and use fzf
        set selected (find $search_paths -mindepth 1 -maxdepth 3 -type d 2>/dev/null | fzf)
    end

    if test -z "$selected"
        return 0
    end

    # Create a clean session name (replace dots with underscores)
    set -l selected_name (basename "$selected" | tr . _)

    # ZELLIJ LOGIC
    if not set -q ZELLIJ
        # -----------------------------------------------------------
        # CASE 1: NOT IN A SESSION (Standard Attach/Create)
        # -----------------------------------------------------------
        cd "$selected"
        # -c = Create if missing
        zellij attach -c "$selected_name"
    else
        # -----------------------------------------------------------
        # CASE 2: ALREADY IN A SESSION (Spawn & Manager)
        # -----------------------------------------------------------
        # Check if session already exists (using --short to get just names)
        if not zellij list-sessions --short | grep -q "^$selected_name\$"
            # It doesn't exist, so we spawn it in the background.
            # We use 'nohup' and '&' to detach it immediately so it doesn't nest.
            cd "$selected"
            nohup zellij -s "$selected_name" >/dev/null 2>&1 &

            # Give the server a split second to register
            sleep 0.2
        end

        # Now that the session exists (or was just created),
        # we open the built-in Session Manager so you can press ENTER to switch.
        zellij action launch-or-focus-plugin session-manager
    end
end
