vim Configuration
================================================================================

Welcome to my `vim` configuration. Feel free to try it out yourself and let me
know if you have any improvements.

Since I spend about 95% of my working time in vim, I am constantly tweaking this
repository, so updates here should be fairly frequent.

I strive to keep my vim configuration easy to navigate. As such, I have broken
it up into various files. For the most part you can jump between files from
within vim by using `gf`. As some of the files grow, I am likely to change the
directory structure again in future.

Installing
================================================================================

I track this repository using the configuration file manager,
[ConfigManager](https://github.com/hendrik-s-debruin/ConfigManager), I wrote.
You can clone this repository using that tool by typing:

```txt
# Clone the repository
cfgmgr clone vim https://github.com/hendrik-s-debruin/config_vim

# Install its files -- This makes sure you don't accidentally overwrite something
cfgmgr manage vim reset HEAD ~
cfgmgr manage vim checkout ~

# Install the plugins
cfgmgr manage vim submodule update --init --recusrive
```

You are, of course, free to manually place the files in place. But then it's up
to you to get the plugins yourself.
