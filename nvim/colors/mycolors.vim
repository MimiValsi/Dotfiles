set background=dark
highlight clear

if exists("syntax_on")
        syntax clear
endif

hi Normal guifg=#009b00
hi Visual guibg=#34373b
hi String guifg=#00a000
hi Character guifg=#a26666
hi Number guifg=#df6300
hi Identifier guifg=#bbb000
hi Comment guifg=#b27300
hi Function guifg=#b2a000
hi Operator guifg=#c00c8c" * -> ? : = ! + -
hi keyword guifg=#06907b " for if/else const typedef struct include while

