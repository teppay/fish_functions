function fish_right_prompt
    if set -q VIRTUAL_ENV
        echo -n -s "(" (set_color blue white) (string split / $VIRTUAL_ENV)[-2] (set_color normal) ")"
    end
end