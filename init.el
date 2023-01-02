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

;;Zenburn Theme
(use-package zenburn-theme
  :straight t
  :config (load-theme 'zenburn t))

(use-package helm
  :straight t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files))

(use-package magit
  :straight t
  :config
  )

(setq backup-directory-alist '(("." . "~/.emacs.d/MyEmacsBackups")))
