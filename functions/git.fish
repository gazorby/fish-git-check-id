function git -d "Simple git wrapper"
    switch $argv[1]
        case 'commit'
            gckid; and command git $argv
        case '*'
            command git $argv
    end
end
