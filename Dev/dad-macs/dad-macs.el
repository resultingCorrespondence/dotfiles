;;; dad-macs.el --- Dad-macs configuration           -*- lexical-binding: t; -*-

;; Copyright (C) 2018  resultingCorrespondence

;; Author: resultingCorrespondence
;; Keywords: extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A general semi-starter kit

;;; Code:

(use-package which-key
    :ensure t
    :config
    (which-key-mode)
    (which-key-declare-prefixes-for-mode 'org-mode
      "SPC c" "clock"
      "C-SPC i" "ivy")
    (global-set-key (kbd "C-?") 'which-key-show-major-mode))

(provide 'dad-macs)
;;; dad-macs.el ends here
