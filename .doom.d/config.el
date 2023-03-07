;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tobias Mock"
      user-mail-address "mail@tmock.de")

(setq all-the-icons-scale-factor 1.0)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "ibm plex mono" :size 16))
(setq doom-font (font-spec :family "iosevka pro" :size 16))

(setq modus-themes-syntax '(yellow-comments))
;; (setq stimmung-themes-light-highlight-color-foreground "#4c5361")
;; (setq stimmung-themes-light-highlight-color "#dde4f2")

(setq doom-theme 'modus-operandi)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-*") 'ctrlf-forward-symbol-at-point)

(View-exit-and-edit)
(global-set-key (kbd "M-p") 'View-scroll-half-page-backward)
(global-set-key (kbd "M-n") 'View-scroll-half-page-forward)

(global-set-key (kbd "M-o") 'ace-window)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

(load-file ".doom.d/mail.el")

(setq confirm-kill-emacs nil)
(setq company-idle-delay nil)
(global-set-key (kbd "C-c C-SPC") 'company-complete)
(global-set-key (kbd "C-c d") 'company-show-doc-buffer)

(after! format-all (advice-add 'format-all-buffer :around #'envrc-propagate-environment))

(add-load-path! "~/.doom.d")
(require 'schmu-mode)

(add-hook 'schmu-mode-hook #'enable-paredit-mode)

(defun schmu-at-expression-paredit-space-for-delimiter-predicate (endp delimiter)
  "`paredit-mode' shouldn't insert space after certain constructs

For example:

  &()
see https://github.com/greghendershott/racket-mode/issues/179
This function is a suitable element for the list variable
`paredit-space-for-delimiter-predicates'. For example:

(use-package paredit
  :ensure t
  :config
  (progn
    ;; ... other config you may have ...
    (add-hook 'paredit-space-for-delimiter-predicates
              #'schmu-at-expression-paredit-space-for-delimiter-predicate)))
"
  (if (and (eq major-mode 'schmu-mode)
           (not endp))
      (not ;; &(
       (or (and (memq delimiter '(?\())
             ;; (looking-back (rx ?@ (* (or (syntax word) (syntax symbol)))))
             (looking-back (rx ?&)))
           (and (memq delimiter '(?\[))
             (looking-back (rx ?.)))))
    t))

(add-hook 'paredit-space-for-delimiter-predicates
          #'schmu-at-expression-paredit-space-for-delimiter-predicate)

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(ctrlf-mode +1)

(when (modulep! :checkers syntax)
  (flycheck-define-checker schmu
    "A schmu syntax checker"
    :command ("/home/tobi/projects/schmulang/_build/install/default/bin/schmu" "--check" (eval (buffer-file-name)))
    :error-patterns
    ((error line-start (file-name) ":" line ":" column ": error: " (message) line-end)
     (warning line-start (file-name) ":" line ":" column ": warning: " (message) line-end))
    :modes schmu-mode)
  (add-to-list 'flycheck-checkers 'schmu))

(setq scroll-margin 4)
(setq scroll-conservatively 0)

(size-indication-mode -1)

(after! doom-modeline
  (setq column-number-mode               t)
  (setq doom-modeline-buffer-encoding    nil)
  (setq doom-modeline-modal-icon         nil)
  (setq doom-modeline-buffer-state-icon  nil)
  (setq doom-modeline-icon               nil)
  (setq doom-modeline-enable-word-count  nil)
  (setq doom-modeline-github             nil)
  ;; (doom-modeline-mu4e               nil)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-persp-name         nil)
  (setq doom-modeline-minor-modes        nil)
  (setq doom-modeline-major-mode-icon    nil)
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)
  (setq doom-modeline-height 0))
