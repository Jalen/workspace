;-*- coding: utf-8 -*-
;; ergonomic_keybinding_qwerty.el -- A ergonomic keybinding for qwerty keyboard.

;; Copyright © 2007 Xah Lee

;; Author: Xah Lee (http://xahlee.org/)
;; Keywords: qwerty, dvorak, keybinding, ergonomic

;; You can redistribute this program and/or modify it under the terms
;; of the GNU General Public License as published by the Free Software
;; Foundation; either version 2, or (at your option) any later
;; version.

;;; Commentary:

;; This keybinding puts the most frequently used emacs shortcuts into
;; the most easier to type spots, and, using the Meta-«key» space only.

;; For detail on the design of this keybinding and a visual layout,
;; and versions for Dvorak or Qwerty keyboards, see:
;; http://xahlee.org/emacs/ergonomic_emacs_keybinding.html

;;; History:
;; version 1.1, 2007-12-18. changed keycode to consistantly use kbd syntax. Fixed a scroll-up and scroll-down mixup.
;; version 1.0, 2007-08-01. first version.

;;; Install:

;; Place this file in your favoritate directory, such as
;; ~/emacs/ergonomic_keybinding_qwerty.el
;; Then, place the following code in your emacs init file (~/.emacs):
;; (load-file "~/emacs/ergonomic_keybinding_qwerty.el")

;;; Code:

;;; CURSOR MOVEMENTS

;; Single char cursor movement
(global-set-key (kbd "M-j") 'backward-char) ; was indent-new-comment-line
(global-set-key (kbd "M-l") 'forward-char)  ; was downcase-word
(global-set-key (kbd "M-i") 'previous-line) ; was tab-to-tab-stop
(global-set-key (kbd "M-k") 'next-line) ; was kill-sentence

;; Move by word
(global-set-key (kbd "M-u") 'backward-word) ; was upcase-word
(global-set-key (kbd "M-o") 'forward-word) ; was (prefix)

;; Move by paragraph
(global-set-key (kbd "M-U") 'backward-paragraph) ; was none
(global-set-key (kbd "M-O") 'forward-paragraph) ; was none

;; Move to beginning/ending of line
(global-set-key (kbd "M-h") 'move-beginning-of-line) ; was mark-paragraph
(global-set-key (kbd "M-H") 'move-end-of-line) ; was none

;; Move by screen (page up/down)
(global-set-key (kbd "M-I") 'scroll-down)  ; was none
(global-set-key (kbd "M-K") 'scroll-up)  ; was none

;; Move to beginning/ending of file
(global-set-key (kbd "M-J") 'beginning-of-buffer)  ; was none
(global-set-key (kbd "M-L") 'end-of-buffer)  ; was none

;; Switch window (emacs's “frame”)
(global-set-key (kbd "M-`") 'other-frame) ; was tmm-menubar. (OS X convention)

(global-set-key (kbd "M-p") 'recenter) ; was none


;;; MAJOR EDITING COMMANDS

;; Delete previous/next char. (with Backspace, or shift Backspace)
(global-set-key (kbd "<S-backspace>") 'delete-char) ; was none

; Delete previous/next word. (meta Backspace and meta shift Backspace)
(global-set-key (kbd "<M-S-backspace>") 'kill-word)  ; was none

; Copy Cut Paste, Paste previous
(global-set-key (kbd "M-w") 'kill-region)     ; was kill-ring-save
(global-set-key (kbd "M-e") 'kill-ring-save)  ; was forward-sentence
(global-set-key (kbd "M-r") 'yank)            ; was move-to-window-line
(global-set-key (kbd "M-R") 'yank-pop)  ; was none

; Undo
(global-set-key (kbd "M-d") 'undo) ; was kill-word

; Kill line
(global-set-key (kbd "M-f") 'kill-line) ; was forward-word


;;; Textual Transformation

(global-set-key (kbd "M-S-SPC") 'mark-paragraph) ; was none


;;; EMACS'S SPECIAL COMMANDS

; Mark point. 32 is the ascii code for space
(global-set-key (kbd "M-SPC") 'set-mark-command) ; was just-one-space

;;; WINDOW SPLITING
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-s") 'other-window) ; was center-line

