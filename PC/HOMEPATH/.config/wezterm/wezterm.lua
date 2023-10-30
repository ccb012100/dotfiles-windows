local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_cols = 120
config.initial_rows = 60

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}

config.window_frame = {                 -- TODO: reduce font size on command palette
  font = wezterm.font('IBM Plex Sans'), -- Proportional font
}

-- place window management buttons (minimize, maximize, close) into the tab bar instead of showing a title bar
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.font = wezterm.font {
  family = 'JetBrains Mono',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 11.0
config.pane_select_font_size = 36 -- default = 36
config.color_scheme = 'PhD (base16)'

-- see: <https://github.com/wez/wezterm/issues/2623>
config.key_map_preference = 'Physical'

--
-- Keybindings
--

-- TODO: move keybindings to separate config file

config.use_dead_keys = false
config.disable_default_key_bindings = true

config.quick_select_alphabet = 'asdfjkl;zxcvm,./weruiop'

local keycode = {
  none = 'NONE', -- unmap
  ctrl = 'CTRL',
  ctrl_shift = 'SHIFT|CTRL',
  shift = 'SHIFT',
  space = 'phys:Space',
  -- leader
  leader = 'LEADER',
  leader_ctrl = 'LEADER|CTRL',
  leader_ctrlshift = 'LEADER|SHIFT|CTRL',
  leader_shift = 'LEADER|SHIFT',
}

-- LEADER key is Ctrl-m
config.leader = { key = 'j', mods = keycode.ctrl }

config.keys = {
  -- Launcher
  {
    key = 'Enter',
    mods = keycode.ctrl,
    action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' }
  },
  -- Command Palette
  { key = keycode.space, mods = keycode.ctrl,             action = act.ActivateCommandPalette },
  { key = keycode.space, mods = keycode.shift,            action = act.ActivateCommandPalette },
  -- Function keys
  { key = 'F5',          mods = keycode.leader,           action = act.ReloadConfiguration },
  { key = 'F11',         mods = keycode.leader,           action = act.ToggleFullScreen },
  -- New window
  { key = 'n',           mods = keycode.leader,           action = act.SpawnWindow },
  { key = 'n',           mods = keycode.ctrl_shift,       action = act.SpawnWindow },
  -- Close tab/pane
  { key = 'q',           mods = keycode.leader,           action = act.CloseCurrentTab { confirm = true } },
  { key = 'q',           mods = keycode.ctrl_shift,       action = act.CloseCurrentTab { confirm = true } },
  { key = 'w',           mods = keycode.leader,           action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'w',           mods = keycode.ctrl_shift,       action = wezterm.action.CloseCurrentPane { confirm = true } },
  -- Move/Activate Tab
  { key = 'Tab',         mods = keycode.ctrl_shift,       action = act.ActivateTabRelative(-1) },
  { key = 'Tab',         mods = keycode.ctrl,             action = act.ActivateTabRelative(1) },
  { key = 'Tab',         mods = keycode.leader,           action = act.MoveTabRelative(-1) },
  { key = 'Tab',         mods = keycode.leader,           action = act.MoveTabRelative(1) },
  -- Move/select panes
  -- TODO: use new modes when they move out of nightly builds: "MoveToNewTab", "MoveToNewWindow"
  { key = 'j',           mods = keycode.leader,           action = act.PaneSelect },
  -- :: activate next Pane mode with <leader>,<leader>
  { key = 'j',           mods = keycode.leader_ctrl,      action = act.ActivatePaneDirection 'Next' },
  { key = 'j',           mods = keycode.leader_ctrlshift, action = act.ActivatePaneDirection 'Prev' },
  -- TODO: switch to SwapWithActiveKeepFocus when it moves out of nightly builds
  -- :: swap the active and selected panes
  { key = 'm',           mods = keycode.leader,           action = act.PaneSelect { mode = 'SwapWithActive', } },
  { key = ',',           mods = keycode.leader,           action = act.RotatePanes 'CounterClockwise', },
  { key = '.',           mods = keycode.leader,           action = act.RotatePanes 'Clockwise' },
  -- Adjust pane size
  { key = 'DownArrow',   mods = keycode.leader,           action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'DownArrow',   mods = keycode.ctrl_shift,       action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'LeftArrow',   mods = keycode.leader,           action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'LeftArrow',   mods = keycode.ctrl_shift,       action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow',  mods = keycode.leader,           action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'RightArrow',  mods = keycode.ctrl_shift,       action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'UpArrow',     mods = keycode.leader,           action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'UpArrow',     mods = keycode.ctrl_shift,       action = act.AdjustPaneSize { 'Up', 1 } },
  -- Zoom pane
  { key = 'z',           mods = keycode.leader,           action = act.TogglePaneZoomState },
  { key = 'z',           mods = keycode.ctrl_shift,       action = act.TogglePaneZoomState },
  -- Font size
  { key = '-',           mods = keycode.leader,           action = act.DecreaseFontSize },
  { key = '+',           mods = keycode.leader,           action = act.IncreaseFontSize },
  { key = ";",           mods = keycode.leader,           action = act.QuickSelect },
  { key = '=',           mods = keycode.leader,           action = act.ResetFontSize },
  -- Scrollback
  { key = 'PageDown',    mods = keycode.leader,           action = act.ScrollByPage(1) },
  { key = 'PageDown',    mods = keycode.ctrl_shift,       action = act.ScrollByPage(1) },
  { key = 'PageUp',      mods = keycode.leader,           action = act.ScrollByPage(-1) },
  { key = 'PageUp',      mods = keycode.ctrl_shift,       action = act.ScrollByPage(-1) },
  { key = 'u',           mods = keycode.leader,           action = act.ClearScrollback 'ScrollbackOnly' },
  -- Copy/paste/select
  { key = 'c',           mods = keycode.leader,           action = act.ActivateCopyMode },
  { key = 'c',           mods = keycode.ctrl_shift,       action = act.CopyTo 'Clipboard' },
  { key = 'v',           mods = keycode.ctrl_shift,       action = act.PasteFrom 'Clipboard' },
  { key = 'Copy',        mods = keycode.none,             action = act.CopyTo 'Clipboard' },
  { key = 'Insert',      mods = keycode.ctrl,             action = act.CopyTo 'PrimarySelection' },
  { key = 'Insert',      mods = keycode.shift,            action = act.PasteFrom 'PrimarySelection' },
  { key = 'Paste',       mods = keycode.none,             action = act.PasteFrom 'Clipboard' },
  -- Search
  { key = 'f',           mods = keycode.leader,           action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f',           mods = keycode.ctrl_shift,       action = act.Search 'CurrentSelectionOrEmptyString' },
  -- Debug overlay
  { key = 'l',           mods = keycode.leader_shift,     action = act.ShowDebugOverlay },
}

config.key_tables = {
  -- Copy mode
  copy_mode = {
    { key = 'Tab',    mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab',    mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter',  mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 'Space',  mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = '$',      mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$',      mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',',      mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
    { key = '0',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';',      mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
    { key = 'F',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'F',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'G',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G',      mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O',      mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O',      mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'T',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'V',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V',      mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '^',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^',      mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b',      mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',      mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',      mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = 'c',      mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'd',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = 'e',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = 'f',      mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'f',      mods = 'CTRL',  action = act.CopyMode 'PageDown' },
    { key = 'g',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g',      mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'h',      mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j',      mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k',      mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l',      mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'm',      mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o',      mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q',      mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 't',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = 'u',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = 'v',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v',      mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'w',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    {
      key = 'y',
      mods = 'NONE',
      action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, {
        CopyMode
        = 'Close'
      } }
    },
    { key = 'PageUp',     mods = 'NONE', action = act.CopyMode 'PageUp' },
    { key = 'PageDown',   mods = 'NONE', action = act.CopyMode 'PageDown' },
    { key = 'End',        mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home',       mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow',  mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow',  mods = 'ALT',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow',    mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow',  mods = 'NONE', action = act.CopyMode 'MoveDown' },
  },
  -- Search mode
  search_mode = {
    { key = 'Enter',     mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'Escape',    mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n',         mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p',         mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
    { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  },

}

-- Windows-specific config
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local spawn_gitbash = { label = "Git Bash", args = { "C:/Program Files/Git/bin/bash.exe ", "-i", "-l" } }
  local spawn_wsl = { label = "WSL - Ubuntu", args = { "wsl.exe" }, cwd = "//wsl.localhost/Ubuntu/home/ccb" }
  local spawn_cmdexe = { label = "cmd.exe", args = { "cmd.exe", "/k", "config.cmd" } }
  local spawn_pwsh = { label = 'PowerShell', args = { "C:/Program Files/PowerShell/7/pwsh.exe" } }

  config.launch_menu = { spawn_gitbash, spawn_wsl, spawn_cmdexe, spawn_pwsh }

  -- set Git Bash as default
  config.default_prog = spawn_gitbash.args

  config.skip_close_confirmation_for_processes_named = {
    "bash",
    "cmd.exe",
    "fish",
    "powershell.exe",
    "pwsh.exe",
    "sh",
    "zsh",
  }

  -- causes issues with key remappers like kmonad and kanata
  -- :: see: <https://github.com/jtroo/kanata/issues/437> and <https://github.com/wez/wezterm/issues/3934>
  config.allow_win32_input_mode = false

  -- Keybindings for spawning new tabs/panes
  --:   Ctrl+Shift+<NUM> -> splits vertically   (spawns new pane underneath)
  --:   leader, <NUM>    -> splits horizontally (spawns new pane to the right)

  --:: 1  ->  GitBash
  table.insert(config.keys,
    { key = '1', mods = keycode.ctrl_shift, action = act.SplitVertical { args = spawn_gitbash.args } })
  table.insert(config.keys,
    { key = '1', mods = keycode.leader, action = act.SplitHorizontal { args = spawn_gitbash.args } })
  --:: 2  ->  WSL
  table.insert(config.keys,
    { key = '2', mods = keycode.ctrl_shift, action = act.SplitVertical { args = spawn_wsl.args, cwd = spawn_wsl.cwd } })
  table.insert(config.keys,
    { key = '2', mods = keycode.leader, action = act.SplitHorizontal { args = spawn_wsl.args, cwd = spawn_wsl.cwd } })
  --:: 3  ->  CMD.exe
  table.insert(config.keys,
    { key = '3', mods = keycode.ctrl_shift, action = act.SplitVertical { args = spawn_cmdexe.args } })
  table.insert(config.keys,
    { key = '3', mods = keycode.leader, action = act.SplitHorizontal { args = spawn_cmdexe.args } })
end

return config
