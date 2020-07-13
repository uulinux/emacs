;;; package --- Summary
;;; Commentary:

;;; Code:
(setq org-edit-src-content-indentation 0)
(setq org-fontify-whole-heading-line   t)
(setq org-support-shift-select         t)
(setq org-refile-targets               nil)
(setq org-tags-column                  80)

(setq my-gtd-misc-file
      (expand-file-name "misc.org" "~/custom/GTD"))

(setq org-default-notes-file my-gtd-misc-file)

(setq org-agenda-files "~/custom/GTD/org_gtd_list.txt")

(setq org-refile-targets
      (quote ((org-agenda-files :maxlevel . 2))))

(defun my-gtd-misc-template ()
  (list my-gtd-misc-file "Tasks"))

(my-gtd-misc-template)

(setq org-capture-templates
      '(("t" "Create a new misc task." entry (file+headline "" "Misc Tasks")
         "** %?\n %U" :empty-lines-after 1)
        ("i" "Create a new idea." entry (file+headline "" "Ideas")
         "** %i\n %U" :empty-lines-after 1)
        ("p" "Create a temp project task." entry (file+headline "" "Temp Project")
         "** %?\n %U" :empty-lines-after 1)))

(setq org-html-head
      (format
       "<link rel=\"stylesheet\" type=\"text/css\" href=\"%s\"/>"
       (expand-file-name "configure/org_style/style.css" user-emacs-directory)))

;; For babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; Draw Picture
   (ditaa . t)
   (dot . t)
   (plantuml . t)
   (latex . t)
   ;; Program Languages
   (emacs-lisp . t)
   (python . t)
   (R . t)
   (ruby . t)
   ))
(setq org-confirm-babel-evaluate nil)
(setq org-html-postamble nil)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)
                           (yas-minor-mode)
                           ))

;; For org2ctex
(require 'org2ctex)
(org2ctex-toggle t)

;;; (setq-default org2ctex-latex-default-packages-alist
;;;               (quote
;;;                (("AUTO" "inputenc" t ("pdflatex"))
;;;                 ("T1" "fontenc" t ("pdflatex"))
;;;                 ("" "graphicx" t nil)
;;;                 ("" "grffile" t nil)
;;;                 ("" "longtable" nil nil)
;;;                 ("" "wrapfig" nil nil)
;;;                 ("" "rotating" nil nil)
;;;                 ("normalem" "ulem" t nil)
;;;                 ("" "amsmath" t nil)
;;;                 ("" "textcomp" t nil)
;;;                 ("" "amssymb" t nil)
;;;                 ("" "capt-of" nil nil)
;;;                 ("" "hyperref" nil nil)
;;;                 ("" "minted" nil nil))))

(add-to-list 'org2ctex-latex-default-packages-alist '("" "minted" nil) t)

(setq org2ctex-latex-commands
      (quote
	("xelatex -shell-escape -synctex=1 --shell-es-interaction nonstopmode -output-directory %o %f"
	 "bibtex %b"
	 "xelatex -shell-escape -synctex=1 -interaction nonstopmode -output-directory %o %f"
	 "xelatex -shell-escape -synctex=1 -interaction nonstopmode -output-directory %o %f")))

(setq org-latex-listings (quote minted))

(provide 'init-org)
;;; init-org.el ends here
