; How to use:
;  Run "ln -s .emacs ~/.emacs" under the location of this file


(add-to-list 'load-path "~/MyWorkspace/config/emacs")
(add-to-list 'load-path "~/MyWorkspace/config/lisps")

(mapc 'load (directory-files "~/MyWorkspace/config/emacs" t "^[a-zA-Z0-9].*.el$"))
