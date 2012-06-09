;; Added for setting up loactions for tmp files
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Added for hooking linum-mode to all major modes
(global-linum-mode)

;; Added to introduce space after line number in linum-mode
(setq linum-format "%d ")

;; Turn on parenthesis matching
(show-paren-mode 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Verdana")))))

;;support for line movement
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines 1))
    (next-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines -1))
    (move-to-column col)))

(global-set-key [\M-down] 'move-line-down)
(global-set-key [\M-up] 'move-line-up)
(put 'downcase-region 'disabled nil)

;;set key for revert-buffer
(global-set-key (kbd "M-r") 'revert-buffer)

;;enable ido-mode everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Set text-mode as the default mode
(setq-default major-mode 'text-mode)

;; Enable flyspell while in text-mode
(add-hook 'text-mode-hook 'flyspell-mode)

;; Disable the annoying "follow symbolic link" for vc-git
(setq vc-follow-symlinks t)

;; Open Rakefile in ruby-mode
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))

;; Open Capfile in ruby-mode
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))

;; Open .rake tasks in ruby-mode
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))

;; Open .rhtml tasks in ruby-mode
(setq auto-mode-alist (cons '("\\.rhtml$" . ruby-mode) auto-mode-alist))

;; Open .erb tasks in ruby-mode
(setq auto-mode-alist (cons '("\\.erb$" . ruby-mode) auto-mode-alist))

(setq rinari-tags-file-name "TAGS")

;; Open .js in js2-mode
(autoload 'js2-mode' "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Set a proper tab width for js2-mode
(setq js-indent-level 2)

;; Add ELPA as a source
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade", "http://marmalade-repo.org/packages/")))

(setq frame-title-format
  '("emacs%@" (:eval default-directory)))

(add-to-list 'load-path "~/.emacs.d/")
'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 136 :width normal :foundry "unknown" :family "Monaco"))))
(require 'clojure-mode)

