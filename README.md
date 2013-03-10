# alias

The Unix gods created this simple command that I always forget to use.

With the recent popularity of [heroku-fucking-console](https://github.com/tpope/heroku-fucking-console), it seems that others forget it as well.

Take a moment to set aliases.  Your fingers will thank you.

### What commands should I alias?

```sh
history | ruby -e "$(curl -fsSL https://raw.github.com/ankane/alias/master/alias.rb)"
```

Note: This does not take into account current aliases (if someone knows how to do this, let me know)

### What is an alias?

All day, you type:

```sh
heroku run console
```

or

```sh
git push
```

Imagine a world where you could just type:

```sh
hc
```

or

```sh
gp
```

Meet aliases!  Add this to `~/.bash_profile` (or `~/.zshrc` if zsh is your thing)

```sh
alias hc="heroku run console"
alias gp="git push"
```
