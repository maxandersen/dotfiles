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
   '(ruby
     windows-scripts
     python
     lua
     rust
     rust
     csv
     typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     helm
     multiple-cursors
     docker
     ranger
     emoji
     lsp
     asciidoc
     games
     spotify
     (deft :variables
       deft-directory "~/Dropbox/notes"
       deft-recursive t
       ) 
     (org :variables
          org-enable-github-support t
          org-want-todo-bindings t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;; shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     osx
     themes-megapack
     evil-commentary
     html
     (java :variables java-backend 'lsp)
     javascript
     go
     yaml
     plantuml
     restclient
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(org-super-agenda org-autolist easy-hugo org-ql yequake quelpa-use-package org-sidebar ox-reveal)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
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
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

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

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

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

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("JetBrains Mono"
                               :size 13
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

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
   dotspacemacs-auto-save-file-location 'original
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

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

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

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (delete-selection-mode 1) ; make selection get deleted on typing/pasting to be sane
  (spacemacs/set-leader-keys "aob" #'org-switchb)

  ;;(with-eval-after-load 'org-agenda
  ;;  (require 'org-projectile)
  ;;  (push (org-projectile:todo-files) org-agenda-files))

  ;; this is so buffers like org agendas actually can be switched
  ;; back to more easily.
  (setq spacemacs-useless-buffers-regexp '("^ "))

  ;; stop asking if you want to follow symlinks to git controlled files.
  ;; just do it
  (setq vc-follow-symlinks t)


  (with-eval-after-load 'org
    (setq org-use-speed-commands t)

    
    ;;; handle message links
    (when (eq system-type 'darwin)          ; I only run MailMate on Mac
      (org-link-set-parameters "message"
                               :follow
                               '(lambda (path) (shell-command (format "open 'message://%s'" path)))))


      ;;; set created property start
    (require 'org-expiry)
    (org-expiry-insinuate)
    (setq org-expiry-inactive-timestamps t)

    (setq org-treat-insert-todo-heading-as-state-change t)


    ;;; set created property end


    (defun meeting-notes ()
      "Call this after creating an org-mode heading for where the notes for the meeting
should be. After calling this function, call 'meeting-done' to reset the environment."
      (interactive)
      (outline-mark-subtree)                              ;; Select org-mode section
      (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
      (deactivate-mark)
      (delete-other-windows                              ;; Get rid of other windows
      (text-scale-set 2)                                  ;; Text is now readable by others
      (fringe-mode 0)
      (message "When finished taking your notes, run meeting-done."))

    (defun meeting-done ()
      "Attempt to 'undo' the effects of taking meeting notes."
      (interactive)
      (widen)                                       ;; Opposite of narrow-to-region
      (text-scale-set 0)                            ;; Reset the font size increase
      (fringe-mode 1)
      (winner-undo))                                ;; Put the windows back in place
    )

    
    (use-package quelpa-use-package
      :ensure t
      )

;    (use-package bufler
;      :quelpa (bufler :fetcher github :repo "alphapapa/bufler.el"
;                      :files (:defaults (:exclude "helm-bufler.el"))))

    (use-package yequake
      :quelpa (yequake :fetcher github :repo "alphapapa/yequake")

      :custom
      (yequake-frames
       '(("org-capture" 
          (buffer-fns . (yequake-org-capture))
          (width . 0.50)
          (height . 0.5)
          (alpha . 0.95)
          (frame-parameters . ((undecorated . t)
                               (skip-taskbar . t)
                               (sticky . t)))))))

    (use-package ox-reveal
      :ensure t
      :config (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
      )

    (use-package org-super-agenda
      :quelpa (org-super-agenda :fetcher github :repo "alphapapa/org-super-agenda")
      :ensure t
      :config
      (org-super-agenda-mode)
      )
      

    (use-package org-ql
      :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql")

      )
    (use-package org-sidebar
      :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar")
      )

  (use-package org-autolist
    :ensure t
    :init
    (add-hook 'org-mode-hook (lambda () (org-autolist-mode)))
    )

  (use-package evil-goggles
    :ensure t
    :config
    (evil-goggles-mode)

    ;; optionally use diff-mode's faces; as a result, deleted text
    ;; will be highlighed with `diff-removed` face which is typically
    ;; some red color (as defined by the color theme)
    ;; other faces such as `diff-added` will be used for other actions
    (evil-goggles-use-diff-faces))


  (setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "This day"
                :time-grid t
                :todo ("TODO" "NEXT")
                )
         (:name "Important/Urgent"
                ;; Single arguments given alone
                :tag ("important" "urgent")
                )

         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))

  (setq org-tag-alist
  (append org-tag-alist '(
        ("important" . ?i)
        ("urgent"    . ?u)
        )
          ))

  (defun my-dnd-func (event)
  (interactive "e")
  (goto-char (nth 1 (event-start event)))
  (x-focus-frame nil)
  (let* ((payload (car (last event)))
         (type (car payload))
         (fname (cadr payload))
         (img-regexp "\\(png\\|jp[e]?g\\)\\>"))
    (cond
     ;; insert image link
     ((and  (eq 'drag-n-drop (car event))
            (eq 'file type)
            (string-match img-regexp fname))
      (insert (format "[[%s]]" fname))
      (org-display-inline-images t t))
     ;; insert image link with caption
     ((and  (eq 'C-drag-n-drop (car event))
            (eq 'file type)
            (string-match img-regexp fname))
      (insert "#+ATTR_ORG: :width 300\n")
      (insert (concat  "#+CAPTION: " (read-input "Caption: ") "\n"))
      (insert (format "[[%s]]" fname))
      (org-display-inline-images t t))
     ;; C-drag-n-drop to open a file
     ((and  (eq 'C-drag-n-drop (car event))
            (eq 'file type))
      (find-file fname))
     ((and (eq 'M-drag-n-drop (car event))
           (eq 'file type))
      (insert (format "[[attachfile:%s]]" fname)))
     ;; regular drag and drop on file
     ((eq 'file type)
      (insert (format "[[%s]]\n" fname)))
     (t
      (error "I am not equipped for dnd on %s" payload)))))


  (define-key org-mode-map (kbd "<drag-n-drop>") 'my-dnd-func)
  (define-key org-mode-map (kbd "<C-drag-n-drop>") 'my-dnd-func)
  (define-key org-mode-map (kbd "<M-drag-n-drop>") 'my-dnd-func)

  (defun my/org-sidebar ()
    "Display my Org Sidebar."
    (interactive)
    (org-sidebar
     :sidebars (make-org-sidebar
                :name "My Sidebar"
                :description "My sidebar items"
                :items (org-ql (org-agenda-files)
                         (and (not (done))
                              (or (deadline auto)
                                  (scheduled :on today)))
                         :action element-with-markers))))


  (defun my/org-today-sidebar ()
    "Show my Org Today Sidebar."
    (interactive)
    (org-sidebar
     :sidebars (make-org-sidebar
                :name "Today"
                :description "Today items"
                :items (org-ql (org-agenda-files)
                         (and (not (done))
                              (or (deadline auto)
                                  (scheduled :to today)))
                         :action element-with-markers)
                :super-groups '((:time-grid t)
                                (:name "Overdue" :scheduled past :deadline past)
                                (:name "Due today" :scheduled today :deadline today)
                                (:tag "bills")
                                (:priority "A")
                                (:name "Non-tasks"
                                       :todo nil)))))

  (defun org-my-auto-exclude-function (tag)
      (and (cond
            ((string= tag "home") ; exclude home tasks if working time
             (let ((hour (nth 2 (decode-time))))
               (and (> hour 8) (< hour 19)))
             ))
           (concat "-" tag)))



  ;(setq org-agenda-auto-exclude-function 'org-my-auto-exclude-function)

  ;; https://daryl.wakatara.com/a-better-gtd-and-crm-flow-for-emacs-org-mode/
  (setq
   org-agenda-custom-commands '(
                                 ("u" "Super view"
                                  ((agenda "" ( (org-agenda-span 1)
                                                (org-super-agenda-groups
                                                 '((:name "Today"
                                                          :tag ("bday" "ann" "hols" "cal" "today")
                                                          :time-grid t
                                                          :todo ("WIP")
                                                          :deadline today)
                                                   (:name "Perso"
                                                          :tag "perso")
                                         aoo           (:name "Overdue"
                                                          :deadline past)
                                                   (:name "Reschedule"
                                                          :scheduled past)
                                                   (:name "Due Soon"
                                                          :deadline future)
                                                   ))))
                                   (tags (concat "w" (format-time-string "%V")) ((org-agenda-overriding-header  (concat "ToDos Week " (format-time-string "%V")))
                                                                                 (org-super-agenda-groups
                                                                                  '((:discard (:deadline t)) aoo
                                                                                    (:name "Perso"
                                                                                           :tag "perso")
                                                                                    (:name "Loka" 
                                                                                           :tag "loka")
                                                                                    (:name "Ping"
                                                                                           :tag "ping")
                                                                                    ))))
                                   ))

                                 ;; eisenhower http://www.tompurl.com/2015-12-29-emacs-eisenhower-matrix.html
                                 ("0" "What is next"
                                  ((org-ql-block '(and (todo)
                                                       (not
                                                        (descendants
                                                         (todo "NEXT")
                                                         )
                                                        )
                                                       )
                                                 )
                                   )
                                  )
                                 ("1" "Q1" tags-todo "+important+urgent")
                                 ("2" "Q2" tags-todo "+important-urgent")
                                 ("3" "Q3" tags-todo "-important+urgent")
                                 ("4" "Q4" tags-todo "-important-urgent")
                                 ))


  (setq org-directory "~/Dropbox/notes"
        org-capture-templates '(("t" "Todo [inbox]" entry
                                       (file "~/Dropbox/notes/inbox.org")
                                       "* TODO %i%? \n %U")
                                      ("T" "Tickler" entry
                                       (file "~/Dropbox/notes/tickler.org")
                                       "* %i%? \nx%U"))
        org-enforce-todo-dependencies t
        org-agenda-files (list
                           (format "%s/%s" org-directory "inbox.org")
                           (format "%s/%s" org-directory "people.org")
                           (format "%s/%s" org-directory "projects.org")
                           (format "%s/%s" org-directory "tickler.org")
                           )
        org-agenda-text-search-extra-files (quote (agenda-archives))
        org-agenda-search-view-always-boolean t  ;; make it so search is like google. implicit and on terms and use "" for explicit string search

        org-todo-keywords '(
                            (sequence "NEXT(n)" "TODO(t)" | "WIP(p)" | "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")
                            (sequence "TASK(f)" "|" "DONE(d)")
                            )


        org-todo-keyword-faces '(("TASK" :background "gold" :foreground "black" :weight bold)
                                 ("DONE" :background "forest green" :weight bold)
                                 ("CANCELLED" :background "lime green" :foreground "black" :weight bold))

                                        ;org-secratary.el
        org-tags-exclude-from-inheritance '("project")
        ;; setup capture
        org-default-notes-file (concat org-directory "/inbox.org")
        org-startup-with-inline-images t
        org-startup-indented t
        org-refile-targets '(("~/Dropbox/notes/projects.org" :maxlevel . 3)
                             ("~/Dropbox/notes/people.org" :maxlevel . 3)
                             ("~/Dropbox/notes/someday.org" :level . 1)
                             ("~/Dropbox/notes/tickler.org" :maxlevel . 2))
        org-outline-path-complete-in-steps nil         ; Refile in a single go
        org-refile-use-outline-path t                  ; Show full paths for refiling
        )
  ))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "341b2570a9bbfc1817074e3fad96a7eff06a75d8e2362c76a2c348d0e0877f31" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-skip-scheduled-if-deadline-is-shown (quote repeated-after-deadline))
 '(org-babel-load-languages (quote ((ditaa . t) (plantuml . t))))
 '(org-ditaa-jar-path "/Users/max/code/org-mode/contrib/scripts/ditaa.jar")
 '(org-plantuml-jar-path "~/plantuml.jar")
 '(package-selected-packages
   (quote
    (ox-reveal yequake rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm rbenv rake quelpa-use-package quelpa org-sidebar org-ql peg ov map minitest helm-themes helm-swoop helm-spotify-plus multi helm-pydoc helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag flyspell-correct-helm undo-tree chruby bundler inf-ruby dash ace-jump-helm-line powershell ts spinner anzu white-sand-theme mmt powerline smartparens rebecca-theme log4e gntp org-mime skewer-mode simple-httpd lv parent-mode haml-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flx exotica-theme highlight transient goto-chg json-mode tablist docker-tramp json-snatcher json-reformat diminish autothemer pkg-info epl web-completion-data dash-functional tern go-mode eclim bind-map bind-key anaconda-mode pythonic f markup-faces auto-complete popup evil-goggles ob-restclient ob-http company-restclient restclient know-your-http-well typescript-mode ht org-category-capture counsel swiper packed avy company iedit evil flycheck projectile helm helm-core ivy yasnippet markdown-mode alert org-plus-contrib magit magit-popup git-commit with-editor async hydra rust-mode js2-mode s easy-hugo zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sudoku sublime-themes subatomic256-theme subatomic-theme spotify spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs request ranger rainbow-delimiters railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin plantuml-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox pacmacs ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-super-agenda org-projectile org-present org-pomodoro org-download org-bullets org-autolist open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-make hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode counsel-projectile company-web company-tern company-statistics company-go company-emoji company-emacs-eclim company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adoc-mode adaptive-wrap ace-window ace-link ac-ispell 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
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
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "341b2570a9bbfc1817074e3fad96a7eff06a75d8e2362c76a2c348d0e0877f31" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(lsp-ui-doc-max-width 80)
 '(org-agenda-skip-additional-timestamps-same-entry t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown (quote repeated-after-deadline))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-deadline-is-shown t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-babel-load-languages (quote ((ditaa . t) (plantuml . t))))
 '(org-ditaa-jar-path "/Users/max/code/org-mode/contrib/scripts/ditaa.jar")
 '(org-loop-over-headlines-in-active-region (quote start-level))
 '(org-plantuml-jar-path "~/plantuml.jar")
 '(org-stuck-projects (quote (":project:/-DONE" ("NEXT" "NEXTACTION") nil "")))
 '(package-selected-packages
   (quote
    (deft ox-reveal yequake rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm rbenv rake quelpa-use-package quelpa org-sidebar org-ql peg ov map minitest helm-themes helm-swoop helm-spotify-plus multi helm-pydoc helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag flyspell-correct-helm undo-tree chruby bundler inf-ruby dash ace-jump-helm-line powershell ts spinner anzu white-sand-theme mmt powerline smartparens rebecca-theme log4e gntp org-mime skewer-mode simple-httpd lv parent-mode haml-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flx exotica-theme highlight transient goto-chg json-mode tablist docker-tramp json-snatcher json-reformat diminish autothemer pkg-info epl web-completion-data dash-functional tern go-mode eclim bind-map bind-key anaconda-mode pythonic f markup-faces auto-complete popup evil-goggles ob-restclient ob-http company-restclient restclient know-your-http-well typescript-mode ht org-category-capture counsel swiper packed avy company iedit evil flycheck projectile helm helm-core ivy yasnippet markdown-mode alert org-plus-contrib magit magit-popup git-commit with-editor async hydra rust-mode js2-mode s easy-hugo zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sudoku sublime-themes subatomic256-theme subatomic-theme spotify spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs request ranger rainbow-delimiters railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin plantuml-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox pacmacs ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-super-agenda org-projectile org-present org-pomodoro org-download org-bullets org-autolist open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl js2-refactor js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-make hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode counsel-projectile company-web company-tern company-statistics company-go company-emoji company-emacs-eclim company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adoc-mode adaptive-wrap ace-window ace-link ac-ispell 2048-game)))
 '(vc-follow-symlinks (quote ask))
 '(yequake-frames
   (quote
    (("org-capture"
      (buffer-fns yequake-org-capture)
      (width . 0.5)
      (height . 0.5)
      (alpha . 0.95)
      (frame-parameters
       (undecorated . t)
       (skip-taskbar . t)
       (sticky . t)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(markup-meta-face ((t (:stipple nil :foreground "gray100" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "unknown" :family "Monospace")))))
)
