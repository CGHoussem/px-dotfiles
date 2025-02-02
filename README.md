# PX-dotfiles

The dotfiles that I've customized for my personal/professional use.

## Setup

It's pretty easy :)

Just install the `stow` gnu command and from the git directory run:

`stow <name>`

The <name> is the name of the folder (app or whatever) that you want to setup.

## How stow works?

By running the `stow <name>` command, the content that exists under the <name> folder will be placed under the parent of the "stow directory".

In order to setup the dotfiles in a specific path, you need to add the `-t` argument followed by the targeted path, for example: `show <name> -t $HOME`

For more info, checkout the stow command sources :)
