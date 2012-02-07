; How to use:
;  Run "ln -s .emacs ~/.emacs" under the location of this file

(setq DB "~/workspace")

(add-to-list 'load-path "~/workspace/config/emacs")
(add-to-list 'load-path "~/workspace/config/lisps")

(mapc 'load (directory-files "~/workspace/config/emacs" t "^[a-zA-Z0-9].*.el$"))

(add-to-list 'load-path "~/workspace/config/lisps/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(require 'sams-lib)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(menu-bar-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )