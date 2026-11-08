dotfiles
========

installation
------------

macOS:

```
    % brew install stow
    % make
```

Fedora:

```
    % sudo dnf install stow
    % make
```

Debian:

```
    % sudo apt install stow
    % make
```


migration
---------

to migrate a home dir set up with the previous, non-stow-based symlinks:

```
   % find ~ -maxdepth 2 -type l -lname "$HOME/src/dotfiles/*" -print

   % find ~ -maxdepth 2 -type l -lname "$HOME/src/dotfiles/*" -delete

   % make
```
