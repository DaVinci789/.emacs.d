;;; init.el -- summary
;; Jaden Manacsa's init.el
;;; Commentary:
;;; loaded modes:
;; graphene
;; golden-ratio-mode
;; global-company-mode
;; yas-global-mode
;; global-evil-leader-mode
;; evil-mode
;; achievements-mode
;; sublimity-mode
;; ido-mode
;; spaceline-spacemacs-theme
;; nyan-mode
;; autopair-global-mode
;; global-flycheck-mode
;; which-key-mode
;; blink-cursor-mode
;; daylight-mode

;;; Code:
;; Pre-frame creation init
(add-hook 'after-make-frame-functions (lambda (frame) (when (window-system frame)
                                                        (menu-bar-mode -1)
                                                        (tool-bar-mode -1)
                                                        (menu-bar-mode -1)
                                                        (scroll-bar-mode -1)
                                                        )))

;; package init
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("melpa-unstable" . "http://melpa.milkbox.net/packages/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(package-initialize)

(defun require-package (package)
  "If PACKAGE does not exist, install it."
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; define functions

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun touchpad-off ()
  "Turn touchpad off (linux only)."
  (interactive)
  (shell-command "xinput set-prop 13 \"Device Enabled\" 0"))

(defun touchpad-on ()
  "Turn touchpad off (linux only)."
  (interactive)
  (shell-command "xinput set-prop 13 \"Device Enabled\" 1"))

(defun xmodmap ()
  "Xmodmap the thing because it does not work in init."
  (interactive)
  (shell-command "xmodmap ~/.xmodmap"))
(xmodmap)

(defun it-did-not-work ()
  "Place to load stuff if they didn't work."
  (interactive)
  (pretty-lambda-mode)
  (pdf-tools-install))
(it-did-not-work)

;; macros
(defmacro define-and-bind-text-object (key start-regex end-regex)
  "Create new evil text object based on KEY, START-REGEX, and END-REGEX."
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

;; load modes
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-daylight"))
(require 'use-package)
(require 'powerline)
(require 'daylight)
   :ensure t
   :init
     (powerline-reset)
     (add-hook 'daylight-mode-hook (lambda () (powerline-reset)))
(use-package graphene
  :ensure t
  :init
    (setq powerline-height 20)
    (linum-mode -1)
)
 (use-package helm-config)
(use-package spaceline-config)
(use-package org)
(use-package ido
  :ensure t
  :init
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
  :config
    (ido-mode)
  )
(use-package sublimity
  :ensure t
  :init
    (use-package sublimity-attractive)
    (sublimity-mode)
)
(use-package achievements
  :ensure t
  :init
    (achievements-mode))
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode)
  )
(use-package company
  :ensure t
  :init
    (global-company-mode)
  )
(use-package golden-ratio
  :ensure t
  :init
    (golden-ratio-mode 1)
)
(use-package evil
  :ensure t
  :init
  (evil-mode)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("gray" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("green" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  (use-package evil-leader
    :ensure t
    ;; :init
    :config
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "f" 'find-file
      "e" 'load-file
      "bk" 'kill-buffer
      "bl" 'list-buffers
      "bn" 'next-buffer
      "bs" 'switch-to-buffer
      "bo" 'other-window
      "bwd" 'delete-window
      "n" 'linum-relative-global-mode
      "butterfly" 'butterfly
      "hi" 'info
      "hdf" 'describe-function
      "hdv" 'describe-key
      "hdk" 'describe-key
      "pr" 'powerline-reset
      "ol" 'org-store-line
      "oa" 'org-agenda
      "t" 'neotree
      "pr" 'powerline-reset
      "ub" 'battery
      "up" 'proced
      "vv" 'vimish-fold
      "vd" 'vimish-fold-delete
      "<SPC>" 'helm-M-x)
    )
  :config
  (define-key evil-motion-state-map "0" 'evil-end-of-line)
  (define-key evil-motion-state-map "$" 'evil-beginning-of-line)
  (define-key evil-motion-state-map ";" 'evil-ex)
  (define-key evil-motion-state-map ":" 'evil-repeat-find-char)
  ;; define text objects
  (define-and-bind-text-object "*" "*" "*")
  (define-and-bind-text-object "%" "%" "%")
  (define-and-bind-text-object "$" "$" "$")
  )
(use-package org-bullets
:ensure t
:init
    (setq org-bullets-bullet-list
    '("◉" "◎" "⚫" "○" "►" "◇"))
:config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package xwidgets)
(use-package slime
  :ensure t
  :init
    (setq inferior-lisp-program "/usr/bin/sbcl")
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
)
(use-package pretty-lambdada
  :ensure t
  :init
  (global-pretty-lambda-mode t)
  :config
  (global-pretty-lambda-mode 1)
  (pretty-lambda-mode))
(use-package pdf-tools
  :ensure t
  :init
  (pdf-tools-install))
(use-package switch-window)
(use-package exwm)
(use-package exwm-config)
(exwm-config-default)
(slime-setup)
(nyan-mode)
(global-flycheck-mode)
(which-key-mode)
(blink-cursor-mode)
(daylight-mode)
(spaceline-spacemacs-theme)
(windmove-default-keybindings)
(ido-mode 1)
(vimish-fold-global-mode 1)
(global-linum-mode -1)

;; keybindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x j") 'ace-jump-char-mode)
(global-set-key (kbd "C-x w") 'ace-jump-word-mode)
(global-set-key (kbd "M-SPC") 'helm-mini)
(global-set-key (kbd "C-x o") 'switch-window)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; keybindings of esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


;; random emacs customizations
(spaceline-helm-mode)
(spaceline-info-mode)
;; set stuff
(setq helm-M-x-fuzzy-match t)
(setq helm-locate-fuzzy-match t)
(setq show-paren-mode t)
(setq make-backup-files nil)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(setq org-log-done t)
(setq daylight-morning-theme 'spacemacs-light
      daylight-afternoon-theme 'tao-yang
      daylight-evening-theme 'molokai
      daylight-late-theme 'spacemacs-dark)
(setq powerline-height 25)
(eval-after-load "golden-ratio"
  '(progn
     (add-to-list 'golden-ratio-exclude-modes "neotree-mode")
     ))
(setq ido-ignore-buffers '("^\*Compile-Log\*"))
(setq ido-ignore-buffers '("^\*Async Shell Command\*\<0-9>"))

;; Set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

(setq scroll-margin 1
    scroll-conservatively 0
    scroll-up-aggressively 0.01
    scroll-down-aggressively 0.01)
;; Hook stuff
(add-hook 'load-theme-hook (lambda () (powerline-reset)))

(display-time)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
         "~/.emacs.d/site-lisp/magit/Documentation/"))

(spaceline-toggle-minor-modes-off)

(spaceline-highlight-face-evil-state)
(touchpad-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#C2C2C2" "#161616" "#252525" "#080808" "#0E0E0E" "#161616" "#080808" "#080808"])
 '(async-bytecomp-allowed-packages
   (quote
    (async helm helm-core helm-ls-git helm-ls-hg magit evil)))
 '(custom-safe-themes
   (quote
    ("f02be5db6b04285f98d87b1aa4086b250957e28bb005874c4ac7d6a1b5820196" "ded9aa6d1a76436c5ba1f2632b756ad1b73e2125805337cca52308a02b65c266" "85f8095f4e522b8b56d10b8f63d72e9a3cd5ae578219743ef90b7068f5ff34d4" "dfe99e3ccc760f20a2b8d575e003c4d5af1bcd518e8868d5d4343a253872a019" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" default)))
 '(fci-rule-color "#F0F0F0")
 '(global-linum-mode nil)
 '(linum-relative-global-mode nil)
 '(package-selected-packages
   (quote
    (chess tao-theme pacmacs slime exwm google-translate 0blayout fancy-battery ace-window better-defaults xkcd xelb wiki-summary white-sand-theme which-key use-package-chords unbound tablist sx sublimity spacemacs-theme spaceline selectric-mode ranger paradox ox-reveal org-bullets nyan-mode neotree multi-term monokai-theme molokai-theme magit litable linum-relative jedi helm-projectile helm-dictionary graphene golden-ratio gnugo flex-autopair fireplace evil-tutor evil-tabs evil-leader evalator engine-mode elpy el-get e2wm dictionary dash-functional buffer-move brainfuck-mode bfbuilder autumn-light-theme autopair auctex achievements ace-jump-mode 2048-game)))
 '(paradox-github-token t)
 '(vc-annotate-background "#D9D9D9")
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#3C3C3C")
     (60 . "#3C3C3C")
     (80 . "#252525")
     (100 . "#252525")
     (120 . "#161616")
     (140 . "#161616")
     (160 . "#0E0E0E")
     (180 . "#0E0E0E")
     (200 . "#0E0E0E")
     (220 . "#080808")
     (240 . "#080808")
     (260 . "#080808")
     (280 . "#080808")
     (300 . "#080808")
     (320 . "#080808")
     (340 . "#080808")
     (360 . "#080808"))))
 '(vc-annotate-very-old-color "#161616"))
 '(daylight-mode t nil (daylight))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (golden-ratio el-get spacemacs-theme graphene white-sand-theme spaceline molokai-theme elpy litable evalator evil-tutor autumn-light-theme ## sx yasnippet ranger smooth-scrolling ox-reveal bfbuilder brainfuck-mode engine-mode wiki-summary smooth-scroll neotree company paradox undo-tree "undo-tree" "paradox" dictionary helm-dictionary achievements sublimity "w3m" dash-functional magit use-package xkcd xelb which-key unbound selectric-mode org-bullets nyan-mode multi-term monokai-theme linum-relative jedi helm-projectile gnugo flycheck flex-autopair fireplace evil-tabs buffer-move autopair auctex ace-jump-mode 2048-game)))
 '(paradox-github-token t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

;; (eval (set-face-attribute 'default nil :font "Sauce Code Powerline:style=Regular" :height 116))
;; (eval (set-frame-font "Sauce Code Powerline:style=Regular" nil t))

(provide 'init.el)

;;; init.el ends here
