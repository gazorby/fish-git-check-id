#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#

# Don't forget to set the .git-remotes file !

function gckid -d "pre-commit hook to make sure to use the right identity"
    if test -f "$HOME"/.git-remotes
        if git rev-parse --verify HEAD >/dev/null 2>&1
            set against 'HEAD'
        else
            # Initial commit: diff against an empty tree object
            set against '4b825dc642cb6eb9a060e54bf8d69288fbee4904'
        end

        set -l REPO_REMOTE (git config --get remote.origin.url)

        function check_username_email
            set -l USERNAME (git config --get user.name)
            set -l EMAIL (git config --get user.email)

            if test "$EMAIL" != "$argv[1]"
                echo "Invalid email: $EMAIL"
                echo "git config user.email $argv[1]"
                return 1
            end
            if test "$USERNAME" != "$argv[2]"
                echo "Invalid username: $USERNAME"
                echo "git config user.name \"$argv[2]\""
                return 1
            end
        end
        # Iterate over all remotes in file
        for line in (cat "$HOME"/.git-remotes)
            set -l STORED_REMOTE (string split ',' $line)
            if string match -q "*$STORED_REMOTE[1]*" -- $REPO_REMOTE
                check_username_email "$STORED_REMOTE[2]" "$STORED_REMOTE[3]"
                ;or return 1
            end
        end
    end
end
