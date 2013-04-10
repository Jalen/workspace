

(global-set-key (kbd "C-x C-b") 'ibuffer) 	;http://blog.sina.com.cn/s/blog_4844b973010007dh.html

(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)

;; Frame Management
(global-set-key [\M-f4] 'my-delete-frame)
(global-set-key "\M-n" 'my-make-frame)
;;End

(global-set-key (kbd "<f3>") 'my-swith-to-scratch)
(global-set-key [f5] 'query-replace)
;;(global-set-key [f7] 'ispell)

(global-set-key [f10] 'shell) ;shell
(global-set-key (kbd "<f11>") 'list-bookmarks)
(global-set-key [(control f12)] 'speedbar-get-focus)
(global-set-key [(control shift f12)] 'speedbar-frame-mode)

;(global-set-key [(tab)] 'my-indent-or-complete)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)

(global-set-key [(control z)]       'undo)


(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

(global-set-key (kbd "M-/") 'hippie-expand)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-swith-to-scratch()
  "Deletes the current frame. If this is the last frame, quit Emacs."
  (interactive)
  (switch-to-buffer "scratch"))


