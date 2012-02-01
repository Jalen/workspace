

(global-set-key (kbd "C-x C-b") 'ibuffer) 	;http://blog.sina.com.cn/s/blog_4844b973010007dh.html


(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control meta l)] 'speedbar-get-focus)

;; Frame Management
(global-set-key [\M-f4] 'my-delete-frame)
(global-set-key "\M-n" 'my-make-frame)
;;End

(global-set-key [f3] 'eshell) ;shell
(global-set-key [f5] 'query-replace)
(global-set-key [f7] 'ispell)

(global-set-key (kbd "<f11>") 'calendar)
(global-set-key (kbd "<f12>") 'list-bookmarks)

;;(global-set-key [(tab)] 'my-indent-or-complete)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)

(global-set-key [(control z)]       'undo)


(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

(global-set-key (kbd "M-/") 'hippie-expand)

(defun my-swith-to-scratch()
  "Deletes the current frame. If this is the last frame, quit Emacs."
  (interactive)
  (switch-to-buffer "scratch"))

(global-set-key (kbd "<f2>") 'my-swith-to-scratch)
