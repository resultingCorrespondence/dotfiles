;;; evil-collection-eww.el --- Evil bindings for EWW -*- lexical-binding: t -*-

;; Copyright (C) 2017 Pierre Neidhardt

;; Author: Pierre Neidhardt <ambrevar@gmail.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <ambrevar@gmail.com>
;; URL: https://github.com/jojojames/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: evil, eww, tools

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your
;; option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Evil bindings for EWW.

;;; Code:
(require 'eww)
(require 'evil)

(defun evil-collection-eww-setup ()
  "Set up `evil' bindings for `eww'."
  (evil-set-initial-state 'eww-mode 'motion)
  (evil-define-key 'motion eww-mode-map
    "^" 'eww-up-url
    "u" 'eww-up-url
    "U" 'eww-top-url
    (kbd "<backspace>") 'eww-back-url
    "H" 'eww-back-url
    "L" 'eww-forward-url

    "gf" 'eww-view-source ; Like qutebrowser.

    "yu" 'eww-copy-page-url

    "&" 'eww-browse-with-external-browser
    "C" 'url-cookie-list
    "D" 'eww-toggle-paragraph-direction
    "X" 'eww-set-character-encoding
    "x" 'eww-toggle-fonts
    "d" 'eww-download
    "b" 'eww-add-bookmark

    "]" 'eww-next-url
    "[" 'eww-previous-url
    "gj" 'eww-next-url
    "gk" 'eww-previous-url

    ;; open
    (kbd "S-<return>") 'eww
    "go" 'eww

    (kbd "SPC") 'scroll-up-command
    (kbd "S-SPC") 'scroll-down-command
    (kbd "<tab>") 'shr-next-link
    (kbd "<backtab>") 'shr-previous-link

    ;; bookmarks
    "gb" 'eww-list-bookmarks

    "gh" 'eww-list-histories
    "gt" 'eww-list-buffers ; Like dwb, qutebrowser.


    ;; refresh
    "gr" 'eww-reload

    ;; quit
    "q" 'quit-window
    "ZQ" 'quit-window
    "ZZ" 'quit-window)

  (evil-set-initial-state 'eww-history-mode 'motion)
  (evil-define-key 'motion eww-history-mode-map
    (kbd "<return>") 'eww-history-browse
    ;; refresh
    "gr" 'revert-buffer
    ;; quit
    "q" 'quit-window
    "ZQ" 'quit-window
    "ZZ" 'quit-window)

  (evil-set-initial-state 'eww-buffers-mode 'motion)
  (evil-define-key 'motion eww-buffers-mode-map
    "D" 'eww-buffer-kill
    (kbd "<return>") 'eww-buffer-select
    "]" 'eww-buffer-show-next
    "[" 'eww-buffer-show-previous
    "gj" 'eww-buffer-show-next
    "gk" 'eww-buffer-show-previous
    ;; refresh
    "gr" 'revert-buffer
    ;; quit
    "q" 'quit-window
    "ZQ" 'quit-window
    "ZZ" 'quit-window)

  (evil-set-initial-state 'eww-bookmark-mode 'motion)
  (evil-define-key 'motion eww-bookmark-mode-map
    "D" 'eww-bookmark-kill
    (kbd "<return>") 'eww-bookmark-browse
    "yu" 'eww-bookmark-yank
    ;; refresh
    "gr" 'revert-buffer
    ;; quit
    "q" 'quit-window
    "ZQ" 'quit-window
    "ZZ" 'quit-window))

(provide 'evil-collection-eww)
;;; evil-collection-eww.el ends here
