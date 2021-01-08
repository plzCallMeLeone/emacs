(setq straight-use-package-by-default t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; straight.el init

(straight-use-package 'use-package)

;; install use-package

(setq comp-deferred-compilation t)
(electric-pair-mode) 
(global-display-line-numbers-mode)

(add-to-list 'default-frame-alist
	     '(font . "Iosevka-12"))
(set-fontset-font t 'hangul (font-spec :name "D2Coding"))
(global-prettify-symbols-mode)

(prefer-coding-system 'utf-8)
(set-language-environment "Korean")

(scroll-bar-mode -1)
(tool-bar-mode   -1)


(use-package evil
  :config
  (evil-mode))
(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package nord-theme
  :config (load-theme 'nord t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package vterm
  :config (setq vterm-kill-buffer-on-exit t))

(use-package ivy
  :config
  (setq ivy-wrap t
	ivy-use-selectable-prompt t)
  (ivy-mode))

(use-package swiper
  :bind (:map evil-normal-state-map
	      ("C-s" . swiper)))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-backends
	'((company-keywords company-capf)
	  (company-abbrev company-dabbrev)))
  (setq company-idle-delay 0) ;; set company delay 0

  :bind
  (:map company-active-map
	("<tab>" . company-complete-common-or-cycle)))

(use-package pdf-tools
  :config (pdf-loader-install))

(use-package server
  :config (server-start)) ;; start emacs server at startup
