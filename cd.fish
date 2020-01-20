function cd --description 'cd -> ls'
    builtin cd $argv;
    ls;
end
