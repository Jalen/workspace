(defun require-extensions (action lst)
  ""
  (mapcar (lambda(ext) "" (funcall action ext)) lst))

(require-extensions 'require
 (list 
  'tabbar
  'ibuffer
  'smart-tab
  ;; 'graphviz-dot-mode
  ;; 'switch-window
  ;; 'thing-edit
  ;; 'second-sel
  ;; 'browse-kill-ring+
  ;; 'bbdb
  ;; 'gnuplot
  ;; 'muse-mode
  ;; 'ibuffer
  ;; 'w3m-load
  ;; 'rect-mark
  ;; 'ido
  ;; 'multi-term
  ;; 'lusty-explorer
  ;; 'oddmuse
  ;; 'emaci
  ;; 'move-text
  ;; 'uniquify
  ;; 'hide-region
))

(tabbar-mode)

(global-smart-tab-mode 1)
		  
(load "desktop")
(desktop-save-mode 1)


; Add htmlize
(require 'htmlize)

;(require 'graphviz-dot-mode)
;; (load-file "P:/Software/Emacs/site-lisp/graphviz-dot-mode.elc")

;; (add-to-list 'load-path "P:/Software/Emacs/site-lisp/git-emacs")
;; (require 'git-emacs)

;;http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode t)

(autoload 'dos-mode "dos" "Edit Dos scripts." t)
(add-to-list 'auto-mode-alist '("\\.bat$" . dos-mode))


;;run this command 
;; emacs --batch --eval '(byte-compile-file "js2-20080616a.el")'
;;to byte-compile
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; -----------------------------------------------------------------------------
;; Git support 
;; -----------------------------------------------------------------------------
; http://parijatmishra.wordpress.com/2008/09/06/up-and-running-with-emacs-and-git/
(load "/usr/share/doc/git-core/contrib/emacs/git.el")
(load "/usr/share/doc/git-core/contrib/emacs/git-blame.el")
(add-to-list 'vc-handled-backends 'GIT)