;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mathew Fournier"
      user-mail-address "mathew.fournier@hootsuite.com")

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
(setq doom-font (font-spec :family "Hasklig" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(after! org
  (setq org-cycle-include-plain-lists 'integrate)

  ;; todo keywords
  (setq org-todo-keywords
      (quote ((sequence "INFO(i)" "TODO(t)" "REVIEW(r)" "PUSH/DEPLOY(p)" "|" "DONE(d@)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

  (setq org-src-fontify-natively t)
)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(after! lsp-mode
  (setq lsp-enable-folding t
        lsp-enable-file-watchers t
        lsp-enable-text-document-color t
        lsp-enable-semantic-highlighting t
        lsp-enable-indentation t
        lsp-enable-on-type-formatting t))

(setq-hook! 'scala-mode-hook +lsp-company-backend 'company-capf)

(map! :map scala-mode-map
  :localleader
  :desc "Compile" :n "c" (λ! (sbt-command "compile"))
  :desc "Reload" :n "d" (λ! (sbt-command "reload"))
  :desc "Hydra" :n "h" (λ! (sbt-hydra))
  :desc "Console" :n "o" #'run-scala
  :desc ":paste region" :n "p" #'sbt-paste-region
  :desc "Run" :n "r" (λ! (sbt-command "run"))
  :desc "sbt command" :n "s" #'sbt-command
  :desc "Clear" :n "x" #'sbt-clear
  (:prefix ("m". "metals")
    :desc "List errors" :n "e" #'lsp-ui-flycheck-list
    :desc "Fix missing import" :n "i" #'lsp-execute-code-action
    :desc "Describe thing at point" :n "t" #'lsp-describe-thing-at-point
    :desc "Toggle type hints" :n "H" #'lsp-ui-doc-mode
    :desc "Format buffer" :n "F" #'lsp-format-buffer
    :desc "Format region" :n "f" #'lsp-format-region
    :desc "Find references" :n "C-f" #'lsp-find-references
    :desc "Rename" :n "r" #'lsp-rename
    :desc "Goto implementation" :n "g" #'lsp-goto-implementation)
)

(add-hook 'scala-mode-hook #'rainbow-delimiters-mode t)


;;;
(use-package! sqlup-mode
  :commands (sqlup-mode)
  :hook ((sql-mode . sqlup-mode)
         (sql-interactive-mode . sqlup-mode)))

