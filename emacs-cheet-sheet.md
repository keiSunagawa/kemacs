-- text
C-v | M-v -> scroll
C-l -> scroll current line
M-f | M-b -> word step
C-u number command -> repeat command
C-> -> go to file end
C-< -> go to file start
C-<Delback> -> delete word
C-@ -> multi line
C-w -> cut
M-w -> copy
C-y -> yank(past)
C-x u | C-/ | C-_ -> undo
C-k -> delete line
M-; -> comment out
C-s | C-r -> searche
C-c r -> rectangle select

-- files
C-x C-f -> open file
C-x C-s -> save file
C-x s -> save file with confirm
C-x d -> Dired file browser
  C-u s <RET> -> refresh Dired buffer
  + -> create directory
  <RET> -> open directory or file

-- buffer
C-x C-b -> open buffer list
C-x b -> change buffer
C-x left | C-x right -> change buffer

-- window
C-x 1 -> close other window
C-x number -> add window
C-x o -> change current window
C-x 4 0 -> close current window
C-x <left down up right> -> change window

-- system
C-z -> sleep emacs *`fg` command or `%emacs` to comeback emacs process
C-h a -> serch command
C-h b -> list key bind
C-x C-e -> load S-expression(need to run behind S-expression `)` you want to load)
M-x eval-buffer -> load all S-expression from current buffer
C-g -> quit command

-- helm 
M-x helm-for-files -> file & buffer list
M-x helm-show-kill-ring -> show kill ling

-- elscreen
C-z c -> new screen
C-z k -> kill screen
C-z- <left> | C-z <right> -> change screen
C-z number -> change screen number

------

-- library
- init-loader
https://github.com/emacs-jp/init-loader

-- helm
-- undo-tree
-- elscreen