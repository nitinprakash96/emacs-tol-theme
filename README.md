## Theme

This theme is an emacs port of the splendid VS code theme [tol](https://github.com/dustypomerleau/tol) by [Dusty Pomerleau ](https://github.com/dustypomerleau).

Also, heavily inspired by zenburn.


## Installation

Download `tol-theme.el` to the directory `~/.emacs.d/themes/`. Add this to your `init.el`:

```
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
```

Load the theme using `load-theme` function:

`M-x load-theme RET tol`

## TODO

There a configurations that I'd like to add as part of this theme:
- [ ] Flymake
- [ ] Magit
- [ ] Isearch
- [ ] Helm
- [ ] Ivy
- [ ] Dired
