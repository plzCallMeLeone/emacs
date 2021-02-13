;; <straight install>
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

;; </straight install>

(straight-use-package 'leaf)
(straight-use-package 'leaf-keywords)
(leaf leaf-keywords
  :config
  (leaf-keywords-init))

(leaf cus-start
  :doc "define customization properties of builtins"
  :custom ((menu-bar-mode . nil)
	   (tool-bar-mode . nil)
	   (scroll-bar-mode . nil)
	   (electric-pair-mode . 1)
	   (prefer-codig-system . 'utf-8)
	   (global-display-line-numbers-mode . 1))

  :setq ((gc-cons-threshold       . 100000000)
	 (read-process-output-max . 1048576))
  :config
  (set-frame-font "Sarasa Fixed SC-13" nil t)
  (set-language-environment "Korean"))

(leaf evil
  :straight t
  :custom
  ;; use emacs's default redo system(only for emacs 28 and over)
  (evil-undo-system . 'undo-redo) 

  :init
  (leaf evil-leader
    :straight t
    :config
    (evil-leader/set-key
      "s" 'eshell
      "b" 'switch-to-buffer
      "d" 'ranger)
    (global-evil-leader-mode)
    :custom
    (evil-leader/leader . "<SPC>"))

  (leaf evil-commentary
    :straight t
    :hook
    (prog-mode-hook . evil-commentary-mode))

  :config
  (evil-mode 1)
  :bind
  (:evil-motion-state-map
   ("j" . "gj")
   ("k" . "gk")))

(leaf ivy
  :straight t
  :init
  (leaf counsel :straight t)
  (leaf swiper :straight t)
  (leaf smex :straight t)
  :config
  (ivy-mode 1)
  (smex-initialize)
  :setq
  ((ivy-wrap . t)
   (ivy-use-selectable-prompt . t))
  :bind
  ((:ivy-switch-buffer-map
    ("C-j" . ivy-next-line)
    ("C-k" . ivy-previous-line))
   (:ivy-minibuffer-map
    ("C-j" . ivy-next-line)
    ("C-k" . ivy-previous-line))
   (:evil-normal-state-map
    ("C-s" . swiper))
   ("M-x" . counsel-M-x)))

(leaf rainbow-delimiters
  :straight t
  :hook
  (prog-mode-hook . rainbow-delimiters-mode))

(leaf base16-theme
  :straight t
  :config
  (load-theme 'base16-embers t))

(leaf ranger
  :straight t
  :config
  (ranger-override-dired-mode t)
  :setq
  ((ranger-max-preview-size . 10)
  (ranger-dont-show-binary . t)
  (ranger-max-preview-size . 10)))
