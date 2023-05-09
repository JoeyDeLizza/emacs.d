;; Install straight.el
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

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Install use-package
(straight-use-package 'use-package)

;;;;;;; Installed Packages ;;;;;;;;;;;;;;

;;Zenburn Theme
(use-package zenburn-theme
  :straight t
  :config (load-theme 'zenburn t))

;; Helm Package
(use-package helm
  :straight t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files))

;; magit package
(use-package magit
  :straight t
  :config
  )

;; evil package
(use-package evil
  :straight t
  :config
  (evil-mode 1)
  )

;; plantuml package
(use-package plantuml-mode
  :straight t
  :config
  )

;; avy package
(use-package avy
  :straight t
  :config
  )

;; evil key bindings
(evil-define-key 'normal 'global ";" 'avy-goto-char)

;; Set directory of backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/MyEmacsBackups")))

;; Set Evil-normal-mode binding
(global-set-key (kbd "C-<tab>") 'evil-normal-state)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))
