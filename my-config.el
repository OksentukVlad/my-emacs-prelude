(set-language-environment 'UTF-8)

;; disable backup
(setq backup-inhibited t)
(setq auto-save-default nil)

;; tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

;; tabs settings for web mode
(defun my-web-mode-hook ()
  "Hooks for web mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; tabs settings for json mode
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;; tabs settings for js mode
(setq js2-basic-offset 2)
(setq-default js2-basic-offset 2)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; jsx
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;; Flycheck
;; disable jshint
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; for better jsx syntax-highlighting in web-mode
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;; Org-mode agenda
(setq org-agenda-files (quote ("~/Dropbox/org")))

;; OSX key mapping
(setq mac-command-modifier 'super)

(load-file "~/.emacs.d/core/sgml-mode-patch.el")
(require 'sgml-mode)

(provide 'my-config)
;;; my-config.el ends here
