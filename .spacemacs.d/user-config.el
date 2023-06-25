(require 'desktop)
(setq desktop-save 1)
(desktop-save-mode 1)

(package-initialize)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; función para cargar configuracion de fonts y temas
  (defun efs/set-font-faces ()
    (message "Setting faces!")
    (set-face-attribute 'default nil :font "Source Code Pro"  :weight 'normal )
    (set-face-attribute 'fixed-pitch nil :font "Source Code Pro" )
    (set-face-attribute 'variable-pitch nil :font "Source Code Pro" :weight 'regular)
    (load-theme 'doom-palenight  t);;ESTE ES EL BUENO
    ;; (load-theme 'doom-palenight t)
    )
  (message "fonts seteadas")

  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (setq doom-modeline-icon t)
                  (with-selected-frame frame
                    (efs/set-font-faces) )
                  )
                ;; (load-theme 'kaolin-valley-dark t)
                )
    (efs/set-font-faces))

  (require 'doom-palenight)

;; se reasigna cerrar frame
  (evil-leader/set-key "q q" 'spacemacs/frame-killer)

  (efs/set-font-faces)

  (defun my-load-theme (theme)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (when (display-graphic-p frame)
                  (load-theme theme t)))))
  (my-load-theme 'doom-palenight)

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

(setq-default dotspacemacs-configuration-layers
           '((syntax-checking :variables
                              syntax-checking-auto-hide-tooltips 5)))

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
    ;; (treemacs-resize-icons 44)

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

(use-package treemacs-icons-dired
  ;; :hook (dired-mode . treemacs-icons-dired-enable-once)
  :hook (dired-mode . treemacs-icons-dired-mode)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(require 'ivy-rich)
(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs
  )

(use-package ivy-rich
  :after (counsel-projectile)
  :config
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package all-the-icons
   :if (display-graphic-p)
   :config
   (setq all-the-icons-scale-factor 0.4))


;; Create binding to spacemacs.org file


(defun spacemacs/find-config-file ()
  (interactive)
  (find-file (concat dotspacemacs-directory "/spacemacs.org")))

(spacemacs/set-leader-keys "fec" 'spacemacs/find-config-file)
