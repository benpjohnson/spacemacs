;;; packages.el --- php layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ben Johnson <bjohnson@dev-212.dev.thinkfinanceuk.net>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `php-packages'.  Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `php/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `php/pre-init-PACKAGE' and/or
;;   `php/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defvar myphp-packages
  '(
    php-mode
    php-boris
    phpunit
    company-php
    ac-php-core
    ac-php
    ))

(add-hook 'php-mode-hook 'my-php-mode-stuff)

(defun my-php-mode-stuff ()
  (local-set-key (kbd "<f1>") 'my-php-function-lookup)
  (local-set-key (kbd "C-<f1>") 'my-php-symbol-lookup))


(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))


(defun my-php-function-lookup ()
  (interactive)
  (let* ((function (symbol-name (or (symbol-at-point)
                                    (error "No function at point."))))
         (buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
    (with-current-buffer buf
      (goto-char (point-min))
        (let (desc)
          (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
            (setq desc
              (replace-regexp-in-string
                " +" " "
                (replace-regexp-in-string
                  "\n" ""
                  (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))

            (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
              (setq desc
                    (concat desc "\n\n"
                            (replace-regexp-in-string
                             " +" " "
                             (replace-regexp-in-string
                              "\n" ""
                              (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

          (if desc
              (message desc)
            (message "Could not extract function info. Press C-F1 to go the description."))))
    (kill-buffer buf)))

(defun myphp/post-init-php-mode()
  (add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
  (setq php-insert-doc-varname-on-var nil)
  (auto-complete-mode t)
  (setq ac-sources  '(ac-source-php ) )
  (yas-global-mode 1)
  ;; (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
  ;; (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
)

(defun myphp/init-ac-php-core()
)

(defun init-php-boris()
  (use-package php-boris)
)
(defun myphp/init-phpunit()
  (use-package phpunit)
)
(defun myphp/init-ac-php()
  (use-package ac-php-core)
  (use-package ac-php)
  (auto-complete-mode t)
  (setq ac-sources  '(ac-source-php ) )
  (yas-global-mode 1)
  (use-package php-mode)
  ;;(define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
  ;;(define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
)
