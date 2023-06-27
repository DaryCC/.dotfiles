;; package manager

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; desktop-save


(require 'desktop)
(setq desktop-save 1)
(desktop-save-mode 1)

;; Set config for emacs  and daemon (client mode)


;; función para cargar configuracion de fonts y temas
  ;; (require 'doom-palenight)

  (defun efs/set-font-faces ()
    (message "Setting faces!")
    (set-face-attribute 'default nil :font "Source Code Pro"  :weight 'normal )
    (set-face-attribute 'fixed-pitch nil :font "Source Code Pro" )
    (set-face-attribute 'variable-pitch nil :font "Source Code Pro" :weight 'regular)
    (load-theme 'doom-palenight  t);;ESTE ES EL BUENO
    ;; (load-theme 'doom-palenight t)

    (message "fonts seteadas")
    )

  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (setq doom-modeline-icon t)
                  (with-selected-frame frame
                    (efs/set-font-faces) )
                  )
                )
    (efs/set-font-faces))


;; se reasigna cerrar frame
  (evil-leader/set-key "q q" 'spacemacs/frame-killer)

  (efs/set-font-faces)

  ;; (defun my-load-theme (theme)
  ;;   (add-hook 'after-make-frame-functions
  ;;             (lambda (frame)
  ;;               (select-frame frame)
  ;;               (when (display-graphic-p frame)
  ;;                 (load-theme theme t)))))
  ;; (my-load-theme 'doom-palenight)

;; Basic


(use-package which-key
  :config
  (which-key-mode))

;; Temas


(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)

  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-palenight t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme "doom-atom"
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  )
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme "doom-atom"
(doom-themes-treemacs-config)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; doom-modeline
;; This package is able to display icons if ~nerd-icons~ package and required fonts
;; are installed. Run ~M-x nerd-icons-install-fonts~ to install the necessary fonts.

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  ;; PERSONALIZACIONES OPCIONALES
  ;;  (doom-modeline-height 25)
  ;;  (doom-modeline-bar-width 1)
   (doom-modeline-icon t)
  ;;  (doom-modeline-major-mode-icon t)
  ;;  (doom-modeline-major-mode-color-icon t)
  ;;  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  ;;  (doom-modeline-buffer-state-icon t)
  ;;  (doom-modeline-buffer-modification-icon t)
  ;;  (doom-modeline-minor-modes nil)
  ;;  (doom-modeline-enable-word-count nil)
  ;;  (doom-modeline-buffer-encoding t)
  ;;  (doom-modeline-indent-info nil)
  ;;  (doom-modeline-checker-simple-format t)
  ;;  (doom-modeline-vcs-max-length 12)
  ;;  (doom-modeline-env-version t)
  ;;  (doom-modeline-irc-stylize 'identity)
  ;;  (doom-modeline-github-timer nil)
  ;;  (doom-modeline-gnus-timer nil)
  )

;; Syntax Checking Layer (Tooltip Pop-up)

(setq-default dotspacemacs-configuration-layers
           '((syntax-checking :variables
                              syntax-checking-auto-hide-tooltips 5)))

;; Treemacs


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
  (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)
    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    (treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (treemacs-indent-guide-mode t)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  )
;;if treemacs is lagging
(setq inhibit-compacting-font-caches t)

;; treemacs-icons-dired


(use-package treemacs-icons-dired
  ;; :hook (dired-mode . treemacs-icons-dired-enable-once)
  :hook (dired-mode . treemacs-icons-dired-mode)
  :ensure t)

;; treemacs-projectile


(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

;; treemacs-magit


(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; treemacs-evil


(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

;; treemacs-all-the-icons


(require 'ivy-rich)
(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs
  )

;; treemacs-persp

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; ivy-rich


(use-package ivy-rich
  :after (counsel-projectile)
  :config
  (ivy-rich-mode 1))

;; treemacs-all-the-icons-ivy-rich


(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; all-the-icons


(use-package all-the-icons
   :if (display-graphic-p)
   :config
   (setq all-the-icons-scale-factor 1.3))

;; org-mode
;;   The ~auto-fill-mode~ function can be used to toggle auto fill mode for a buffer. Also check ~org-fill-paragraph~ for this task.
;;   ~(require org-download)~ for image pasting
;; If you then press ~C-c C-t~ followed by the selection key, the entry is switched to this state. ~SPC~ can be used to remove any TODO keyword from an entry.

(defun efs/org-mode-setup ()
   (org-indent-mode)
   (variable-pitch-mode 1)
   (auto-fill-mode 1)
   (visual-line-mode 1)
   (setq evil-auto-indent nil))

 (use-package org
   :hook
   (org-mode . efs/org-mode-setup)
   ;; (add-hook 'dired-mode-hook 'org-download-enable)
   :config
   ;; (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters)
   ;; (add-hook 'org-mode-hook 'auto-indent-mode)
   (add-hook 'org-mode-hook 'turn-on-auto-fill)
   (setq org-ellipsis " ▾"
         org-hide-emphasis-markers t)
 )
 (org-reload)
 ;; para cambiar los  íconos de las listas
 (use-package org-bullets
   :after org
   :hook (org-mode . org-bullets-mode)
   :custom
   (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

 ;; Replace list hyphen with dot
 (font-lock-add-keywords 'org-mode
                         '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


 (defun my/style-org-agenda()
   (dolist (face '((org-level-1 . 1.4)
                   (org-level-2 . 1.3)
                   (org-level-3 . 1.2)
                   (org-level-4 . 1.0)
                   (org-level-5 . 1.1)
                   (org-level-6 . 1.1)
                   (org-level-7 . 1.1)
                   (org-level-8 . 1.1)))
     (set-face-attribute (car face) nil :font "MesloLGS Nerd Font" :weight 'regular :height (cdr face)))
   )

 (add-hook 'org-agenda-mode-hook 'my/style-org-agenda)


 (setq org-todo-keywords
       '((sequence "TODO(t)"
                   "PROGRESS(n)"
                   "DELEGATED(D)"
                   "|"
                   "CANCELLED(c)"
                   "DONE(F)")))
;; (with-eval-after-load 'org
;; )

     ;; Ensure that anything that should be fixed-pitch in Org files appears that way
     (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
     (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
     ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
     (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
     (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
     (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
     (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; Indent(dtrt-indent)
;; Agrégalo ~dtrt-indent~ en el layer de .spacemacs.

(use-package auto-indent-mode
  :ensure t
  :custom
  (add-hook 'emacs-lisp-mode-hook 'auto-indent-mode)
  )
(add-hook 'prog-mode-hook #'(lambda ()
                                (dtrt-indent-mode)
                                (dtrt-indent-adapt)))

;; highlight-indent-guides
;; This minor mode highlights indentation levels via font-lock. Indent widths are
;; dynamically discovered, which means this correctly highlights in any mode,
;; regardless of indent width, even in languages with non-uniform indentation such
;; as Haskell.

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :custom
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'org-mode-hook 'highlight-indent-guides-mode)
  (highlight-indent-guides-method 'character )
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

  )

;;   rainbow delimiters
;; ~rainbow-delimiters~ is a "rainbow parentheses"-like mode which highlights
;; delimiters such as parentheses, brackets or braces according to their depth.
;; Each successive level is highlighted in a different color. This makes it easy to
;; spot matching delimiters, orient yourself in the code, and tell which statements
;; are at a given depth.

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; griprep
;; ~helm-ag.el~ provides interfaces of *The Silver Searcher* with *helm*.


;; *The silver searcher* is a code searching tool similar to ack, with a focus on speed.
;; [[https://github.com/emacsorphanage/helm-ag][aquí]]

(evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
(use-package helm-ag
  :config
  (custom-set-variables
   ;;'(helm-ag-fuzzy-match: t)
   '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
   )
 )

;; paren


(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

;; Paredit
;; paredit — parenthetical editing in Emacs

(use-package paredit
  :ensure t)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; IDE features with lsp-mode
;; + [[https://emacs-lsp.github.io/lsp-mode/][docs]]
;; + [[https://emacs-lsp.github.io/lsp-mode/page/languages/][lenguages soportados]]
;; We use the excellent [[https://emacs-lsp.github.io/lsp-mode/][lsp-mode]] to enable IDE-like functionality for many
;; different programming languages via "language servers" that speak the [[https://microsoft.github.io/language-server-protocol/][Language
;; Server Protocol]]. Before trying to set up =lsp-mode= for a particular language,
;; check out the [[https://emacs-lsp.github.io/lsp-mode/page/languages/][documentation for your language]] so that you can learn which
;; language servers are available and how to install them.

;; The =lsp-keymap-prefix= setting enables you to define a prefix for where
;; =lsp-mode='s default keybindings will be added. I *highly recommend* using the
;; prefix to find out what you can do with =lsp-mode= in a buffer.

;; The =which-key= integration adds helpful descriptions of the various keys so you
;; should be able to learn a lot just by pressing =C-c l= in a =lsp-mode= buffer and
;; trying different things that you find there.


(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  (
        (lsp-mode . lsp-enable-which-key-integration)
        (web-mode . lsp)
        (js2-mode . lsp)
        (rjsx-mode . lsp)
        (css-mode . lsp)
        (html-mode . lsp)
        (python-mode . lsp)

        )
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

;; lsp-ui
;; [[https://emacs-lsp.github.io/lsp-ui/][lsp-ui]] is a set of UI enhancements built on top of =lsp-mode= which make Emacs
;; feel even more like an IDE. Check out the screenshots on the =lsp-ui= homepage
;; (linked at the beginning of this paragraph) to see examples of what it can do.

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

;; lsp-treemacs
;; [[https://github.com/emacs-lsp/lsp-treemacs][lsp-treemacs]] provides nice tree views for different aspects of your code like symbols in a file, references of a symbol, or diagnostic messages (errors and warnings) that are found in your code.

;; Try these commands with =M-x=:

;; - =lsp-treemacs-symbols= - Show a tree view of the symbols in the current file
;; - =lsp-treemacs-references= - Show a tree view for the references of the symbol under the cursor
;; - =lsp-treemacs-error-list= - Show a tree view for the diagnostic messages in the project

;; This package is built on the [[https://github.com/Alexander-Miller/treemacs][treemacs]] package which might be of some interest to you if you like to have a file browser at the left side of your screen in your editor.

(use-package lsp-treemacs
  :after lsp)

;; lsp-ivy
;; [[https://github.com/emacs-lsp/lsp-ivy][lsp-ivy]] integrates Ivy with =lsp-mode= to make it easy to search for things by name in your code.  When you run these commands, a prompt will appear in the minibuffer allowing you to type part of the name of a symbol in your code.  Results will be populated in the minibuffer so that you can find what you're looking for and jump to that location in the code upon selecting the result.

;; Try these commands with =M-x=:

;; - =lsp-ivy-workspace-symbol= - Search for a symbol name in the current project workspace
;; - =lsp-ivy-global-workspace-symbol= - Search for a symbol name in all active project workspaces


(use-package lsp-ivy
  :ensure t)

;; flycheck


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Company-mode
;; [[http://company-mode.github.io/][Company Mode]] provides a nicer in-buffer completion interface than =completion-at-point= which is more reminiscent of what you would expect from an IDE.  We add a simple configuration to make the keybindings a little more useful (=TAB= now completes the selection and initiates completion at the current location if needed).

;; We also use [[https://github.com/sebastiencs/company-box][company-box]] to further enhance the look of the completions with icons and better overall presentation


(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; projectile
;; [[https://projectile.mx/][Projectile]] is a project management library for Emacs which makes it a lot easier to navigate around code projects for various languages.  Many packages integrate with Projectile so it's a good idea to have it installed even if you don't use its commands directly.


;; ~(setq projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))~

;; ~M-x projectile-discover-projects-in-search-path~

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  ;; :bind-keymap
  ;; ("C-c p" . projectile-command-map)

  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  ;; (when (file-directory-p "~/Projects/Code")
  ;;   (setq projectile-project-search-path '("~/Projects/Code")))
  ;; (setq projectile-switch-project-action #'projectile-dired)
  )

(use-package counsel-projectile
  :config (counsel-projectile-mode))
(setq projectile-project-search-path '("~/ghq/github.com/DaryCC/" ))

(use-package js2-mode
  :init
    (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
    (add-hook 'prog-mode-hook 'highlight-numbers-mode)
    (add-hook 'js2-mode-hook #'impatient-mode)
  :mode "\\.\\(js\\|json\\)$"
    ;; :mode "\\.json\\'"
  :ensure t

  :config
   (add-hook 'js-mode-hook 'js2-minor-mode)
   (setq js-indent-level 2)
   (setq js2-indent-level 2)
   (setq js2-basic-offset 2)
   (setq js2-mode-show-strict-warnings nil)
   (setq js2-strict-inconsistent-return-warning t)
   (setq js2-strict-missing-semi-warning t)
   ;; (run import-js)
  :interpreter (("node" . js2-mode)))


 ;; refactoring
   (use-package js2-refactor)
 ;; find definitions and references
   ;; (use-package xref-js2)


;; Choosing a formatter

(use-package web-beautify
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))

;; React (rjsx-mode)


(use-package rjsx-mode
:ensure t
:mode "\\.jsx\\'"
;; :mode "\\.\\(js\\|jsx\\)$"
:bind
(:map rjsx-mode-map
      ( "C-c C-b" . rjsx-jump-opening-tag)
      ( "C-c C-f" . rjsx-jump-closing-tag)
      ))

;; css


(use-package css-mode
  :mode "\\.css\\'"
    :commands web-mode
    :init
    (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
    (add-hook 'prog-mode-hook 'highlight-numbers-mode)
    (add-hook 'web-mode-hook #'impatient-mode)
    :mode (
             ("\\.css\\'" . web-mode))
  )

;; emmet-mode
;; ~C-return   emmet-expand snippet~

(use-package emmet-mode
  :diminish (emmet-mode . "ε")
  :bind* (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point))
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

;; TypeScript

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;;python-shell-interpreter es para live-py-mode (evaluacón en vivo)
;; (setq python-shell-interpreter "~/.pyenv/shims/python")
(use-package python-mode
  :ensure t
  :custom
  (setq python-shell-interpreter "~/.pyenv/shims/python")
  (require 'dap-python)
  (setq py-shell-name "~/.pyenv/shims/python"
                  ;;;To change the Python default shell use
                  ;;;   M-x customize-variable py-shell-name
                  ;;; or
                            ;;(setq py-shell-name "PATH/TO/MYP-YTHON")
                  ;; py-shell-name sets the default, which might be overwritten by command

                  ;; Should the buffer code contain a shebang specifying pythonVERSION , than this takes precedence over default setting.

                  ;; You may enforce executing buffer through specific pythonVERSION by calling a command of class py-execute-buffer-pythonVERSION

                  ;; See menu PyExec, entry Execute buffer .
        )
  ;; (setq python-shell-interpreter "python3")
  ;; If you have more than one version of python installed on your system you may want to tell emacs which one of those to use.
  ;; The python interpreter that emacs will use is controlled by the py-python-command variable. You can set it with:
  (setq py-python-command "~/.pyenv/shims/python")
  (setq python-shell-completion-native-enable t)
  )

;; pyevn (manejo de versiones de python)
;; Para trabajar en ambientes virtuales uso ~virtualenvwrapper~ como alternativa a ~venv~.

(use-package pyvenv
  :ensure t
  :defer t
  :diminish
  :config

  (setenv "WORKON_HOME" "/home/dary/Environments")
                                      ; Show python venv name in modeline
  (setq pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "] ")))
  (pyvenv-mode t))

;; dap-mode
;; Optionally if you want to use debugger

(use-package dap-mode
  :ensure t)

;; Drag stuff

(bind-keys*
 ;;     ("C-o" . other-window)
 ;;     ("C-M-n" . forward-page)
 ("C-S-k" . drag-stuff-up )
 ("C-S-j" . drag-stuff-down )
 ("M-s M-s" . desktop+-create )
 ("M-s M-r" . desktop+-load)
 )

;; Find this file
;;    Create binding to spacemacs.org file


(defun spacemacs/find-config-file ()
  (interactive)
  (find-file (concat dotspacemacs-directory "/spacemacs.org")))

(spacemacs/set-leader-keys "fec" 'spacemacs/find-config-file)
