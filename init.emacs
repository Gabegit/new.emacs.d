(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(ido-enable-regexp t)
 '(ido-everywhere nil)
 '(markdown-coding-system (quote utf-8-with-signature))
 '(markdown-command
   "/usr/local/bin/pandoc -s -c /Users/gabe/.emacs.d/pandoc.css --mathjax --highlight-style espresso")
 '(markdown-command-needs-filename t)
 '(markdown-enable-math t)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t)))))
 '(pandoc-binary "pandoc")
 '(preview-scale-function 1.3)
 '(reb-re-syntax (quote string))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ;("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))

;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives
;	     '("popkit" . "http://elpa.popkit.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)


;;setting eng and chinese fonts， 最后一行为设置中英文可用鼠标+ctrl同步缩放
;; emacs 24.5 设置字体不当会出现wheel down 时有残影，所以没有设置字体
;; Setting English Font
;; (set-face-attribute
;;   'default nil :font "DejaVu Sans Mono 18")
;; ;; Chinese Font
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;                       charset
;;                       (font-spec :family "Microsoft YaHei" :size 18)))
;(setq face-font-rescale-alist '("Microsoft Yahei" . 1.2))
;(setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))
;(setq face-font-rescale-alist '(("PingFangSC-Regular" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))


;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;; (defface hl-line '((t (:background "Green")))
;;   "Face to use foR `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default


(setq-default line-spacing 7)


;; Prevent startup message and switch to empty *scratch*
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;自动插入括号
(show-paren-mode t)
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)


;(error "No error until here")


;;auctex
;; ;;;;;;;;;LaTex-mode settings;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
	 ; (TeX-fold-mode 1)
	  (turn-off-auto-fill)              ;;LaTeX模式下，不打开自动折行
	  ;(linum-mode 1)
	  (setq-default Tex-master nil) ; query for master file.
	  (TeX-global-PDF-mode t)
	  (auto-complete-mode 1)
	  (LaTeX-math-mode 1)
	  (visual-line-mode t) ; added in mac
	  (outline-minor-mode 1)            ;;使用 LaTeX mode 的时候打开 outline mode
	  (setq TeX-show-compilation nil)   ;;NOT display compilation windows

	  (setq TeX-engine 'xetex)
;; 	  (setq TeX-clean-confirm nil)
;; 	  (setq TeX-save-query nil)
 	  (imenu-add-menubar-index)

    ;; sync pdf with skim in mac
    ;; forward search:c-c c-c;back search from skim to tex using **shiht-cmd-click**
   
    (setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))) ; for mactex
     
     (setq TeX-command-default "LaTeX")
    
     (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))))


(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode ))

;(error "No error until here")

;;;RefTex;;;;;;;;;;;;;;;;
 ;; (require 'reftex)
 ;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
 ;; (setq reftex-plug-into-AUCTeX t)
 ;; (setq reftex-enable-partial-scans t)
 ;; (setq reftex-save-parse-info t)
 ;; (setq reftex-use-multiple-selection-buffers t)
 ;; (setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer在左侧。
 ;; (setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer 使用整个frame的比例。
 ;; (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
 ;; (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
 ;; (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
 ;(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;; added for mactex
;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;; (add-hook 'LaTeX-mode-hook (lambda ()
;;   (push
;;     '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;       :help "Run latexmk on file")
;;     TeX-command-list)))
;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list
;;      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;; Automatically Installing Packages;;;;;;;;;;
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed
 'iedit
 'magit
 'stan-mode
 'julia-mode
 )

;;yasnippet ;;;;;;;;;;;;;
(yas-global-mode 1)
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/snippets"))

;(error "No error until here")
;;; auto copy the selected regions;;;;
; in emacs 25, they need change to select-enable-primary and select-enable-clipborad
(setq x-select-enable-primary t)

(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region t)

;;
;; novel read mode
(defun read-novel-mode ()
  "Setup current window to be suitable for reading long novel/article text.

• Line wrap at word boundaries.
• Set a right margin.
• line spacing is increased.
• variable width font is used.

Call again to toggle back."
  (interactive)
  (if (null (get this-command 'state-on-p))
      (progn
        (set-window-margins nil 0
                            (if (> fill-column (window-body-width))
                                0
                              (progn
                                (- (window-body-width) fill-column))))
        (variable-pitch-mode 1)
        (setq line-spacing 0.4)
        (setq word-wrap t)
        (put this-command 'state-on-p t))
    (progn
      (set-window-margins nil 0 0)
      (variable-pitch-mode 0)
      (setq line-spacing nil)
      (setq word-wrap nil)
      (put this-command 'state-on-p nil)))
  (redraw-frame (selected-frame)))

;(error "No error until here")

;;;;;org-mode

;;orgtbl-mode for transfering org table to markdown table
;;  Usage Example:
;;
;; <!--- BEGIN RECEIVE ORGTBL ${1:YOUR_TABLE_NAME} -->
;; <!--- END RECEIVE ORGTBL $1 -->
;;
;; <!---
;; #+ORGTBL: SEND $1 orgtbl-to-gfm
;; | $0 |
;; -->
(defun orgtbl-to-gfm (table params)
  "Convert the Orgtbl mode TABLE to GitHub Flavored Markdown."
  (let* ((alignment (mapconcat (lambda (x) (if x "|--:" "|---"))
                               org-table-last-alignment ""))
         (params2
          (list
           :splice t
	   :hline (concat alignment "|")
           :lstart "| " :lend " |" :sep " | ")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))

;; ;; auto enable preview for math equations
 (setq org-startup-with-latex-preview t)
;; ;; auto enable image preview
;; (setq org-startup-with-inline-images t)
;; ;; enable highlight for code blocks
(setq org-src-fontify-natively t)
;; ;; default apps to open links
;; (setq org-file-apps '((auto-mode . emacs)
;;                         ("\\.x?html?\\'" . default)
;;                         ("\\.pdf\\'" . "Skim %s")))
;; ;; use ido for better completions
;; ;(setq org-completion-use-ido t)

;; indented according to header level
(setq org-startup-indented t)
(setq org-indent-indentation-per-level 1)

; change latex engine for org-mode
(setq org-latex-to-pdf-process '("xelatex -interaction nonstopmode %f"
                                 "xelatex -interaction nonstopmode %f"))

;(error "No error until here")

;; to hide emphasis markers like ** __ ~~
(setq org-hide-emphasis-markers t)
;; to enable ~'xxx~ *xx* =,xx= to be treated as emphasised expressions;;;
;(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\n")

;; directory
(setq org-directory "~/Dropbox/org")
(unless (file-exists-p org-directory)
    (make-directory org-directory))
(setq my-inbox-org-file (concat org-directory "/notes.org"))
(setq org-default-notes-file my-inbox-org-file)
;(setq org-log-done t)

;; html
(setq org-export-html-coding-system 'utf-8)
(setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)

;; org-capture
(setq org-default-notes-file (concat org-directory "/Users/gabe/Dropbox/org/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
;(error "No error until here")

;;export
(setq org-export-default-language "zh-CN")

(require 'org)
;; (require 'org-exp)
;; (require 'org-latex)

;; org-contrib
;(require 'org-contacts)
;(require 'org-mime)
;(require 'org-bookmark)

(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\)$" . org-mode))
(setq org-log-done t)
(setq org-startup-indented nil)
(setq org-confirm-babel-evaluate nil)
;; org-bable设置
; font-lock in src code blocks
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (mscgen . t)
   (latex . t)
   (ocaml . nil)
   (perl . t)
   (python . t)
   (ruby . nil)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . nil)))

			  ;(error "No error until here")


;;;;;my global-set-keyes;;;;;;;;
;;;my kbd macros
;; compile-current-frame-region_macro
(fset 'compile-current-frame-region_macro
   [?\C-c ?. ?\C-c ?\C-r return])
;;saveas-utf-8_macro
 (fset 'saveas-utf-8_macro
   [?\C-x return ?f ?u ?t ?f tab ?8 ?8 backspace return])
;; compile the region for the subfiles in latex
(fset 'compileregion
   [?\C-x ?h ?\C-c ?\C-r return])
;; insert a tab in makefile command
(fset 'insert-tab-for-makefile
   [?\M-< ?\M-% ?< ?t ?a ?b ?> return tab return ?!])

;; insert space in .Rmd yaml header
(fset 'insert-space-space-yaml
      [?\M-< ?\M-% ?< ?s ?p ?> return ?  ?  return ?!])


;; preview math expression

(global-set-key (kbd "C-c C-p m") 'latex-math-preview-expression) ;

;;change to org-mode for markdown
(fset 'chorg
   "\370org-mode")
(global-set-key (kbd "C-c C-l") 'chorg)

;insert pipe operator %>% using shortcut c-%
(defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
 ; (reindent-then-newline-and-indent))
  (newline-and-indent))

(define-key global-map (kbd "C-%") 'then_R_operator)
;(define-key inferior-ess-mode-map (kbd "C-%") 'then_R_operator)

; set mouse wheel scroll slower
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;(setq mouse-wheel-progressive-speed nil)


;;; indent for html
; mark the entire file with C-x h
;execute M-x indent-region
(setq transient-mark-mode t)

;;;;;;julia-mode
(add-to-list 'load-path "~/.emacs.d/plugins/")

(require 'julia-mode)
(setq inferior-julia-program-name "/Users/gabe/julia/usr/bin/julia")
(require 'julia-mode)

;;;
(add-to-list 'load-path "/Users/gabe/.emacs.d/elpa/visual-regexp-20151206.519/") ;; if the files are not already in the load path
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace) ;
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)


;;;;; dirty fix for having Auto-complete everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
auto-complete-mode (lambda ()
                      (if (not (minibufferp (current-buffer)))
                        (auto-complete-mode 1))
                      ))
(real-global-auto-complete-mode t)

;;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;;
(defun auto-complete-settings ()
;; (apply-define-key
;;    ac-complete-mode-map
;;    `(("<return>"   nil)
;;      ("RET"        nil)
;;      ("M-j"        ac-complete)
;;      ("<C-return>" ac-complete)
;;      ("M-n"        ac-next)
;;      ("M-p"        ac-previous)))

  (setq ac-dwim t)
  (setq ac-candidate-max ac-candidate-menu-height)

  (set-default 'ac-sources
               '(ac-source-semantic
                 ac-source-yasnippet
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-all-buffer
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename)))
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ado-mode for stata;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (cons "/Users/gabe/.emacs.d/plugins/ado-mode/lisp" load-path))
(require 'ado-mode)

;; setup the default directory
(setq default-directory (concat (getenv "HOME") "/"))

;define pipe signal for dplyr
(global-set-key (kbd "M-\.") " %>% ") ;meta(option in mac)+.


;;; xah's tips
(defun xah-cut-line-or-region ()
  "Cut the current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2)) ) )

(defun xah-copy-line-or-region ()
  "Copy current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2)) ) )

(global-set-key (kbd "<f5>") 'xah-cut-line-or-region) ; cut
(global-set-key (kbd "<f6>") 'xah-copy-line-or-region) ; copy
(global-set-key (kbd "<f7>") 'yank) ; paste

; set the alt-p as fill-paragraph 段落自动换行(80列)
(global-set-key (kbd "C-x t") 'fill-paragraph);alt+p
(setq default-fill-column 77);默认显示 80列就换行,if not work,auto-fill-mode
(setq auto-fill-mode t)

(global-set-key "{" '(lambda ()
  (interactive)
  (insert "{")
  (save-excursion (insert "}"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; format for R scripts;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 注意：vincent版的emacs.dmg 安装后将在/Applications/Emacs.app/Contents/Resources/site-lisp/
; 文件夹下生产 site-start.el,里面有一些初始设置，包括ess-site和auctex
; 这里将ess的设置放到这里，便于统一管理。

(add-to-list 'load-path "/Users/gabe/.emacs.d/elpa/ess-20160128.2056/lisp/")

(require 'ess-site)

(setq ess-use-auto-complete t)

(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++ 'quiet)
            (setq comment-column 4) ; 把以#开始的行缩进4空格，免得难看
            (show-paren-mode t)     ; 自动加亮跟踪括号
            ess-indent-level 2
            ess-continued-statement-offset 2
            ess-brace-offset 0
            ess-arg-function-offset 4
            ess-expression-offset 2
            ess-else-offset 0
            ess-close-brace-offset 0
	    ))

;; Automagically delete trailing whitespace when saving R script
;; files. One can add other commands in the ess-mode-hook below.
(add-hook 'ess-mode-hook
	  '(lambda()
	     (add-hook 'write-file-functions
		       (lambda ()
                         (ess-nuke-trailing-whitespace)))
	     (setq ess-nuke-trailing-whitespace-p t)))

;auto-completion in R
(setq ess-use-auto-complete t)

(setq ess-use-auto-complete 'script-only)

;(define-key ac-completing-map (kbd "M-h") 'ac-quick-help) ;

;(error "No error until here")

;;;;;;;;;;;;;;;;;;;;;
;;;;;;python;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

 ;TODO: need to fix it.

;;1.1 jedi for auto-complete
(setq jedi:server-command '("/Users/gabe/.emacs.d/elpa/jedi-core-20151214.2305/jediepcserver.py"))
;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Type:
;;     M-x package-install RET jedi RET
;;     M-x jedi:install-server RET
;; Then open Python file.


;;;;;;;;;;;;;;;;;;;;;;
;;;;others;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

;;;;;RECENT files
(require 'recentf )
(recentf-mode 1)

(server-start)

;;unicad 自动编码识别器
(require 'unicad)

;;鼠标缩放
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

; Add flymake errors to mini-buffer

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)

;;Window Resizing

(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;(global-set-key (kbd "S-C-<down>") 'shrink-window)
;(global-set-key (kbd "S-C-<up>") 'enlarge-window)


(load-theme 'solarized-light t)

;;;;;;;;;;;;;;;;;;;;;;
;; markdown-mode;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))

; stan-mode
 (require 'stan-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;flycheck;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook #'global-flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;solarized-theme;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do M-x package-install solarized-theme (from the Installation instructions on the theme github page).
;; Do M-x load-theme and pick one of the Solarized theme variants.


;;;;zotero for emacs;;;;
;; C-c z c         zotelo-set-collection (also "C-c z s")
;; C-c z e         zotelo-export-secondary
;; C-c z r         zotelo-reset
;; C-c z t         zotelo-set-translator
;; C-c z u         zotelo-update-database	;


;(add-hook 'TeX-mode-hook 'zotelo-minor-mode)


;; solving the scrolling blink problem
 ;;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; two lines at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(global-set-key [wheel-right] (lambda ()
                                 (interactive)
                                 (scroll-left 1)))
(global-set-key [wheel-left] (lambda ()
                                (interactive)
                                (scroll-right 1)))
