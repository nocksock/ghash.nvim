local lush = require('lush')
local hsl = lush.hsl

local white  = hsl(199, 88, 91)
local cold   = hsl(199, 30, 80)
local soot   = hsl(199, 35, 38)
local flame  = hsl(19, 100, 86)
local ember  = hsl(19, 90, 52)
local soft_ember = ember.da(50)
local heat   = hsl(8, 78, 45)
local black  = hsl(19, 88, 9)
local horror = hsl(199,100,3)
local flame_subtle = flame.da(40).de(50)

---@diagnostic disable: undefined-global
local theme = lush(function()
local warmth = black.li(10)
return {
    Normal       { bg=black.da(50), fg=flame }, -- normal text
    NormalFloat  { Normal }, -- Normal text in floating windows.
    NormalNC     { bg=black.da(25) }, -- normal text in non-current windows

    Comment      { fg=soft_ember }, -- any comment
    ColorColumn  { bg=black.li(2.5)}, -- used for the columns set with 'colorcolumn'
    Conceal      { fg=warmth}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg=white }, -- character under the cursor
    lCursor      { fg=white}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { fg=white}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg=horror }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg=black.da(20)}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg=cold }, -- directory names (and other special names in listings)
    DiffAdd      { fg=ember, bg=horror }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg=ember.da(40), bg=horror}, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg=heat, bg=horror}, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg=heat, bg=horror}, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg=black, bg=horror}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor   { }, -- cursor in a focused terminal
    TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg=heat, bg=ember.da(60), gui="bold"}, -- error messages on the command line
    VertSplit    { bg=black, fg=ember.da(60) }, -- the column separating vertically split windows
    Folded       { bg=black }, -- line used for closed folds
    FoldColumn   { Folded }, -- 'foldcolumn'
    SignColumn   { bg=horror, fg=soot }, -- column where |signs| are displayed
    IncSearch    { fg=heat.li(10), bg=black.li(5) }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg=IncSearch.fg, bg=black.li(20)}, -- |:substitute| replacement text highlighting
    LineNr       { fg=warmth, bg=horror }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg=ember.li(10), bg=horror}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg=heat, bg=warmth }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg=heat, bg=horror}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { bg=horror}, -- Area for messages and cmdline
    MsgSeparator { fg=soft_ember}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg=soft_ember}, -- |more-prompt|
    NonText      { fg=warmth.da(10)}, --		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu        { bg=black.li(5), fg=ember }, -- Popup menu: normal item.
    PmenuSel     { bg=horror, fg=cold }, -- Popup menu: selected item.
    PmenuSbar    { bg=horror}, -- Popup menu: scrollbar.
    PmenuThumb   { bg=ember }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg=ember, gui="bold,italic"}, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { IncSearch }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg=heat, bg=horror}, -- status line of current window
    StatusLineNC { bg=black, fg=soft_ember }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg=horror, fg=soft_ember}, -- tab pages line, not active tab page label
    TabLineFill  { bg=horror}, -- tab pages line, where there are no labels
    TabLineSel   { bg=black, fg=ember}, -- tab pages line, active tab page label
    Title        { fg=heat, gui="bold"}, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg=ember.da(75)}, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode 	selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- warning messages
    Whitespace   { fg=black.li(5) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { bg=soft_ember }, -- current match in 'wildmenu' completion

    Parentheses { fg=black.li(20) },

    Constant       { fg=heat}, -- (preferred) any constant
    String         { Constant, gui="italic" }, --   a string constant: "this is a string"
    Character      { Constant }, --  a character constant: 'c', '\n'
    Number         { Constant }, --   a number constant: 234, 0xff
    Boolean        { fg=heat }, --  a boolean constant: TRUE, false
    Float          { Constant }, --    a floating point constant: 2.3e10

    Identifier     { fg=flame_subtle.da(10)}, -- (preferred) any variable name
    -- Function       { fg=ember}, -- function name (also: methods for classes)

    Statement      { fg=flame_subtle.da(30) }, -- (preferred) any statement
    -- Conditional    { fg=ember.li(10)}, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { fg=heat }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { fg=heat }, --  try, catch, throw

    PreProc        { fg=flame_subtle }, -- (preferred) generic Preprocessor
    -- Include        { fg=cold}, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg=heat }, -- (preferred) int, long, char, etc.
    StorageClass   { }, -- static, register, volatile, etc.
    Structure      { }, --  struct, union, enum, etc.
    Typedef        { fg=ember }, --  A typedef

    Special        { fg=ember.li(25) }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    Debug          { fg=cold }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    Ignore         {fg=warmth }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error         { fg=heat, bg=horror}, -- (preferred) any erroneous construct
    Warn          { fg=ember.li(20), bg=black.li(5)}, -- (preferred) any erroneous construct
    Info          { Normal, bg=black}, -- (preferred) any erroneous construct
    Hint          { Normal, bg=black}, -- (preferred) any erroneous construct

    Todo           { fg=heat, bg=flame_subtle.da(70)}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { Error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { Warn } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { Info } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { Hint } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { Hint } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     {Info} , -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     {Hint} , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError        { fg=horror, bg=heat}, -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         {Warn, bg=horror} , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         {Info, bg=horror} , -- Used for "Info" signs in sign column.
    DiagnosticSignHint         {Hint, bg=horror} , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    -- TSKeyword            { } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.

    -- TSX/JSX
    jsxAttrib { fg=ember.da(30) },
    jsxEqual { fg=ember.da(30) },
    jsxTagName { fg=ember },
    jsxCloseTag { fg=heat  },
    jsxBraces { Parentheses },
    typescriptParens { Parentheses },
    typescriptBraces { Parentheses },
    typescriptBrackets { Parentheses },
    typescriptTypeBracket { Parentheses },
    typescriptIdentifierName { Identifier },
    typescriptProp { fg=heat },

    -- stl-vim
    stlModeMsg { bg=ember, fg=black },
    stlLeft {fg=ember},
    stlMid { fg=soft_ember },
    stlRight { fg=soft_ember },

    stlModeMsgNC { bg=ember.da(75), fg=soft_ember },
    stlLeftNC {fg=soft_ember},
    stlMidNC { fg=ember.da(70) },
    stlRightNC { fg=soft_ember },

    GitSignsAdd { DiffAdd },
    GitSignsDelete { DiffDelete },
    GitSignsChange { DiffChange }
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
