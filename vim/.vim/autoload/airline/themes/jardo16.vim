" -----------------------------------------------------------------------------
" File: jardo16.vim
" Description: Custom airline theme for base16 themes
" Author: Jared Norman <jared@super.gd>
" -----------------------------------------------------------------------------

let s:theme = 'jardo16'

function! airline#themes#{s:theme}#refresh()
  " Normal
  let N1 = airline#themes#get_highlight2(['DiffText', 'bg'], ['DiffText', 'fg'], 'bold')
  let N2 = airline#themes#get_highlight2(['Visual', 'fg'], ['Visual', 'bg'])
  let N3 = airline#themes#get_highlight('CursorLine')

  " Insert
  let I1 = airline#themes#get_highlight2(['DiffText', 'bg'], ['DiffAdded', 'fg'], 'bold')
  let I2 = N2
  let I3 = N3

  " Replace
  let R1 = airline#themes#get_highlight2(['DiffText', 'bg'], ['WarningMsg', 'fg'], 'bold')
  let R2 = N2
  let R3 = N3

  " Visual
  let V1 = airline#themes#get_highlight2(['DiffText', 'bg'], ['Constant', 'fg'], 'bold')
  let V2 = N2
  let V3 = N3

  " Inactive
  let XX = airline#themes#get_highlight('Comment')
  let IA = [XX[0], N3[1], '', '', '']
  echo IA

  " Error
  let ER = [ '', '', 234, 167 ]

  " Warning
  let WI = [ ER[0], '', ER[2], 215 ]

  " Terminal
  let TE = [ ER[0], N1[1], N1[2], N1[3] ]

  " Reverse
  let NR = [ N2[1], N2[0], N2[3], N2[2], 'bold' ]

  let palette = {}

  let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
  let palette.normal.airline_error   = ER
  let palette.normal.airline_warning = WI
  let palette.normal.airline_term    = TE

  let palette.insert = airline#themes#generate_color_map(I1, I2, I3)
  let palette.insert.airline_error   = ER
  let palette.insert.airline_warning = WI
  let palette.insert.airline_term    = TE

  let palette.replace = airline#themes#generate_color_map(R1, R2, R3)
  let palette.replace.airline_error   = ER
  let palette.replace.airline_warning = WI
  let palette.replace.airline_term    = TE

  let palette.visual = airline#themes#generate_color_map(V1, V2, V3)
  let palette.visual.airline_error   = ER
  let palette.visual.airline_warning = WI
  let palette.visual.airline_term    = TE

  let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)

  " Accents
  let palette.accents = {
        \ 'red': [ ER[1], '', ER[3], '' ]
        \ }

  let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
