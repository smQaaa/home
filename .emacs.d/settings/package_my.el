;; Package manager:
;; Initialise package and add Melpa repository

(require 'package)

(setq my-packages
    '(
      el-get
      all-the-icons
      apib-mode
      avy
      company-mode
      company-flx
      company-restclient
      eglot
      emmet-mode
      emacs-fish
      expand-region
      evil
      flycheck
      git-gutter
      helm
      helm-projectile
      helm-swoop
      helm-company
      json-mode
      key-chord
      know-your-http-well
      magit
      markdown-mode
      mo-git-blame
      multi-compile
      multiple-cursors
      neotree
      less-css-mode
      projectile
      rainbow-mode
      rainbow-delimiters
      restclient
      smartparens
      smart-mode-line
      undo-tree
      vimrc-mode
      web-mode
      xclip
      yafolding
      yaml-mode
      yasnippet
      yasnippet-snippets
      )
)
(when (executable-find "go")
    (add-to-list 'my-packages 'go-eldoc)
    (add-to-list 'my-packages 'go-mode)
    (add-to-list 'my-packages 'go-company)
)

(when (executable-find "node")
    (add-to-list 'my-packages 'js2-mode)
    (add-to-list 'my-packages 'js2-refactor)
    (add-to-list 'my-packages 'prettier-js)
)

(when (executable-find "rg")
    (add-to-list 'my-packages 'helm-ag)
)

(when (executable-find "cargo")
    (add-to-list 'my-packages 'rust-mode)
    (add-to-list 'my-packages 'rust-racer)
    (add-to-list 'my-packages 'flycheck-rust)
    (add-to-list 'my-packages 'emacs-racer)
)

(when (executable-find "python")
    (add-to-list 'my-packages 'pip-requirements)
    (when (executable-find "autopep8")
      (add-to-list 'my-packages 'py-autopep8)
      )
    (add-to-list 'my-packages 'py-isort)
    ;(when (executable-find "virtualenv")
    ;  (add-to-list 'my-packages 'auto-virtualenv))

    ;; (when (executable-find "virtualenvwrapper")
    ;;   (add-to-list 'my-packages 'auto-virtualenvwrapper))
)

(when (executable-find "livedown")
    (add-to-list 'my-packages 'livedown)
)

(when (executable-find "scala")
    (add-to-list 'my-packages 'sbt-mode)
    (add-to-list 'my-packages 'scala-mode)
)

;(when (executable-find "javac")
;    (add-to-list 'my-packages 'meghanada)
;)

(when (executable-find "docker")
    (add-to-list 'my-packages 'dockerfile-mode)
    ;(add-to-list 'my-packages 'docker-compose-mode)
)


;; for gnu repository
(setq package-check-signature nil)
;; bug fix for gnu
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (package-refresh-contents)
  (package-install 'el-get)
  (package-install 'async)
  (package-install 'jsonrpc)
  (package-install 'cl-lib)
  (package-install 'memoize)
  (package-install 'flymake)
  (message "require is")
  (require 'el-get)
  (el-get 'sync))

(add-to-list 'el-get-recipe-path "~/.emacs.d/settings/recipes")

(el-get 'sync my-packages)

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

(provide 'package_my)
