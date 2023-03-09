(module init
  {require {a    aniseed.core
            nvim aniseed.nvim
            util dotfiles.util}})

; require all macros
; (require-macros :hibiscus.core)
; (require-macros :hibiscus.vim)

; require only selected macros (you can also rename them like this)
; (require-macros :hibiscus.utils.init-macros)
; (import-macros {:fstring! f!} :hibiscus.core)
; (import-macros {: b! : g! : map! : set! : setlocal! : setglobal!} :hibiscus.vim)

(a.println "Hello from init.fnl")
(nvim.echo "init.fnl running modules...")
(nvim.echo (.. "init.fnl config path is " (nvim.fn.stdpath "config")))

;; Load all modules in no particular order.
(->> (util.glob (.. util.config-path "/lua/dotfiles/module/*.lua"))
     (a.run! (fn [path]
               (let [mod (string.gsub path ".*\\(.-)\\(.-)\\(.-)%.lua" "%1.%2.%3")]
                 (a.println (.. "requiring " mod))
                 (require mod)
                 ))))

