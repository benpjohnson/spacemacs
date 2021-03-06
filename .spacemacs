;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base';; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     org
     auto-completion
     better-defaults
     emacs-lisp
     php
     sql
     markdown
     syntax-checking
     version-control
     spell-checking
     ansible
     git
     finance
     python
     yaml
     octave
     html
     myphp
     myorg
     javascript
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
     jenkins
     ein
     crontab-mode
     quickrun
     twig-mode
     scss-mode
     dsvn
     quickrun
     psvn
     filesets+
     helm-filesets
     helm-cmd-t
     ein
     geben
     ob-php
     w3m
     cygwin-mount
     csharp-mode
     evil-ediff
     deft
     discover
     grunt
     itail
    )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(hc-zenburn
                         zenburn
                         monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
   (add-to-list 'load-path "~/.emacs.d/private/local")
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; FIXME: windows specific

  (if (eq system-type 'windows-nt)
      (progn
        (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
        (setq ispell-program-name "aspell")
        (setq ispell-personal-dictionary "C:/tests/things/.ispell")
        (setq tramp-default-method "sshx")
        ))
  )

(defun dotspacemacs/user-config ()

  (setq deft-extensions '("org" "md"))
  (setq deft-directory "~/kb2/work/")
  (setq deft-recursive t)

  ;; Playing with org/notes.org
  ;; need to figure out filtering work from general stuff
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (define-key global-map "\C-cc" 'org-capture)

  ;; Windows specific
  (if (eq system-type 'windows-nt)
      (progn
        (setq cygwin-mount-cygwin-bin-directory "C:\\tests\\things\\cygwin\\bin")
        (setq cygwin-mount-cygwin-bin-directory "C:\\tests\\things\\cygwin\\bin")
        (setq cygwin-root-directory  "C:\\tests\\things\\cygwin")
        (load-file "~/.emacs.d/private/adhoc/cygwin-setup.el")
        (setq org-babel-sh-command "C:/tests/things/cygwin/bin/bash.exe")
        ;; FIXME: This is called for some reason
        ;; (let ((explicit-shell-file-name "C:/tests/things/cygwin/bin/bash.exe")) (call-interactively 'shell))
    )

    (defun cygwin-shell ()
      "Run cygwin bash in shell mode."
      ((interactive "P"))
      (let ((explicit-shell-file-name "C:/tests/things/cygwin/bin/zsh"))
        (call-interactively 'shell)))
    )
  ;; (setq projectile-svn-command . "ag -l .")
  ;; '(safe-local-variable-values (quote ((projectile-svn-command . "find . -type f -print0"))))

  (setq exec-path-from-shell-check-startup-files nil)

  ;; Attempt to make w behave like vim by including underscores in words for all modes
  ;; FIXME: needs to be for all text only modes
  ;; (add-hook '#'(lambda () ((modify-syntax-entry ?_ "w"))))
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'php-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'nxml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; Show autocomplete for snippets
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-snippets-in-popup t)))

  ;; Custom colours
  (add-to-list 'default-frame-alist '(background-color . "#1f1f1f"))
  (add-to-list 'default-frame-alist '(region . "#242424"))
  (set-face-attribute 'region nil :background "#666" :foreground "#1f1f1f")
  (set-face-background 'font-lock-comment-face "#1f1f1f")


;;  (global-set-key [(control f)] 'helm-imenu)


  (defun copy-file-name-to-clipboard ()
    "Copy the current buffer file name to the clipboard."
    (interactive)
    (let ((filename (if (equal major-mode 'dired-mode)
                        default-directory
                      (buffer-file-name))))
      (when filename
        (kill-new filename)
              (message "Copied buffer file name '%s' to the clipboard." filename))))

  (require 'helm-cmd-t)
  (load-file "~/.emacs.d/private/adhoc/magit-vcsh.el")
  (load-file "~/.emacs.d/private/adhoc/php-doc.el")

  (defvar my-org-folders (list  "~/kb2/work")
    "my permanent folders for helm-mini")


  ;; TODO: edit bin/ files

  ;; TODO: fileset? maybe for liquibase files

  ;; Figure out loading knowledge base. Use a custom prefix for my stuff
  ;; Also figure out description for better descriptions in the popup menu
  (spacemacs/declare-prefix "o" "o-prefix")

  ;; Using SPACE-o as custom prefix currently
  (spacemacs/set-leader-keys "oo" 'deft)
  (spacemacs/set-leader-keys "os" (lambda() (interactive)(find-file "~/.spacemacs")))
  (spacemacs/set-leader-keys "oz" (lambda() (interactive)(find-file "~/.zshrc")))
  (spacemacs/set-leader-keys "ob" (lambda() (interactive)(find-file "~/bin")))
  (spacemacs/set-leader-keys "oi" (lambda() (interactive)(helm-imenu)))

  ; Move backup files to tmp so they don't break things like liquibase
  (setq backup-directory-alist
        `(("." . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

  ;; Debug a simple PHP script.
  ;; Change the session key my-php-54 to any session key text you like
  (defun my-php-debug ()
    "Run current PHP script for debugging with geben"
    (interactive)
    (call-interactively 'geben)
    (shell-command
     (concat "XDEBUG_CONFIG='idekey=emacs' /usr/bin/php "
             (buffer-file-name) " &"))
    )

  (global-set-key [f5] 'my-php-debug)

  ;;change default browser for 'browse-url'  to w3m
  (setq browse-url-browser-function 'w3m-goto-url-new-session)

  ;;change w3m user-agent to android
  (setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")
  (setq-default dotspacemacs-configuration-layers
                '((python :variables python-test-runner 'pytest)))

  ;;quick access hacker news
  (defun hn ()
    (interactive)
    (browse-url "http://news.ycombinator.com"))

;;   (defun doc-block()
;;     "Insert doc block"
;;     (interactive)
;;     (let
;;         (
;;          (beg (point))
;;          (is-function (looking-at-p " *\\(\\(protected\\)\\|\\(public\\)\\|\\(protected\\)\\)? *function +\\([0-Z_-]+\\)(\\([^,)]+,?\\)*)" ))
;;          (is-class (looking-at-p "\s*class" ))
;;          )
;;       ( insert-string " /**
;;  * ")
;;       (if is-function (insert-string
;;                        " new function
;;  *
;;  * @param string $param
;;  * @retrun null"))
;;       (if is-class (insert-string " new class
;;    * "))

;;       (insert-string "
;;  * @author ")
;;       (insert-string (user-real-login-name))
;;       (insert-string "
;;  */
;; ")
;;       ;; re intent everything
;;       (forward-line 1)
;;       (indent-region beg (point))

;;       ;; select the description for easy edit
;;       (search-backward "/**")
;;       (forward-line 1)
;;       (search-forward "* ")
;;       (set-mark-command nil)
;;       (move-end-of-line nil)
;;       (setq deactivate-mark nil)
;;       )
;;     )
;;   (global-set-key "\C-cId" 'doc-block)


(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))

;; (define-key sh-mode-map [(control ?j)] 'sh-send-line-or-region-and-step)
;; (define-key sh-mode-map [(control ?c) (control ?z)] 'sh-switch-to-process-buffer)


 (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-ghc))


  ;; (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
  )

  ;; from: http://stackoverflow.com/questions/6286579/emacs-shell-mode-how-to-send-region-to-shell
  (defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ))


(put 'projectile-svn-command 'safe-local-variable 'stringp)
(setq projectile-enable-caching t)
(setq flycheck-phpcs-standard "PSR2")
(setq quickrun-focus-p nil)

;; Handle words the same way as vim
(add-hook 'php-mode #'(lambda () (modify-syntax-entry ?_ "w")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#313131"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(ein:cell-input-area ((t (:background "#1f1f1f"))))
 '(flycheck-error-list-error ((t (:background "red" :foreground "brightwhite"))))
 '(flycheck-warning ((t (:background "yellow" :foreground "black" :underline t :weight bold)))))
 '(flycheck-error ((t (:background "brightred" :foreground "black" :underline "black" :weight bold))))

; (setq debug-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(grunt-current-path "/var/www/html/grunt")
 '(package-selected-packages
   (quote
    (composer grunt tracwiki-mode ox-trac itail wolfram-mode yapfify web-beautify uuidgen powerline py-isort pug-mode spinner org-projectile alert log4e gntp org-download org mwim markdown-mode livid-mode skewer-mode simple-httpd live-py-mode link-hint json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode hydra parent-mode hide-comnt haml-mode gitignore-mode git-link fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct pos-tip flycheck pkg-info epl flx filesets+ eyebrowse evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree highlight eshell-z request websocket dumb-jump diminish deft web-completion-data company-tern dash-functional tern company column-enforce-mode coffee-mode bind-map bind-key packed anaconda-mode pythonic helm avy helm-core async yasnippet ac-php-core f xcscope php-mode dash s auto-complete popup package-build web-mode ledger-mode projectile yaml-mode xterm-color ws-butler window-numbering which-key w3m volatile-highlights vi-tilde-fringe use-package twig-mode toc-org tagedit sx sql-indent spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters quickrun quelpa pyvenv pytest pyenv-mode py-yapf psvn popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file ob-php neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode jenkins jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-filesets helm-descbinds helm-css-scss helm-company helm-cmd-t helm-c-yasnippet helm-ag hc-zenburn-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md geben flycheck-pos-tip flycheck-ledger flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein dsvn drupal-mode diff-hl define-word cython-mode cygwin-mount csharp-mode crontab-mode company-web company-statistics company-quickhelp company-anaconda clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile ansible-doc ansible aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-php ac-ispell))))

