function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/")
    set -l dirs (echo $pwd | string sub -s 3 | string split /)
    set -l width 110
    set -l max_len (math $width-(string length (string join "" "[$USER" @ (prompt_hostname) ' ]' (__fish_git_prompt))))
    set -l idx 1

    for i in (seq (count $dirs))
        if [ (string length $pwd) -le $max_len ]
            break
        end
        set dirs[$idx] '('(string sub -l 3 $dirs[$idx])')'
        set idx (math $idx+1)
        set pwd '~/'(string join / $dirs)
    end

    set -l prompt_symbol ''

    switch "$USER"
        case root toor
            set prompt_symbol '#'
        case '*'
            set prompt_symbol '$'
    end

    echo -s "╭─ ["(set_color $fish_color_cwd)  $pwd (set_color normal) ']' (__fish_git_prompt)
    echo -sn  "╰─> " (set_color normal)
end
