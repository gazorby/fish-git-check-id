# fish-git-check-id

Ensure you are using the right identity depending on which repo you are working on

## 🚀 Install
```console
fisher add Gazorby/fish-git-check-id
```

## 🔧 Usage

The plugin will create `~/.git-remotes`, that you could fill with your different git remotes, usernames and emails :

```console
# ~/.git-remotes

github.com,email,username
gitlab.company.com,pro_email,pro_name

...
```

This way, when inside a git repo with `gitlab.company.com` remote, `gckid` hook will be executed everytime you call `git commit` to check that the git repo's username and email match the ones specified in `~/.git-remotes` file for this remote.

## 📝 License

[MIT](https://github.com/Gazorby/fish-git-check-id/blob/master/LICENSE)
