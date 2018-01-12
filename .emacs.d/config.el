(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package evil
  :ensure t
  :config
  (setq evil-normal-state-tag "NORMAL")
  (setq evil-insert-state-tag "INSERT")
  (setq evil-visual-state-tag "VISUAL")
  (evil-mode 1)
  (use-package evil-easymotion
    :ensure t
    :config
    (evilem-default-keybindings ",")))
(use-package linum-relative
  :ensure t
  :config
  (linum-relative-mode)
  )



(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-declare-prefixes-for-mode 'org-mode
    "SPC c" "clock"
    "C-SPC i" "ivy")
  (global-set-key (kbd "C-?") 'which-key-show-major-mode)
  )  

(use-package general :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(setq org-src-fontify-natively t)


(setq org-latex-compiler "xelatex")
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(setq org-export-backends '(ascii html latex odt))

;;download themes
(use-package color-theme-solarized
  :ensure t
  :defer t)
(use-package zenburn-theme
  :ensure t
  :defer t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :defer t)
(use-package moe-theme
  :ensure t
  :defer t)
(use-package gruvbox-theme
  :ensure t
  :defer t)
(use-package ample-theme
  :ensure t
  :defer t)
(use-package afternoon-theme
  :ensure t
  :defer t)
(use-package clues-theme
  :ensure t
  :defer t)
(use-package bubbleberry-theme
  :ensure t
  :defer t)
(use-package badger-theme
  :ensure t
  :defer t)
(use-package atom-one-dark-theme
  :ensure t
  :defer t)
(use-package tao-theme
  :ensure t
  :defer t)
(use-package solarized-theme
  :ensure t
  :defer t)

 ;;color theme choice
(load-theme 'sanityinc-tomorrow-eighties t)
(setq solarized-use-variable-pitch nil)

(use-package counsel
  :ensure t
  :config
  (use-package flx
    :ensure t)
  (ivy-mode 1)
  (setq ivy-height 20)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (use-package lispyville
    :ensure t
    :config
    (add-hook 'lispy-mode-hook #'lispyville-mode)))

(use-package flycheck :ensure t
  :config
  (global-flycheck-mode)
  )

(use-package org
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
                             (org-bullets-mode 1)
                             (flyspell-mode))))

(add-to-list 'ispell-skip-region-alist '("^#+BEGIN_SRC" . "^#+END_SRC"))

(setq org-publish-project-alist
      '("all" :publishing-directory "~/Dropbox/org/Export")
      )

(setq org-M-RET-may-split-line 'nil)
(setq org-agenda-timegrid-use-ampm t)

;;(setq org-agenda-prefix-format "%c: %b")
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done  t)

(setq org-agenda-files '("~/Dropbox/org" "~/Dropbox/org/Calendars"))

(require 'cl)
(require 'org-drill)
(use-package org-drill-table :ensure t)

(setq org-agenda-custom-commands
      '(("d" "Days Agenda View"
	 ((tags "Big_Date+TIMESTAMP<=\"<+2w>\""
		((org-agenda-overriding-header "Upcoming Big Dates:")
		 (org-agenda-prefix-format "% s")
		 (org-agenda-remove-tags "Big_Date")
		 ))
	  (agenda "" ((org-agenda-span 'day)t))))))

(setq org-archive-location "~/Dropbox/org/Archive/%s_archive::")

(use-package org-pdfview
  :ensure t
  :config
  (eval-after-load 'org '(require 'org-pdfview)))

(use-package flyspell-correct-ivy
  :ensure t)

(use-package evil-collection
  :ensure t
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

(use-package calfw
  :ensure t
  :config
  (use-package org-gcal
    :ensure t
    :config
    (setq org-gcal-client-id "960315237881-r8j4ldivpl98il5ifoupdaskj51j65ib.apps.googleusercontent.com"
      org-gcal-client-secret "Rb1t5gqNLOjyPQ2l9fy5i7LZ"
      org-gcal-file-alist '(("hgaines95@gmail.com" .  "~/Dropbox/org/Calendars/(c)personal.org")
			    ("vvflqc81oth9ul9m9tl43k77ks@group.calendar.google.com" . "~/Dropbox/org/Calendars/(c)school.org")
			    ("9ekj1un8b2hbna9ej2j9uti3t0@group.calendar.google.com" . "~/Dropbox/org/Calendars/(c)work.org")
			    ("pa2l114catrgjslafjd4re6v7k@group.calendar.google.com" . "~/Dropbox/org/Calendars/(c)YoungLife.org")))))
(org-gcal-refresh-token)
(org-gcal-sync)

(add-to-list 'load-path "/usr/local/Cellar/mu/0.9.18_1/share/emacs/site-lisp/mu/mu4e")
(use-package mu4e
  :config
  (setq mu4e-contexts
	`( ,(make-mu4e-context
	     :name "Personal"
	     :match-func (lambda (msg) (when msg
					 (string-prefix-p "/Personal" (mu4e-message-field msg :maildir))))
	     :vars '(
		     (mu4e-sent-folder . "/Personal/[Gmail].Sent")
		     (mu4e-trash-folder . "/Personal/[Gmail].Trash")
		     (mu4e-drafts-folder . "/Personal/[Gmail].Drafts")
		     (mu4e-reply-to-address . "hgaines95@gmail.com")
		     (user-mail-address . "hgaines95@gmail.com")
		     (user-full-name . "Hadley Gaines")

		     ))
	   ,(make-mu4e-context
	     :name "School"
	     :match-func (lambda (msg) (when msg
					 (string-prefix-p "/School" (mu4e-message-field msg :maildir))))
	     :vars '(
		     (mu4e-sent-folder . "/School/[Gmail].Sent")
		     (mu4e-trash-folder . "/School/[Gmail].Trash")
		     (mu4e-drafts-folder . "/School/[Gmail].Drafts")
		     (mu4e-reply-to-address . "hgaines@umich.edu")
		     (user-mail-address . "hgaines@umich.edu")
		     (user-full-name . "Hadley Gaines")
		     ))))
  (add-to-list 'mu4e-marks
	       '(done
		 :char       "d"
		 :prompt     "done"
		 :show-target (lambda (target) "Done")
		 :action      (lambda (docid msg target)
				(mu4e-action-retag-message msg "-\\Inbox"))))
  (mu4e~headers-defun-mark-for done)
  (mu4e~view-defun-mark-for done)
  ;;(setq mu4e-html2text-command "html2text -utf8 -nobs -width 72")
  (setq mu4e-html2text-command "w3m -T text/html")
  (setq mu4e-show-images nil)
  (setq mu4e-context-policy 'pick-first)
  (setq mu4e-headers-include-related nil)
  (setq mu4e-headers-results-limit 100)
  (setq mu4e-get-mail-command "offlineimap -o")
  :general
  (:keymaps 'mu4e-headers-mode-map
	    :states '(motion normal visual)
	    "d" 'mu4e-headers-mark-for-done)
  (:keymaps 'mu4e-view-mode-map
	    "d" 'mu4e-view-mark-for-done))
(use-package evil-mu4e
  :ensure t)

(defvar mu4e-action-tags-header "X-Keywords"
  "Header where tags are stored. Used by `mu4e-action-retag-message'.
   Make sure it is one of the headers mu recognizes for storing
   tags: X-Keywords, X-Label, Keywords. Also note that changing
   this setting on already tagged messages can lead to messages
   with multiple tags headers.")

(defvar mu4e-action-tags-completion-list '()
  "List of tags to show for autocompletion in
  `mu4e-action-retag-message'.")

(defun mu4e~contains-line-matching (regexp path)
  "Determine whether the file at path contains a line matching
   the given regexp."
  (with-temp-buffer
    (insert-file-contents path)
    (save-excursion
      (goto-char (point-min))
      (if (re-search-forward regexp nil t)
	t
	nil))))

(defun mu4e~replace-first-line-matching (regexp to-string path)
  "Replace the first line in the file at path that matches regexp
   with the string replace."
  (with-temp-file path
    (insert-file-contents path)
    (save-excursion
      (goto-char (point-min))
      (if (re-search-forward regexp nil t)
	(replace-match to-string nil nil)))))

(defun mu4e-action-retag-message (msg &optional retag-arg)
  "Change tags of a message. Accepts a comma-separated list of
   additions and removals.
   Example: +tag,+long tag,-oldtag
   would add 'tag' and 'long tag', and remove 'oldtag'."
  (let* (
	  (path (mu4e-message-field msg :path))
	  (maildir (mu4e-message-field msg :maildir))
	  (oldtags (mu4e-message-field msg :tags))
	  (tags-completion
	    (append
	      mu4e-action-tags-completion-list
	      (mapcar (lambda (tag) (format "+%s" tag))
		mu4e-action-tags-completion-list)
	      (mapcar (lambda (tag) (format "-%s" tag))
		oldtags)))
	  (retag (if retag-arg
		   (split-string retag-arg ",")
		   (completing-read-multiple "Tags: " tags-completion)))
	  (header  mu4e-action-tags-header)
	  (sep     (cond ((string= header "Keywords") ", ")
		     ((string= header "X-Label") " ")
		     ((string= header "X-Keywords") ", ")
		     (t ", ")))
	  (taglist (if oldtags (copy-sequence oldtags) '()))
	  tagstr)
    (dolist (tag retag taglist)
      (cond
	((string-match "^\\+\\(.+\\)" tag)
	  (setq taglist (push (match-string 1 tag) taglist)))
	((string-match "^\\-\\(.+\\)" tag)
	  (setq taglist (delete (match-string 1 tag) taglist)))
	(t
	  (setq taglist (push tag taglist)))))

    (setq taglist (sort (delete-dups taglist) 'string<))
    (setq tagstr (mapconcat 'identity taglist sep))

    (setq tagstr (replace-regexp-in-string "[\\&]" "\\\\\\&" tagstr))
    (setq tagstr (replace-regexp-in-string "[/]"   "\\&" tagstr))

    (if (not (mu4e~contains-line-matching (concat header ":.*") path))
      ;; Add tags header just before the content
      (mu4e~replace-first-line-matching
	"^$" (concat header ": " tagstr "\n") path)

      ;; replaces keywords, restricted to the header
      (mu4e~replace-first-line-matching
	(concat header ":.*")
	(concat header ": " tagstr)
	path))

    (mu4e-message (concat "tagging: " (mapconcat 'identity taglist ", ")))
    (mu4e-refresh-message path maildir)))

(add-to-list 'mu4e-headers-actions '("retag message" . mu4e-action-retag-message) t)
(add-to-list 'mu4e-view-actions '("retag message" . mu4e-action-retag-message) t)

(setq mu4e-bookmarks '())
(add-to-list 'mu4e-bookmarks
	     (make-mu4e-bookmark
	      :name  "Commercial"
	      :query "tag:\\\\Inbox AND tag:Promotions"
	      :key ?c))
(add-to-list 'mu4e-bookmarks
	     (make-mu4e-bookmark
	      :name  "Primary"
	      :query "tag:\\\\Inbox AND tag:Primary"
	      :key ?p))
(add-to-list 'mu4e-bookmarks
	     (make-mu4e-bookmark
	      :name  "Inbox"
	      :query "tag:\\\\Inbox"
	      :key ?i))

(use-package mu4e-alert
  :ensure t
  :config
  (setq mu4e-alert-interesting-mail-query
      (concat
       "tag:\\\\Inbox"
       " AND tag:Primary"))
  (mu4e-alert-set-default-style 'notifier)
  (mu4e-alert-enable-notifications)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display)
    )
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
  )

(use-package smtpmail
  :ensure t
  :config
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-starttls-credentials
	'(("smtp.gmail.com" 587 nil nil))
	smtpmail-default-smtp-server "smtp.gmail.com"
	smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 587
	smtpmail-debug-info t))

(custom-set-variables '(message-kill-buffer-on-exit t))
(setq message-citation-line-function 'message-insert-formatted-citation-line
      message-cite-reply-position 'above
      message-yank-prefix "    "
      message-yank-cited-prefix "    "
      message-yank-empty-prefix "    "
      message-citation-line-format "On %e %B %Y %R, %f wrote:\n")

(require 'org-mu4e)

(use-package spaceline
 :ensure t
 :config

 (use-package spaceline-config
   :ensure spaceline
   :config
   (spaceline-spacemacs-theme)
   (spaceline-helm-mode)
   (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
   (setq powerline-default-separator 'arrow)
   (setq powerline-image-apple-rgb t)
   (setq powerline-height 20)
   (spaceline-toggle-buffer-size-off)
   (mu4e-alert-enable-mode-line-display)
   (spaceline-toggle-mu4e-alert-segment-on)
   (spaceline-compile)
   )
 (use-package diminish :ensure t
   :config
   (diminish 'undo-tree-mode)
   (diminish 'which-key-mode)
   (diminish 'flyspell-mode)
   (diminish 'ivy-mode)
   (diminish 'flycheck-mode)
   (diminish 'overwrite-mode)
))

(setq major-mode-leader "SPC")
(setq general-leader "SPC SPC")

(general-define-key :states '(normal visual)
                    :keymaps 'org-mode-map
                    "{" 'outline-previous-visible-heading
                    "}" 'outline-next-visible-heading
                    "H" 'org-shiftleft
                    "J" 'org-shiftdown
                    "K" 'org-shiftup
                    "L" 'org-shiftright)

(general-define-key :states 'normal
                    :keymaps 'org-mode-map
                    :prefix major-mode-leader
                    "*" 'org-toggle-heading
                    "^" 'org-sort)

(general-define-key :states 'normal
		    :keymaps 'org-mode-map
		    :prefix major-mode-leader
		    "t" 'org-todo
		    "c i" 'org-clock-in
		    "c x" 'org-clock-in-last
		    "c o" 'org-clock-out
		    "c j" 'org-clock-goto
		    "c q" 'org-clock-cancel
		    "c d" 'org-clock-display
		    "c r" 'org-clock-report
		    "c z" 'org-resolve-clocks
		    "c y" 'org-evaluate-time-range
		    "c e" 'org-set-effort
		    "c E" 'org-clock-modify-effort-estimate
		    "e"   'org-export-dispatch
		    "a"   'org-agenda
		    "d"   'org-deadline
		    "s"   'org-schedule
		    )

(general-define-key :states 'emacs
                    :keymaps 'org-agenda-mode-map
                    "j" 'org-agenda-next-line
                    "k" 'org-agenda-previous-line
                    "p" 'org-agenda-capture
                    "g" 'org-agenda-goto-date)

(general-define-key :states '(normal motion)
		    :prefix general-leader
		    "i b" 'ivy-switch-buffer
		    "i f" 'counsel-find-file
		    "i s" 'flyspell-correct-previous-word-generic
		    "i S" 'flyspell-correct-word-generic
		    "i t" 'counsel-load-theme)

(general-define-key :keymaps 'ivy-minibuffer-map
		    "RET" 'ivy-alt-done)

(general-define-key :states '(normal motion)
		    :prefix general-leader
		    "m" 'mu4e)

(use-package yasnippet
  :ensure t)

(use-package pdf-tools
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (use-package page-break-lines
    :ensure t)
  (dashboard-setup-startup-hook)
  (turn-on-page-break-lines-mode)
  (setq dashboard-items '((recents  . 10)
			  (bookmarks . 5)
			  (projects . 5))))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups