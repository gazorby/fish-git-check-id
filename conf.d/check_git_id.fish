function __check_git_id_install --on-event check_git_id_install
    if not test -f "$HOME"/.git-remotes
        touch "$HOME"/.git-remotes
        echo "Fill the "$HOME"/.git-remotes" file!
    end
end

function __check_git_id_uninstall --on-event check_git_id_uninstall
    rm "$HOME"/.git-remotes
    functions --erase gckid
    functions --erase git
end
