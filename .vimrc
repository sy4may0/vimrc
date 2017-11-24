" dein.vim plugin directory.
let s:dein_dir = expand('~/.cache/dein')

" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim download.
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vim configure
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Plugins toml files
    let g:rc_dir      = expand('~/.vim/rc')
    let s:toml        = g:rc_dir . '/dein.toml'
    let s:lazy_toml   = g:rc_dir . '/dein_lazy.toml'

    " Load and cache toml files.
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " Configure terminate.
    call dein#end()
    call dein#save_state()
endif

" dein new install.
if dein#check_install()
    call dein#install()
endif

" Settings
colorscheme molokai
syntax on

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set wrap

set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest

set expandtab
set tabstop=4

" Insert escape change
inoremap <silent> jj <ESC>

" Unite vim aliase
nnoremap UF :<C-u>Unite file<CR>
nnoremap UC :<C-u>Unite file_mru<CR>
nnoremap UB :<C-u>Unite Buffer<CR>
nnoremap UT :<C-u>Unite tab<CR>

" Unite vim keymap
au FileType unite nnoremap <silent> <buffer> <expr> ho unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> ho unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> vo unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> vo unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> to unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> to unite#do_action('tabopen')

" Tab change config
nnoremap gr gT
nnoremap WH <C-w>h
nnoremap WJ <C-w>j
nnoremap WK <C-w>k
nnoremap WL <C-w>h

" Winresizer configure
nnoremap <silent> <C-e> :WinResizerStartResize<CR>

" TwitVim
let twitvim_browser_cmd = 'firefox -url'
let twitvim_force_ssl = 1
let twitvim_count = 40

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
    set wrap
endfunction

" open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
