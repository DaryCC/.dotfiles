;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     html
     python
     dap
     django
;; (require 'django-mode)
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t
                      
                                      ;; auto-completion-return-key-behavior 'complete
                                       ;;auto-completion-tab-key-behavior 'cycle
                                       auto-completion-complete-with-key-sequence nil
                                       auto-completion-complete-with-key-sequence-delay 0.1
                                       auto-completion-minimum-prefix-length 1
                                       auto-completion-idle-delay 0.2
                                       auto-completion-private-snippets-directory nil
                                       ;;auto-completion-enable-snippets-in-popup nil
                                       auto-completion-enable-help-tooltip t
                                       auto-completion-use-company-box t
                                       auto-completion-enable-sort-by-usage t
                                       spacemacs-default-company-backends '(company-files company-capf)
                                       )
     ;; better-defaults
     emacs-lisp
     git
     helm
     lsp
     (python
      :variables
      ;; python-backend 'anaconda
      python-backend 'lsp)

     ;; github
     ;; markdown
     multiple-cursors
     org
     shell
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     treemacs
    
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
;; nose que
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
    dotspacemacs-configuration-layers
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil
   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         doom-gruvbox
                         doom-dracula
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;;'(
   ;;   :relative t
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;    :size-limit-kb
   ;;    1000
   ;;                       )


   ;;(display-line-numbers-mode)
   ;;(setq display-line-numbers 'relative)


   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                                       :disabled-for-modes dired-mode
                                       doc-view-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

;;dary
(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be
before packages are loaded."

  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes/")

  ;; (require 'doom-themes-base "~/.emacs.d/private/themes/doom-themes-base.el")


  (package-initialize)
  (require 'package)

  ;; (require 'django-mode)
 
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun efs/set-font-faces ()
    (message "Setting faces!")
    (set-face-attribute 'default nil :font "Source Code Pro"  :weight 'normal )
    ;; Set the fixed pitch face
    (set-face-attribute 'fixed-pitch nil :font "Source Code Pro" )

    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil :font "Source Code Pro" :weight 'regular)
    (load-theme 'doom-gruvbox t);;ESTE ES EL BUENO
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled

    )

  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (setq doom-modeline-icon t)
                  (with-selected-frame frame
                    (efs/set-font-faces) )
                  )
                ;; (load-theme 'doom-gruvbox t)
                )
    (efs/set-font-faces))

  (require 'doom-themes)
  ;; (load-theme 'doom-gruvbox t)
  (evil-leader/set-key "q q" 'spacemacs/frame-killer)
  ;; (defun my-load-theme (theme)
  ;;   (add-hook 'after-make-frame-functions
  ;;             (lambda (frame)
  ;;               (select-frame frame)
  ;;               (when (display-graphic-p frame)
  ;;                 (load-theme theme t)))))
  ;; (my-load-theme 'doom-gruvbox)
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (with-eval-after-load 'doom-themes
  ;;   (doom-themes-treemacs-config))

  (setq python-shell-interpreter "python3")
  ;;COMPANY SHIT
  (use-package company
    :bind (:map company-active-map
                ("C-n" . company-select-next)
                ("C-p" . company-select-previous))
    :config
    (setq company-idle-delay 0.3)
    (global-company-mode t)

    (setq company-backends
          '(company-capfi
            company-yasnippet
            company-files
            company-dabbrev
            company-dabbrev-code
            company-gtags
            company-etags
            company-keywords
            ;; company-web-html
            ;; company-css-html-tags
            ;; company-css
            ;; checar anacaonda mode para python aqui https://github.com/pythonic-emacs/company-anaconda
            )
          )
    )

  (use-package web-mode
    ;; :commands (web-mode company-web-html)
    :ensure t
    :defer t
    ;; :init 
    ;; (add-hook 'company-web #'company-web-html t)
    :mode (
	           ("\\.html\\'" . web-mode))
    ;(unless (assoc "Bootstrap" web-completion-data-sources)
    ;;   (setq web-completion-data-sources
    ;;         (cons (cons "Bootstrap" "/path/to/complete/data")
    ;;               web-completion-data-sources)))
                                        ;(describe-variable 'company-web-completion-data-p)
    :init
      (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
      (add-hook 'prog-mode-hook 'highlight-numbers-mode)
      (add-hook 'web-mode-hook #'impatient-mode)
    ;; (spacemacs|add-company-backends
    ;;   :backends company-web
    ;;   :modes -mode)
      (defun complete_html ()
        "Hook for `web-mode'."
        (set (make-local-variable 'company-backends)
             '(company-tern company-web-html company-yasnippet company-files))


        (local-set-key (kbd "M-=") 'company-web-html))
      (add-hook 'web-mode-hook 'complete_html)

    :config
    (require 'company)
    (require 'company-web)
    (require 'company-web-html)




  ;;   ;; you may key bind, for example for web-mode:
  ;;   ;; (define-key web-mode-map (kbd "C-'") 'company-web-html)

    );;end company-web


  ;;PARA HTML
  ;; (use-package web-mode
  ;;   :ensure t
  ;;   :mode (
	;;          ("\\.html\\'" . web-mode))
  ;;   :init
  ;;   (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  ;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode)
  ;;   (add-hook 'web-mode-hook #'impatient-mode)
  ;;   )



  ;; (require 'web-mode)
  ;; (add-to-list 'auto-mode-alist '("\\.html$" . web-mode))


  ;; (add-hook 'web-mode-hook (lambda ()
  ;;                            (set (make-local-variable 'company-backends) '(company-web-html))
  ;;                            (company-mode t)))


  ;;FIRA CODE     https://github.com/jming422/fira-code-mode
  ;; (use-package fira-code-mode
  ;;   :ensure t
  ;;   :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
  ;;   :hook prog-mode
  ;;   :config (fira-code-mode-set-font)
  ;;   ) ;; Enables fira-code-mode automatically for programming major modes

  ;;SMARTPARENS
  ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
  ;; (default nil)
  ;; dotspacemacs-smartparens-strict-mode t

  ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
  ;; over any automatically added closing parenthesis, bracket, quote, etc…
  ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
  ;; dotspacemacs-smart-closing-parenthesis t

  ;; Select a scope to highlight delimiters. Possible values are `any',
  ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
  ;; emphasis the current one). (default 'all)
  ;; dotspacemacs-highlight-delimiters 'all

  ;;org-mode
  ;;The auto-fill-mode function can be used to toggle auto fill mode for a buffer.
  ;;Also check org-fill-paragraph for this task.
  ;; (require org-download) for image pasting
  (use-package org
    ;; :hook (org-mode . toc-org-enable)
    :hook
    (add-hook 'org-mode-hook 'auto-indent-mode)
    ;; (add-hook 'dired-mode-hook 'org-download-enable)
    :config
    (add-hook 'org-mode-hook 'turn-on-auto-fill)
    (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters)
    :custom
    (org-ellipsis "⤵")

    )
  (setq org-todo-keywords
        '((sequence "TODO(t)"
                    "PROGRESS(n)"
                    "DELEGATED(D)"
                    "|"
                    "CANCELLED(c)"
                    "DONE(F)")))
  ;;If you then press C-c C-t followed by the selection key, the entry is switched to this state. SPC can be used to remove any TODO keyword from an entry.
;;for auto indent
  (use-package auto-indent-mode
    :ensure t
    )
  ;;configuración para lsp
  (use-package lsp-mode
    ;; :commands lsp
    ;; :commands (lsp lsp-deferred)
    :ensure t
    :hook (
	         (web-mode . lsp)
	         (lsp-mode . lsp-enable-which-key-integration)
           (js2-mode . lsp)
           (rjsx-mode . lsp)
           (css-mode . lsp)
           (html-mode . lsp) 
           (python-mode . lsp) 

	         )
    ;; :commands lsp-deferred
    )
  ;; python
  ;; (python :variables python-backend 'anaconda)
  (use-package python-mode
    :ensure t 
    :custom 
    ;; (python-shell-interprer "python3")
    (require 'dap-python)
    ;; (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
    (setq py-shell-name "/usr/bin/python3")
    ;; (setq python-shell-interpreter "python3")
    (setq py-python-command "/usr/bin/python3")
    (setq python-shell-completion-native-enable t)
    )
;;   (setq py-shell-name "/usr/bin/python3")
;;   (setq python-shell-interpreter "python3")
;; (setq py-python-command "/usr/bin/python3")
;; (setq python-shell-completion-native-enable t)

;; (use-package django-mode
;;   :ensure t
 
;;   )

;;PARA HTML Y CSS
  ;;ESTA PARTE ES PARA WEB DEVELOPEMENT
  (use-package web-beautify
    :commands (web-beautify-css
               web-beautify-css-buffer
               web-beautify-html
               web-beautify-html-buffer
               web-beautify-js
               web-beautify-js-buffer))

  ;;EMMET MODE
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
;;PARA CSS
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
;;PARA  REACT
  (use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :bind
  (:map rjsx-mode-map
        ( "C-c C-b" . rjsx-jump-opening-tag)
        ( "C-c C-f" . rjsx-jump-closing-tag)
        ))
;;PARA JS
  ;; ;;EMACS + JS   (use-package js2-mode
  ;; (use-package js2-mode
  ;;   :ensure t
  ;;   :interpreter (("node" . js2-mode))
  ;;   :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
  ;;   :mode "\\.\\(js\\|json\\)$"
  ;;   :config
  ;;   (add-hook 'js-mode-hook 'js2-minor-mode)
  ;;   (setq js2-basic-offset 2
  ;;         js2-highlight-level 3
  ;;         js2-mode-show-parse-errors nil
  ;;         js2-mode-show-strict-warnings nil)

  ;;   :init
  ;;   (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  ;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode)
  ;;   (add-hook 'js2-mode-hook #'impatient-mode)
  ;;   )
  (use-package js2-mode
    :init
      (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
      (add-hook 'prog-mode-hook 'highlight-numbers-mode)
      (add-hook 'js2-mode-hook #'impatient-mode)
    :mode "\\.\\(js\\|json\\)$"
    :ensure t
    :interpreter (("node" . js2-mode))

    :config
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (setq js-indent-level 2)
    (setq js2-indent-level 2)
    (setq js2-basic-offset 2)
    (setq js2-mode-show-strict-warnings nil)
    (setq js2-strict-inconsistent-return-warning t)
    (setq js2-strict-missing-semi-warning t)

    )
  ;; disable jshint since we prefer eslint checking
  ;; (setq-default flycheck-disabled-checkers
  ;;               (append flycheck-disabled-checkers
  ;;                       '(javascript-jshint)))
  ;; (setq flycheck-checkers '(javascript-eslint))
  ;; ;; use eslint with web-mode for jsx files
  ;; (flycheck-add-mode 'javascript-eslint 'web-mode) (use-package rjsx-mode
  ;;   :mode "\\.jsx\\'"
  ;;   :bind
  ;;   (:map rjsx-mode-map
  ;;         ("C-c C-b" . rjsx-jump-opening-tag)
  ;;         ("C-c C-f" . rjsx-jump-closing-tag)))

  ;;settings for powerline

  ;; ELISP STUFF
  ;;This minor mode for Elisp balances quotes and parenthesis automatically
  (use-package paredit
    :ensure t)
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;;RAINBOW DELIMITERS
  (use-package rainbow-delimiters
    :hook
    (prog-mode . rainbow-delimiters-mode))
 ;; highlight-indent
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


  ;; highlight-indent
  (use-package highlight-indent-guides
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    :custom
    (highlight-indent-guides-method 'character )
    ;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    ;; :init
    ;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

    )
  ;; TREEMACS
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
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))
  ;;PARA ORGMODE
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "DOINGNOW(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "|" "CANCELLED(c!)" "DONE(F!)")))
  ;; para orgmode
  ;; para templates
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  ;;PARA USAR GRIPREP
  (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
  (use-package helm-ag
	  :config
	  (custom-set-variables
	   ;;'(helm-ag-fuzzy-match: t)
	   '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
     )
   )



  ;;PARA MOVER  BLOQUES DE SELECCIÓN
  ;; To bind multiple keys in a `bind-key*' way (to be sure that your bindings
  ;; will not be overridden by other modes), you may use `bind-keys*' macro:
  ;;
  (bind-keys*
   ;;     ("C-o" . other-window)
   ;;     ("C-M-n" . forward-page)
   ("C-S-k" . drag-stuff-up )
   ("C-S-j" . drag-stuff-down )
   ("M-s M-s" . desktop+-create )
   ("M-s M-r" . desktop+-load)
   )

  ;;PARA MOSTRAR LA NUMERACIÓN RELATIVA
  (setq-default display-line-numbers-type 'relative
                display-line-numbers-current-absolute t
                display-line-numbers-width 4
                display-line-numbers-widen t)
  (add-hook 'text-mode-hook #'display-line-numbers-mode)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  ;; (add-hook 'treemacs-mode-hook #'display-line-numbers-mode)
  ;; SET TRANSPARENCY
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha  100 100))
;;CREO QUE ES PARA EL MINIBUFFER
 (setq ns-use-srgbcolorspace nil)

 ;; NYAN MODE
;; (use-package nyan-mode
;;    :custom
;;    (nyan-cat-face-number 4)
 ;;    (nyan-animate-nyancat t)
;;    :hook
;;    (doom-modeline-mode . nyan-mode))


 ;;PARA USAR TEMAS
 ;;INSTALAR FONTS PARA ICONOS https://www.hackercitizen.com/emacs-for-windows-10-install-all-the-icons/
 ;; instalar tambien   M-x package-install all-the-icons    M-x all-the-icons-install-fonts
 ;;https://github.com/domtronn/all-the-icons.el#installation
 (use-package all-the-icons
   :ensure t
   :if (display-graphic-p))


 ;;INSTALAR TEMAS
 (use-package doom-themes
   :ensure t
   :config
   ;; Global settings (defaults)

   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled

   (load-theme 'doom-gruvbox t)
   ;; Enable flashing mode-line on errors
   (doom-themes-visual-bell-config)
   ;; Enable custom neotree theme (all-the-icons must be installed!)
   (doom-themes-neotree-config)
   ;; or for treemacs users
   (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme "doom-atom"
   (doom-themes-treemacs-config)
   ;; Corrects (and improves) org-mode's native fontification.
   (doom-themes-org-config)
   )
 ;;DOOM-MODELINE
 ;; (require 'doom-modeline)
 ;; (doom-modeline-init)
 (use-package doom-modeline
   :ensure t
   :defer nil
   :init (doom-modeline-mode 1)
   :hook (after-init . doom-modeline-mode)
   :custom
    (doom-modeline-height 25)
    (doom-modeline-bar-width 1)
    (doom-modeline-icon t)
    (doom-modeline-major-mode-icon t)
    (doom-modeline-major-mode-color-icon t)
    (doom-modeline-buffer-file-name-style 'truncate-upto-project)
    (doom-modeline-buffer-state-icon t)
    (doom-modeline-buffer-modification-icon t)
    (doom-modeline-minor-modes nil)
    (doom-modeline-enable-word-count nil)
    (doom-modeline-buffer-encoding t)
    (doom-modeline-indent-info nil)
    (doom-modeline-checker-simple-format t)
    (doom-modeline-vcs-max-length 12)
    (doom-modeline-env-version t)
    (doom-modeline-irc-stylize 'identity)
    (doom-modeline-github-timer nil)
    (doom-modeline-gnus-timer nil)
   )

;; LSP-mode    PARA PROGRAMAR
  ;; (use-package lsp-mode
  ;;   :init
  ;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;;   (setq lsp-keymap-prefix "C-c l")
  ;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
  ;;          (XXX-mode . lsp)
  ;;          ;; if you want which-key integration
  ;;          (lsp-mode . lsp-enable-which-key-integration))
  ;;   :commands lsp)

  ;; optionally
  ;; (use-package lsp-ui :commands lsp-ui-mode)
  ;; if you are helm user
  ;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
  ;; if you are ivy user
  (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
  (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

  ;; optionally if you want to use debugger
  (use-package dap-mode
    :ensure t)

  ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

  ;; optional if you want which-key integration
  (use-package which-key
    :config
    (which-key-mode))

  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
;;;ESTA SECCIÓN ES LA CONFIGURACIÓN ANTERIOR, MEDIO FUNCIONAL  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ;; (use-package typescript-mode
  ;;   :mode "\\.ts\\'"
  ;; :hook (typescript-mode. lsp-deferred)
  ;; :config
  ;; (setq typescript-indent-level 2)
  ;; (require 'dap-node)
  ;; (dap-node-setup);;automatically installs Node debug adapter if needed
  ;; )

  ;; ;;EMACS + JS   (use-package js2-mode
  ;; (use-package js2-mode
  ;;   :ensure t
  ;;   :interpreter (("node" . js2-mode))
  ;;   :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
  ;;   :mode "\\.\\(js\\|json\\)$"
  ;;   :config
  ;;   (add-hook 'js-mode-hook 'js2-minor-mode)
  ;;   (setq js2-basic-offset 2
  ;;         js2-highlight-level 3
  ;;         js2-mode-show-parse-errors nil
  ;;         js2-mode-show-strict-warnings nil)

  ;;   :init
  ;;   (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  ;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode)
  ;;   (add-hook 'js2-mode-hook #'impatient-mode)
  ;;   )

  ;; (add-hook 'js2-mode-hook 'skewer-mode)
  ;; ;;(add-hook 'css-mode-hook 'skewer-css-mode)
  ;; (add-hook 'html-mode-hook 'skewer-html-mode)
  ;; (add-hook 'css-mode-hook #'impatient-mode)
  ;; (use-package web-mode
  ;;   :ensure t
  ;;   :mode (
  ;;          ;;("\\.js\\'" . web-mode)
	;;          ;;("\\.jsx\\'" .  web-mode)
	;;          ;;("\\.ts\\'" . web-mode)
	;;          ;;("\\.tsx\\'" . web-mode)
	;;          ("\\.html\\'" . web-mode))
  ;;   :commands web-mode
  ;;   :init
  ;;   (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  ;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode)
  ;;   (add-hook 'web-mode-hook #'impatient-mode)

  ;;   )
  ;; ;;CSS MODE
  ;; (use-package css-mode
  ;;   :ensure t
  ;;   :mode (
  ;;          ;;("\\.js\\'" . web-mode)
	;;          ;;("\\.jsx\\'" .  web-mode)
	;;          ;;("\\.ts\\'" . web-mode)
	;;          ;;("\\.tsx\\'" . web-mode)
	;;          ("\\.css\\'" . web-mode))
  ;;   :commands web-mode
  ;;   :init
  ;;   (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  ;;   (add-hook 'prog-mode-hook 'highlight-numbers-mode)
  ;;   (add-hook 'web-mode-hook #'impatient-mode)

  ;;   )
  ;; ;; lsp-mode
  ;; (use-package lsp-mode
  ;;   :ensure t
  ;;   :hook (
	;;          (web-mode . lsp-deferred)
	;;          (lsp-mode . lsp-enable-which-key-integration)
	;;          )
  ;;   :commands lsp-deferred)

  ;; (setq lsp-log-io nil) ;; Don't log everything = speed
  ;; (setq lsp-keymap-prefix "C-c l")
  ;; (setq lsp-restart 'auto-restart)
  ;; (setq lsp-ui-sideline-show-diagnostics t)
  ;; (setq lsp-ui-sideline-show-hover t)
  ;; (setq lsp-ui-sideline-show-code-actions t)

  ;; AQUI TERMINA LA SECCION DE WEV DEVELOPEMENT ANTERIOR   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions. (defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" default))
 '(dap-mode t nil (dap-mode))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
 '(package-selected-packages
   '(fira-code-mode yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode pydoc py-isort poetry pippel pipenv pyvenv pip-requirements nose lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-cscope xcscope cython-mode company-anaconda blacken anaconda-mode pythonic treemacs-all-the-icons desktop+ gruvbox-theme skewer-reload-stylesheets ewal-doom-themes tern npm-mode nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags dap-mode bui counsel-gtags yasnippet web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode htmlize simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data company add-node-modules-path doom-themes dracula-theme ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs pfuture posframe toc-org symon symbol-overlay string-inflection string-edit spaceline-all-the-icons memoize all-the-icons spaceline powerline restart-emacs request rainbow-delimiters quickrun popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless multi-line shut-up macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils elisp-slime-nav editorconfig dumb-jump s drag-stuff dired-quick-sort define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol ht dash auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy which-key use-package popup pcre2el hydra hybrid-mode helm-core font-lock+ dotenv-mode diminish bind-map)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" default))
 '(dap-mode t nil (dap-mode))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
 '(package-selected-packages
   '(spotify all-the-icons-ivy-rich all-the-icons-ivy fira-code-mode yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode pydoc py-isort poetry pippel pipenv pyvenv pip-requirements nose lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-cscope xcscope cython-mode company-anaconda blacken anaconda-mode pythonic treemacs-all-the-icons desktop+ gruvbox-theme skewer-reload-stylesheets ewal-doom-themes tern npm-mode nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags dap-mode bui counsel-gtags yasnippet web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode htmlize simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data company add-node-modules-path doom-themes dracula-theme ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs pfuture posframe toc-org symon symbol-overlay string-inflection string-edit spaceline-all-the-icons memoize all-the-icons spaceline powerline restart-emacs request rainbow-delimiters quickrun popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless multi-line shut-up macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils elisp-slime-nav editorconfig dumb-jump s drag-stuff dired-quick-sort define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol ht dash auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy which-key use-package popup pcre2el hydra hybrid-mode helm-core font-lock+ dotenv-mode diminish bind-map))
 '(py-shell-name "python3")
 '(safe-local-variable-values
   '((pony-settings make-pony-project :python "/usr/bin/python3" :settings)
     (eval progn
           (pp-buffer)
           (indent-buffer))
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
) 

