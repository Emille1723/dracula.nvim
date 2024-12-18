---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs DraculaConfig
---@return HighlightGroups
---@nodiscardd
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.visual or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg, },
      NormalFloat = { fg = colors.fg, bg = colors.bg, },
      Comment = { fg = colors.comment, italic = configs.italic_comment, },
      -- Constant = { fg = colors.yellow, },
      Constant = { fg = colors.purple, },
      String = { fg = colors.yellow, },
      Character = { fg = colors.green, },
      Number = { fg = colors.orange, },
      -- Boolean = { fg = colors.cyan, },
      Boolean = { fg = colors.purple, },
      Float = { fg = colors.orange, },
      FloatBorder = { fg = colors.bg, },
      -- FloatBorder = { fg = colors.green1, },
      -- FloatBorder = { fg = colors.white, },
      -- Operator = { fg = colors.purple, },
      Operator = { fg = colors.pink, },
      Keyword = { fg = colors.cyan, },
      Keywords = { fg = colors.cyan, },
      Identifier = { fg = colors.cyan, },
      -- Function = { fg = colors.yellow, },
      Function = { fg = colors.green, },
      Statement = { fg = colors.purple, },
      Conditional = { fg = colors.pink, },
      Repeat = { fg = colors.pink, },
      Label = { fg = colors.cyan, },
      Exception = { fg = colors.purple, },
      PreProc = { fg = colors.yellow, },
      Include = { fg = colors.purple, },
      Define = { fg = colors.purple, },
      Title = { fg = colors.cyan, },
      Macro = { fg = colors.purple, },
      PreCondit = { fg = colors.cyan, },
      Type = { fg = colors.cyan, },
      StorageClass = { fg = colors.pink, },
      Structure = { fg = colors.yellow, },
      TypeDef = { fg = colors.yellow, },
      Special = { fg = colors.green, italic = true },
      SpecialComment = { fg = colors.comment, italic = true, },
      Error = { fg = colors.bright_red, },
      Todo = { fg = colors.purple, bold = true, italic = true, },
      Underlined = { fg = colors.cyan, underline = true, },

      Cursor = { reverse = true, },
      CursorLineNr = { fg = colors.fg, bold = true, }, -- my default
      -- CursorLineNr = { fg = colors.fg, bold = true, bg = "#062235" }, -- testing with status col
      -- CursorLineNr = { fg = colors.fg, bold = true, },
      -- CursorLineNr = { fg = colors.blue, bold = true, },
      -- CursorLineNr = { fg = "#7FBCB1", bold = true, },

      SignColumn = { bg = colors.bg, },

      Conceal = { fg = colors.comment, },
      CursorColumn = { bg = colors.black, },
      -- CursorLine = { bg = colors.selection, },
      -- CursorLine = { bg = "#191C24", },
      CursorLine = { bg = colors.cursor, bold = false },
      ColorColumn = { bg = "#191C24" },

      StatusLine = { fg = colors.white, bg = colors.black, },
      StatusLineNC = { fg = colors.comment, },
      StatusLineTerm = { fg = colors.white, bg = colors.black, },
      StatusLineTermNC = { fg = colors.comment, },

      Directory = { fg = colors.cyan, },
      DiffAdd = { fg = colors.bg, bg = colors.green, },
      DiffChange = { fg = colors.orange, },
      DiffDelete = { fg = colors.red, },
      DiffText = { fg = colors.comment, },

      ErrorMsg = { fg = colors.bright_red, },
      -- VertSplit = { fg = colors.black, }, -- my default
      -- VertSplit = { fg = "#45475A", },
      VertSplit = { fg = "#313244", bold = true },
      Folded = { fg = colors.comment, },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.orange, },
      IncSearch = { fg = colors.orange, bg = colors.comment, },
      -- LineNr = { fg = colors.comment, },
      -- LineNr = { fg = "#9f9f9f", },
      -- LineNr = { fg = "#aaaaaa", },
      -- LineNr = { fg = "#b4b4b4", },
      -- LineNr = { fg = "#a1a1a1", bold = true },
      -- LineNr = { fg = "#A5B6CF", bold = true }, -- fallback default
      -- LineNr = { fg = "#7f849c", bold = true }, -- cool alt
      -- LineNr = { fg = "#7F849C", bold = true }, -- cool alt 1
      -- LineNr = { fg = "#737481", bold = true }, -- not bad
      -- LineNr = { fg = "#83838f", bold = true }, -- very nice
      -- LineNr = { fg = "#92939d", bold = true }, -- really good
      LineNr = { fg = "#a2a2ab", bold = true }, -- new default
      -- LineNr = { fg = "#bec0d3", bold = true }, -- new fallback default
      -- LineNr = { fg = "#959595", },
      -- LineNr = { fg = colors.blue, },
      -- LineNr = { fg = "#898989", },
      MatchParen = { fg = colors.fg, underline = true, },
      NonText = { fg = colors.nontext, },
      Pmenu = { fg = colors.white, bg = colors.menu, },
      PmenuSel = { fg = colors.white, bg = colors.selection, },
      PmenuSbar = { bg = colors.bg, },
      PmenuThumb = { bg = colors.selection, },

      Question = { fg = colors.purple, },
      QuickFixLine = { fg = colors.black, bg = colors.yellow, },
      SpecialKey = { fg = colors.nontext, },

      -- SpellBad = { fg = colors.bright_red, underline = true, }, -- default
      SpellBad = { sp = colors.bright_red, undercurl = true, },
      -- SpellCap = { fg = colors.yellow, }, -- default
      SpellCap = { sp = colors.yellow, undercurl = true },
      -- SpellLocal = { fg = colors.yellow, }, -- default
      SpellLocal = { sp = colors.yellow, undercurl = true },
      -- SpellRare = { fg = colors.yellow, }, -- default
      SpellRare = { sp = colors.yellow, undercurl = true },

      TabLine = { fg = colors.comment, },
      TabLineSel = { fg = colors.white, },
      TabLineFill = { bg = colors.bg, },
      Terminal = { fg = colors.white, bg = colors.black, },
      Visual = { bg = colors.visual, },
      VisualNOS = { fg = colors.visual, },
      WarningMsg = { fg = colors.yellow, },
      WildMenu = { fg = colors.black, bg = colors.white, },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ['@error'] = { fg = colors.bright_red, },
      ['@punctuation.delimiter'] = { fg = colors.fg, },
      ['@punctuation.bracket'] = { fg = colors.fg, },
      -- ['@punctuation.special'] = { fg = colors.cyan, },
      -- ['@punctuation.special'] = { fg = colors.pink, },
       ['@markup.list'] = { fg = colors.pink, },

      ['@constant'] = { fg = colors.purple, },
      ['@constant.builtin'] = { fg = colors.purple, },
      -- ['@symbol'] = { fg = colors.purple, },
      ['@markup.link.label.symbol'] = { fg = colors.purple, },

      ['@constant.macro'] = { fg = colors.cyan, },
      -- ['@string.regex'] = { fg = colors.red, },
      ['@string.regexp'] = { fg = colors.red, },
      ['@string'] = { fg = colors.yellow, },
      ['@string.escape'] = { fg = colors.cyan, },
      ['@string.special.symbol'] = { fg = colors.purple, },
      ['@character'] = { fg = colors.green, },
      ['@number'] = { fg = colors.purple, },
      ['@boolean'] = { fg = colors.purple, },
      -- ['@float'] = { fg = colors.green, },
      ['@number.float'] = { fg = colors.green, },
      ['@annotation'] = { fg = colors.yellow, },
      ['@attribute'] = { fg = colors.cyan, },
      -- ['@namespace'] = { fg = colors.orange, },
      ['@module'] = { fg = colors.orange, },

      -- ['@function.builtin'] = { fg = colors.cyan, },
      ['@function.builtin'] = { fg = colors.green, },
      ['@function'] = { fg = colors.green, },
      -- ['@function.call'] = { fg = colors.green, }, -- my new addition
      ['@function.macro'] = { fg = colors.green, },
      -- ['@parameter'] = { fg = colors.orange, },
      -- ['@parameter.reference'] = { fg = colors.orange, },
      -- ['@method'] = { fg = colors.green, },
      -- ['@field'] = { fg = colors.orange, },
      ['@variable.parameter'] = { fg = colors.orange, },
      ['@variable.parameter.reference'] = { fg = colors.orange, },
      ['@function.method'] = { fg = colors.green, },
      ['@variable.member'] = { fg = colors.orange, },
      ['@property'] = { fg = colors.purple, },
      ['@constructor'] = { fg = colors.cyan, },

      -- ['@conditional'] = { fg = colors.pink, },
      -- ['@repeat'] = { fg = colors.pink, },
      ['@keyword.conditional'] = { fg = colors.pink, },
      ['@keyword.repeat'] = { fg = colors.pink, },
      ['@label'] = { fg = colors.cyan, },

      ['@keyword'] = { fg = colors.pink, },
      ['@keyword.function'] = { fg = colors.cyan, },
      ['@keyword.operator'] = { fg = colors.pink, },
      ['@operator'] = { fg = colors.pink, },
      -- ['@exception'] = { fg = colors.purple, },
      ['@keyword.exception'] = { fg = colors.purple, },
      ['@type'] = { fg = colors.bright_cyan, },
      ['@type.builtin'] = { fg = colors.cyan, italic = true, },
      ['@type.qualifier'] = { fg = colors.pink, },
      -- ['@structure'] = { fg = colors.purple, },
      ['@structure'] = { fg = colors.pink, },
      -- ['@include'] = { fg = colors.pink, },
      -- ['@include'] = { fg = colors.pink, },
      ['@keyword.include'] = { fg = colors.pink, },

      -- ['@variable'] = { fg = colors.fg, },\
      ['@variable'] = { fg = colors.purple, },
      ['@variable.builtin'] = { fg = colors.purple, },

      -- ['@text'] = { fg = colors.orange, },
      -- ['@text.strong'] = { fg = colors.orange, bold = true, }, -- bold
      -- ['@text.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
      -- ['@text.underline'] = { fg = colors.orange, },
      -- ['@text.title'] = { fg = colors.pink, bold = true, }, -- title
      -- ['@text.literal'] = { fg = colors.yellow, }, -- inline code
      -- ['@text.uri'] = { fg = colors.yellow, italic = true, }, -- urls
      -- ['@text.reference'] = { fg = colors.orange, bold = true, },
      ['@markup'] = { fg = colors.orange, },
      ['@markup.strong'] = { fg = colors.orange, bold = true, },     -- bold
      ['@markup.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
      ['@markup.underline'] = { fg = colors.orange, },
      ['@markup.heading'] = { fg = colors.pink, bold = true, },        -- title
      ['@markup.raw'] = { fg = colors.yellow, },                 -- inline code
      ['@markup.link.url'] = { fg = colors.yellow, italic = true, },      -- urls
      ['@markup.link'] = { fg = colors.orange, bold = true, },

      -- ['@tag'] = { fg = colors.cyan, },
      ['@tag'] = { fg = colors.pink, },
      ['@tag.attribute'] = { fg = colors.green, },
      ['@tag.delimiter'] = { fg = colors.cyan, },

        -- Semantic 
      ['@class'] = { fg = colors.cyan },
      ['@struct'] = { fg = colors.cyan },
      ['@enum'] = { fg = colors.cyan },
      ['@enumMember'] = { fg = colors.purple },
      ['@event'] = { fg = colors.cyan },
      -- ['@interface'] = { fg = colors.cyan },
      ['@interface'] = { fg = colors.pink },
      ['@modifier'] = { fg = colors.cyan },
      ['@regexp'] = { fg = colors.yellow },
      ['@typeParameter'] = { fg = colors.cyan },
      -- ['@decorator'] = { fg = colors.cyan },
      ['@decorator'] = { fg = colors.pink },

        -- LSP Semantic (0.9+)
      ['@lsp.type.class'] = { fg = colors.cyan },
      ['@lsp.type.enum'] = { fg = colors.cyan },
      ['@lsp.type.decorator'] = { fg = colors.green },
      ['@lsp.type.enumMember'] = { fg = colors.purple },
      ['@lsp.type.function'] = { fg = colors.green, },
      ['@lsp.type.interface'] = { fg = colors.cyan },
--       ['@lsp.type.interface'] = { fg = colors.pink },
      ['@lsp.type.macro'] = { fg = colors.cyan },
      ['@lsp.type.method'] = { fg = colors.green, },
      ['@lsp.type.namespace'] = { fg = colors.orange, },
      ['@lsp.type.parameter'] = { fg = colors.orange, },
      ['@lsp.type.parameter.reference'] = { fg = colors.orange, },
      -- ['@lsp.type.property'] = { fg = colors.purple, },
      ['@lsp.type.property'] = { fg = colors.orange, },
      ['@lsp.type.struct'] = { fg = colors.cyan },
      ['@lsp.type.type'] = { fg = colors.bright_cyan, },
      -- ['@lsp.type.variable'] = { fg = colors.fg, },
      ['@lsp.type.variable'] = { fg = colors.purple, },

      -- HTML
      htmlArg = { fg = colors.green, },
      htmlBold = { fg = colors.yellow, bold = true, },
      htmlEndTag = { fg = colors.cyan, },
      htmlH1 = { fg = colors.pink, },
      htmlH2 = { fg = colors.pink, },
      htmlH3 = { fg = colors.pink, },
      htmlH4 = { fg = colors.pink, },
      htmlH5 = { fg = colors.pink, },
      htmlH6 = { fg = colors.pink, },
      htmlItalic = { fg = colors.purple, italic = true, },
      htmlLink = { fg = colors.purple, underline = true, },
      htmlSpecialChar = { fg = colors.yellow, },
      htmlSpecialTagName = { fg = colors.cyan, },
      htmlTag = { fg = colors.cyan, },
      htmlTagN = { fg = colors.cyan, },
      htmlTagName = { fg = colors.cyan, },
      htmlTitle = { fg = colors.white, },

      -- Markdown
      markdownBlockquote = { fg = colors.yellow, italic = true, },
      markdownBold = { fg = colors.orange, bold = true, },
      markdownCode = { fg = colors.green, },
      markdownCodeBlock = { fg = colors.orange, },
      markdownCodeDelimiter = { fg = colors.red, },
      markdownH1 = { fg = colors.pink, bold = true, },
      ["@text.title.1.markdown"] = { fg = colors.pink },
      ["@text.title.1.marker.markdown"] = { fg = colors.pink },
      ["@text.title.1.vimdoc"] = { fg = colors.pink },
      -- markdownH2 = { fg = colors.pink, bold = true, },
      markdownH2 = { fg = "#89DCEB", bold = true, },
      ["@text.title.2.markdown"] = { fg = "#89DCEB" },
      ["@text.title.2.marker.markdown"] = { fg = "#89DCEB" },
      ["@text.title.2.vimdoc"] = { fg = "#89DCEB" },
      -- markdownH3 = { fg = colors.pink, bold = true, },
      markdownH3 = { fg = colors.orchid, bold = true, },
      ["@text.title.3.markdown"] = { fg = colors.orchid },
      ["@text.title.3.marker.markdown"] = { fg = colors.orchid },
      ["@text.title.3.vimdoc"] = { fg = colors.orchid },
      -- markdownH4 = { fg = colors.pink, bold = true, },
      markdownH4 = { fg = colors.watermelon, bold = true, },
      ["@text.title.4.markdown"] = { fg = colors.watermelon },
      ["@text.title.4.marker.markdown"] = { fg = colors.watermelon },
      ["@text.title.4.vimdoc"] = { fg = colors.watermelon },
      -- markdownH5 = { fg = colors.pink, bold = true, },
      markdownH5 = { fg = colors.blue, bold = true, },
      ["@text.title.5.markdown"] = { fg = colors.blue },
      ["@text.title.5.marker.markdown"] = { fg = colors.blue },
      ["@text.title.5.vimdoc"] = { fg = colors.blue },
      -- markdownH6 = { fg = colors.pink, bold = true, },
      markdownH6 = { fg = colors.purple, bold = true, },
      ["@text.title.6.markdown"] = { fg = colors.purple },
      ["@text.title.6.marker.markdown"] = { fg = colors.purple },
      ["@text.title.6.vimdoc"] = { fg = colors.purple },
      markdownHeadingDelimiter = { fg = colors.red, },
      markdownHeadingRule = { fg = colors.comment, },
      markdownId = { fg = colors.purple, },
      markdownIdDeclaration = { fg = colors.cyan, },
      markdownIdDelimiter = { fg = colors.purple, },
      markdownItalic = { fg = colors.yellow, italic = true, },
      markdownLinkDelimiter = { fg = colors.purple, },
      markdownLinkText = { fg = colors.pink, },
      markdownListMarker = { fg = colors.cyan, },
      markdownOrderedListMarker = { fg = colors.red, },
      markdownRule = { fg = colors.comment, },

      --  Diff
      diffAdded = { fg = colors.green, },
      diffRemoved = { fg = colors.red, },
      diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
      diffFile = { fg = colors.nontext, },
      diffNewFile = { fg = colors.green, },
      diffOldFile = { fg = colors.red, },

      debugPc = { bg = colors.cyan, },
      debugBreakpoint = { fg = colors.red, reverse = true, },

      -- Git Signs
      GitSignsAdd = { fg = colors.bright_green, },
      GitSignsAddCul = { fg = colors.bright_green, bg = colors.cursor },   
      GitSignsStagedAddCul = { fg = "#347f4a", bg = colors.cursor },
      -- GitSignsChange = { fg = colors.cyan, }, -- default
      GitSignsChange = { fg = colors.nightfly_yellow },
      GitSignsChangeCul = { fg = colors.nightfly_yellow, bg = colors.cursor },
      GitSignsStagedChangeCul = { fg = "#7f6001", bg = colors.cursor },
      GitSignsStagedChangedeleteCul = { fg = "#7f6001", bg = colors.cursor },
      GitSignsDelete = { fg = colors.bright_red, },
      GitSignsDeleteCul = { fg = colors.bright_red, bg = colors.cursor  },
      GitSignsStagedDeleteCul = { fg = "#7f3737", bg = colors.cursor  },
      GitSignsStagedTopdeleteCul = { fg = "#7f3737", bg = colors.cursor },
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
      -- GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, }, -- default
      GitSignsChangeLn = { fg = colors.black, bg = colors.nightfly_yellow, },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
      GitSignsCurrentLineBlame = { fg = colors.white, },

      -- Telescope
      -- TelescopeBorder = { fg = colors.green1, bg = colors.green1 },
      TelescopeBorder = { fg = colors.green1, bg = colors.bg },
      -- TelescopePromptBorder = { fg = colors.comment, },
      TelescopePromptBorder = { fg = colors.bg, },
      -- TelescopeResultsBorder = { fg = colors.comment, },
      TelescopeResultsBorder = { fg = colors.bg, },
      -- TelescopePreviewBorder = { fg = colors.comment, },
      TelescopeResultsTitle = { fg = colors.pink },
      TelescopePreviewBorder = { fg = colors.bg, },
      -- TelescopeSelection = { fg = "#ffffff", bg = colors.cursor, }, --my default
      TelescopeSelection = { bg = colors.cursor }, -- my new default
      -- TelescopeSelection = { fg = colors.white, bg = colors.selection, },
      -- TelescopeSelection = { fg = colors.white, bg = "" },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
      -- TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      -- TelescopeNormal = { fg = colors.fg, bg = colors.charcoal, },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      TelescopeMatching = { fg = colors.green, },
      TelescopePromptTitle = { fg = colors.pink },
      TelescopePreviewTitle = { fg = colors.pink },
      TelescopePreviewNormal = { bg = colors.bg },
      -- TelescopeSelectionCaret = { fg = colors.green },
      -- TelescopeSelectionCaret = { fg = colors.purple },
      -- TelescopeSelectionCaret = { fg = "#FFCB8B", }, -- nightfly briight_yellow -- my default
      -- TelescopeSelectionCaret = { fg = "#191C24", bg = "#FFCB8B" }, -- nightfly bright_yellow -- my default with mods
      -- TelescopeSelectionCaret = { fg = "#191C24", bg = "#82AAFF" }, -- nightfly blue -- my default with more mods
      -- TelescopeSelectionCaret = { fg = "#191C24", bg = colors.bright_yellow },
      -- TelescopeSelectionCaret = { fg = "#000000", bg = colors.bright_yellow }, 
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = colors.bright_yellow }, -- my current preferred default
      TelescopeSelectionCaret = { fg = colors.pink, bg = colors.cursor }, -- my new default to match fzf-lua & fzf pointer
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = "#5E97EC" }, 
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = "#08FF83" }, --spring green bg
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = "#DFBD9A" }, -- yellowish gold
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = "#7fdbca" }, -- bright cyan
      -- TelescopeSelectionCaret = { fg = colors.cursor, bg = "#ae81ff" }, -- bright purple
      -- TelescopeSelectionCaret = { fg = "#191C24", bg = "#B5E8E0" },
      TelescopePromptNormal = { fg = colors.green },
      TelescopePromptPrefix = { fg = colors.green, },
      -- TelescopeResultsNormal = { bg = colors.bg, fg = "#adada9" }, -- lighter white
      -- TelescopeResultsNormal = { bg = colors.bg, fg = "#c6c6c1" }, -- light white
      TelescopeResultsNormal = { bg = colors.bg },
      TelescopeResultsDiffDelete = { fg = colors.red },
      TelescopeResultsDiffChange = { fg = colors.cyan },
      TelescopeResultsDiffAdd = { fg = colors.green },

      -- to ref if have any more colors to update
      -- TelescopeMatching = { fg = ss.diagnostics.hint },
      -- TelescopeSelection = { fg = ss.diagnostics.hint, bg = ss.bg.cursorline },

      -- TelescopePromptTitle = { fg = ss.bg.floating, bg = ss.syntax.keyword, bold = true },
      -- TelescopePromptPrefix = { fg = ss.diagnostics.hint },
      -- TelescopePromptCounter = { fg = ss.diagnostics.hint },
      -- TelescopePromptNormal = { bg = ss.bg.cursorline },
      -- TelescopePromptBorder = { fg = ss.bg.cursorline, bg = ss.bg.cursorline },

      -- TelescopeResultsTitle = { fg = ss.bg.floating, bg = ss.bg.floating, bold = true },
      -- TelescopeResultsNormal = { bg = ss.bg.floating },
      -- TelescopeResultsBorder = { fg = ss.bg.floating, bg = ss.bg.floating },

      -- TelescopePreviewTitle = { fg = ss.bg.floating, bg = ss.syntax.string, bold = true },
      -- TelescopePreviewNormal = { bg = ss.bg.floating },
      -- TelescopePreviewBorder = { fg = ss.bg.floating, bg = ss.bg.floating },

      -- NvimTree
      -- NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NvimTreeNormal = { fg = colors.fg, bg = colors.bg, },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
      NvimTreeRootFolder = { fg = colors.fg, bold = true, },
      -- NvimTreeGitDirty = { fg = colors.yellow, },
      -- NvimTreeGitDirty = { fg = colors.red, },
      -- NvimTreeGitDirty = { fg = "#E9BB82", }, -- light yellow
      -- NvimTreeGitDirty = { fg = "#AB76ED", }, -- purple
      NvimTreeGitDirty = { fg = "#F78C6C", }, -- orange -- my default
      -- NvimTreeGitNew = { fg = colors.bright_green, },
      NvimTreeGitNew = { fg = "#FFCB8B" }, -- nightfly dark_yellow
      -- NvimTreeGitNew = { fg = "#69FF94", }, -- git signs green
      -- NvimTreeGitNew = { fg = "#54FF08" }, -- bright green
      NvimTreeImageFile = { fg = colors.pink, },
      -- NvimTreeFolderIcon = { fg = colors.purple, },
      -- NvimTreeFolderIcon = { fg = "#42A5F5", },
      NvimTreeFolderIcon = { fg = "#77D3FE", }, -- my default
      NvimTreeIndentMarker = { fg = colors.nontext, },
      NvimTreeEmptyFolderName = { fg = colors.comment, },
      NvimTreeFolderName = { fg = colors.fg, },
      NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
      NvimTreeOpenedFolderName = { fg = colors.fg, },
      NvimTreeCursorLine = { bg = colors.selection, },
      NvimTreeIn = { bg = colors.selection, },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu, },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_magenta },
      NeoTreeGitModified = { fg = colors.bright_magenta },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      -- BufferLineIndicatorSelected = { fg = colors.green, },
      -- BufferLineIndicatorSelected = { fg = colors.neonGreen, },
      -- BufferLineIndicatorSelected = { fg = colors.neonTurquoise, }, -- default
      BufferLineIndicatorSelected = { fg = colors.neonTurquoise, bg = "#293a59" },
      -- BufferLineFill = { bg = colors.black, },
      -- BufferLineFill = { bg = colors.bg, }, -- default
      BufferLineFill = { bg = "NONE", },
      -- BufferLineFill = { bg = colors.bg, fg = '#bec0d3', },
      -- BufferLineBufferSelected = { bg = colors.bg, },

      -- LSP
      DiagnosticError = { fg = colors.red, },
      DiagnosticWarn = { fg = colors.yellow, },
      -- DiagnosticInfo = { fg = colors.cyan, }, -- theme deafult
      -- DiagnosticInfo = { fg = colors.green13, }, -- my default
      -- DiagnosticInfo = { fg = "#89E051", }, -- my new default
      -- DiagnosticInfo = { fg = "#8EC076", },
      DiagnosticInfo = { fg = "#5EF1FF" },
      -- DiagnosticInfo = { fg = "#BAE38E", },
      -- DiagnosticInfo = { fg = "#18C874", }, -- experimental
      DiagnosticHint = { fg = colors.cyan, },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
      -- DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, }, -- default
      DiagnosticUnderlineInfo = { undercurl = true, sp = "#89E051", }, -- my new default
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
      DiagnosticSignError = { fg = colors.red, },
      DiagnosticSignWarn = { fg = colors.yellow, },
      -- DiagnosticSignInfo = { fg = colors.cyan, }, -- theme default
      -- DiagnosticSignInfo = { fg = colors.green13, }, -- my default
      DiagnosticSignInfo = { fg = "#89E051", }, -- my new default
      DiagnosticSignHint = { fg = colors.cyan, },
      DiagnosticFloatingError = { fg = colors.red, },
      DiagnosticFloatingWarn = { fg = colors.yellow, },
      -- DiagnosticFloatingInfo = { fg = colors.cyan, }, -- theme default
      -- DiagnosticFloatingInfo = { fg = colors.green13, }, -- my default
      DiagnosticFloatingInfo = { fg = "#89E051", }, -- my new default
      DiagnosticFloatingHint = { fg = colors.cyan, },
      DiagnosticVirtualTextError = { fg = colors.red, },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, },
      -- DiagnosticVirtualTextInfo = { fg = colors.cyan, }, -- theme default
      -- DiagnosticVirtualTextInfo = { fg = colors.green13, }, -- my default
      DiagnosticVirtualTextInfo = { fg = "#89E051", }, -- my new default
      DiagnosticVirtualTextHint = { fg = colors.cyan, },
      -- with BG
      -- DiagnosticVirtualTextError = { fg = colors.red, bg = "#57100F" },
      -- DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = "#332700" },
      -- DiagnosticVirtualTextInfo = { fg = colors.green13, bg = "#2B3300" },
      -- DiagnosticVirtualTextHint = { fg = colors.cyan, bg = "#113B3D" },

      LspDiagnosticsDefaultError = { fg = colors.red, },
      LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
      LspDiagnosticsDefaultHint = { fg = colors.cyan, },
      LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
      LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
      LspReferenceText = { fg = colors.orange, },
      LspReferenceRead = { fg = colors.orange, },
      LspReferenceWrite = { fg = colors.orange, },
      LspCodeLens = { fg = colors.cyan, },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg, },
      LspFloatWinBorder = { fg = colors.comment, },
      LspSagaHoverBorder = { fg = colors.comment, },
      LspSagaSignatureHelpBorder = { fg = colors.comment, },
      LspSagaCodeActionBorder = { fg = colors.comment, },
      LspSagaDefPreviewBorder = { fg = colors.comment, },
      LspLinesDiagBorder = { fg = colors.comment, },
      LspSagaRenameBorder = { fg = colors.comment, },
      LspSagaBorderTitle = { fg = colors.menu, },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
      LspSagaDiagnosticBorder = { fg = colors.comment, },
      LspSagaShTruncateLine = { fg = colors.comment, },
      LspSagaDocTruncateLine = { fg = colors.comment, },
      LspSagaLspFinderBorder = { fg = colors.comment, },

      -- IndentBlankLine
--       IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true, },
      IndentBlanklineContextChar = { fg = colors.purple, nocombine = true, },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.menu, },
      CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.menu, },

      -- barbar
      BufferVisibleTarget = { fg = colors.red },
      BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
      BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
      BufferCurrentSign = { fg = colors.purple },
      BufferCurrentTarget = { fg = colors.red },
      BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
      BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = true },
      BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveTarget = { fg = colors.red, bg = colors.black, bold = true },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemKind = { link = "Pmenu" },
      CmpItemAbbr = { link = "Pmenu" },
      -- CmpItemKindMethod = { link = "@method" },
      -- CmpItemKindText = { link = "@text" },
      CmpItemKindMethod = { link = "@function.method" },
      CmpItemKindText = { link = "@markup" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      -- CmpItemKindModule = { link = "@namespace" },
      CmpItemKindModule = { link = "@module" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      -- CmpItemKindReference = { link = "@parameter.reference" },
      -- CmpItemKindUnit = { link = "@field" },
      -- CmpItemKindValue = { link = "@field" },
      -- CmpItemKindField = { link = "@field" },
      -- CmpItemKindEnum = { link = "@field" },
      CmpItemKindReference = { link = "@variable.parameter.reference" },
      CmpItemKindUnit = { link = "@variable.member" },
      CmpItemKindValue = { link = "@variable.member" },
      CmpItemKindField = { link = "@variable.member" },
      CmpItemKindEnum = { link = "@variable.member" },
      CmpItemKindKeyword = { link = "@keyword" },
      -- CmpItemKindSnippet = { link = "@text" },
      CmpItemKindSnippet = { link = "@markup" },
      CmpItemKindColor = { link = "DevIconCss" },
      -- CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFile = { fg = "#E3D18A" },
      -- CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindFolder = { fg = "#E3D18A" },
      CmpItemKindEvent = { link = "@constant" },
      -- CmpItemKindEnumMember = { link = "@field" },
      CmpItemKindEnumMember = { link = "@variable.member" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      -- CmpItemKindTypeParameter = { link = "@parameter" },
      CmpItemKindTypeParameter = { link = "@variable.parameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = 'gray' },
      NavicSeparator = { fg = 'gray' },


      -- TS rainbow colors
      -- rainbowcol1 = { fg = colors.red, },
      -- rainbowcol2 = { fg = colors.green, },
      -- rainbowcol3 = { fg = colors.yellow, },
      -- rainbowcol4 = { fg = colors.purple, },
      -- rainbowcol5 = { fg = colors.pink, },
      -- rainbowcol6 = { fg = colors.cyan, },
      -- rainbowcol7 = { fg = colors.white, },
      rainbowcol1 = { fg = "#5caeef", },
      rainbowcol2 = { fg = "#dfb976", },
      rainbowcol3 = { fg = "#c172d9" },
      rainbowcol4 = { fg = "#4fb1bc", },
      rainbowcol5 = { fg = "#97c26c", },
      rainbowcol6 = { fg = "#98C379", },
      rainbowcol7 = { fg = "#db6165", },
   }
end

return {
   setup = setup,
}

