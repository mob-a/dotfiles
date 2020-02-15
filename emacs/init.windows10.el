;; Windows10用Emacs
;;   https://github.com/mhatta/emacs-26-x86_64-win-ime
;; VLGothicをインストールしておく
;;   https://ja.osdn.net/projects/vlgothic/releases/
;; 置き場所はおそらく C:\Users\username\AppData\Roaming\.emacs.d\init.el

;;;;;;;;;;;;;;;;
;; 基本設定
;;;;;;;;;;;;;;;;
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-ci" 'string-rectangle)

(column-number-mode t) ; カーソルの位置が何文字目かを表示する
(line-number-mode t) ; カーソルの位置が何行目かを表示する
(setq backup-inhibited t) ; バックアップファイルを作らない
(setq create-lockfiles nil) ; バックアップファイルを作らない
(setq load-path (cons "~/.emacs.d/elisp" load-path)) ; pathを通す
(cd "~/../../Desktop") ;初期ディレクトリ


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 日本語環境の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-language-environment "Japanese")
(setq default-input-method "W32-IME")
(w32-ime-initialize)

(toggle-enable-multibyte-characters 1)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)

;; 日本語で search
(defun w32-isearch-update () (interactive)  (isearch-update)) 
(define-key isearch-mode-map [compend] 'w32-isearch-update)
(define-key isearch-mode-map [kanji] 'isearch-toggle-input-method)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 画面設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erase memubar, scrollbar
(menu-bar-mode -1)       ;画面上に出るメニュー(文字)を消す
(tool-bar-mode -1)       ;画面上に出るツールバー(アイコン画像)を消す
(scroll-bar-mode -1)     ;画面横に出るスクロールバーを消す
(setq inhibit-startup-message t) ;スプラッシュ(起動画面)抑止

;; フォント
(set-default-font "VL gothic-12") 

;; 全角スペースを色つき表示する  http://homepage1.nifty.com/blankspace/emacs/color.html
(defface my-face-b-1 '((t (:background "gray98"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-b-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; 色設定 (色名は M-x list-color-displayで調べる)
(add-to-list 'default-frame-alist '(foreground-color . "gray13")) ; 文字色
(add-to-list 'default-frame-alist '(background-color . "azure2")) ; 背景色
(add-to-list 'default-frame-alist '(cursor-color . "SteelBlue1")) ; カーソル色
(set-face-background 'region "SlateGray2") ; リージョン色
(set-face-foreground 'mode-line "HotPink") ; モードライン文字色
(set-face-background 'mode-line "MintCream") ; モードライン背景色
(set-face-foreground 'mode-line-inactive "HotPink") ; モードライン（アクティブでないバッファ）の文字色
(set-face-background 'mode-line-inactive "MintCream") ; モードライン（アクティブでないバッファ）の背景色
