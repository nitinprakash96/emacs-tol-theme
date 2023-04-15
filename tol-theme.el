;;; init-tol.el -- Emacs port of tol vscode theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Original theme: https://github.com/dustypomerleau/tol

(deftheme tol "A healthy dose of dark theme.")

(defgroup tol-theme nil
  "Tol theme."
  :group 'faces
  :prefix "tol-"
  :link '(url-link :tag "Github" "https://github.com/nitinprakash96/tol-theme")
  :tag "Tol theme")

;;;###autoload
(defcustom tol-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'tol-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

(defvar tol-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar tol-colors-alist
  '(("tol-bg-1"        . "#343849")
    ("tol-bg"          . "#292d3e")
    ("tol-bg+1"        . "#3d4152")
    ("tol-bg+2"        . "#474e6c")
    ("tol-bg+3"        . "#535664")
    ("tol-fg"          . "#cac0a9")
    ("tol-fg+1"        . "#d9cfb8")
    ("tol-fg+2"        . "#d5cbb4")
    ("tol-cream"       . "#fdf1d4")
    ("tol-slate"       . "#424657")
    ("tol-charcoal"    . "#383c4b")
    ("tol-ivory"       . "#f7ecd2")
    ("tol-graphite"    . "#4c505f")
    ("tol-graphite+2"  . "#5F5F5F")
    ("tol-pale-yellow" . "#ffffe6")
    ("tol-grey"        . "#747889")
    ("tol-jade"        . "#44bb99")
    ("tol-grey-1"      . "#7e818b")
    ("tol-brown"       . "#ee8866") ;; Burn sienna, used for keywords and operators.
    ("tol-olive"       . "#bbcc33") ;; Olive green, used for strings.
    ("tol-grey+1"      . "#dddddd") ;; Light grey, used for function calls and enums.
    ("tol-dark-slate"  . "#383c4d")
    ("tol-red+1"       . "#DCA3A3")
    ("tol-red"         . "#cc9393")
    ("tol-red-1"       . "#bc8383")
    ("tol-red-2"       . "#ac7373")
    ("tol-green+4"     . "#bfebbf")
    ("tol-green+1"     . "#8fb28f")
    ("tol-green"       . "#7f9f7f")
    ("tol-green-1"     . "#6f8f6f")
    ("tol-green-2"     . "#5f7f5f")
    ("tol-blue"        . "#8cd0d3")
    ("tol-blue-1"      . "#6CA0A3")
    ("tol-yellow-1"    . "#e0cf9f")
    ("tol-yellow"      . "#f0dfaf"))
  "List of tol theme colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro tol-color-variables (&rest body)
  "`let' bind all colors defined in `tol-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append tol-colors-alist
                           tol-override-colors-alist))
         (z-variable-pitch (if tol-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

(tol-color-variables
  (custom-theme-set-faces
   'tol

   ;; BASIC FACES
   `(default ((t (:background ,tol-bg :foreground ,tol-fg ))))
   `(hl-line ((t (:background ,tol-bg+1 ))))
   `(cursor ((t (:foreground ,tol-cream ))))
   `(region ((t (:background ,tol-bg+2 ))))
   `(secondary-selection ((t (:background ,tol-slate ))))
   `(fringe ((t (:background ,tol-bg ))))
   `(mode-line-inactive ((t (:background ,tol-charcoal :foreground ,tol-ivory ))))
   `(mode-line ((t (:background ,tol-graphite :foreground ,tol-pale-yellow ))))
   `(minibuffer-prompt ((t (:background ,tol-bg :foreground ,tol-cream ))))
   `(vertical-border ((t (:foreground ,tol-grey ))))


   ;; FONT LOCK FACES
   `(font-lock-builtin-face ((t (:foreground ,tol-jade ))))
   `(font-lock-comment-face ((t (:foreground ,tol-grey-1 :fontStyle :italic t ))))
   `(font-lock-constant-face ((t (:foreground ,tol-fg ))))
   `(font-lock-function-name-face ((t (:foreground ,tol-jade ))))
   `(font-lock-keyword-face ((t (:foreground ,tol-brown ))))
   `(font-lock-string-face ((t (:foreground ,tol-olive ))))
   `(font-lock-type-face ((t (:foreground ,tol-grey+1 ))))
   `(font-lock-variable-name-face ((t (:foreground ,tol-fg ))))


   ;; linum-mode
   `(linum ((t (:foreground ,tol-bg+3 ))))
   `(linum-relative-current-face ((t (:foreground ,tol-bg+3 ))))


   ;; display-line-number-mode
   `(line-number ((t (:foreground ,tol-bg+3 ))))
   `(line-number-current-line ((t (:foreground ,tol-bg+3 ))))


   ;; THIRD PARTY PACKAGE FACES


   ;; doom-modeline-mode
   `(doom-modeline-bar ((t (:background ,tol-graphite :foreground ,tol-pale-yellow ))))
   `(doom-modeline-inactive-bar ((t (:background ,tol-charcoal :foreground ,tol-ivory ))))


   ;; web-mode
   `(web-mode-string-face ((t (:foreground ,tol-olive ))))
   `(web-mode-html-tag-face ((t (:foreground ,tol-brown ))))
   `(web-mode-html-tag-bracket-face ((t (:foreground ,tol-brown ))))
   `(web-mode-html-attr-name-face ((t (:foreground ,tol-grey+1 ))))


   ;; company-mode
   `(company-tooltip ((t (:background ,tol-dark-slate :foreground ,tol-fg+1 ))))


   ;; org-mode
   `(org-block ((t (:background ,tol-bg-1 :foreground ,tol-fg+2 ))))
   `(org-block-begin-line ((t (:foreground ,tol-grey-1 ))))

   ;; diff
   ;; Please read (info "(magit)Theming Faces") before changing this.
   `(diff-added          ((t (:background "#335533" :foreground ,tol-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,tol-yellow-1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,tol-red-2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,tol-green+4))))
   `(diff-refine-changed ((t (:background "#888811" :foreground ,tol-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,tol-red))))
   `(diff-header ((,class (:background ,tol-graphite+2))
                  (t (:background ,tol-fg :foreground ,tol-bg))))

   ;; diff-hl
   `(diff-hl-change ((,class (:foreground ,tol-blue :background ,tol-blue-1))))
   `(diff-hl-delete ((,class (:foreground ,tol-red+1 :background ,tol-red-1))))
   `(diff-hl-insert ((,class (:foreground ,tol-green+1 :background ,tol-green-2))))))

;;; Theme variables
(tol-color-variables
  (custom-theme-set-variables
   'tol
   '(linum-format " %3i ")))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun tol-theme()
  "Apply the tol-theme."
  (interactive)
  (load-theme 'tol t))


(provide-theme 'tol)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; tol-theme.el ends here
