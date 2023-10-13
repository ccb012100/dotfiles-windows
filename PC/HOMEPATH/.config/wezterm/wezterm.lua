local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Windows-specific config
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local gitbash = { "C:/Program Files/Git/bin/bash.exe ", "-i", "-l" }

  -- set Git Bash as default
  config.default_prog = gitbash

  config.launch_menu = {
    { label = "Git Bash",   args = gitbash },
    {
      label = "WSL - Ubuntu",
      args = { "wsl.exe" },
      cwd = "//wsl.localhost/Ubuntu/home/ccb012100"
    },
    { label = "cmd.exe",    args = { "cmd.exe", "/k", "config.cmd" } },
    { label = 'PowerShell', args = { "C:/Program Files/PowerShell/7/pwsh.exe" } }
  }

  config.skip_close_confirmation_for_processes_named = {
    "bash",
    "sh",
    "zsh",
    "fish",
    "cmd.exe",
    "pwsh.exe",
    "powershell.exe",
  }
end

config.color_scheme = 'Pandora'

config.initial_cols = 120
config.initial_rows = 60

config.window_frame = {
  font = wezterm.font("IBM Plex Sans"), -- Proportional font
  -- TODO: reduce font size on command palette
}

-- place window management buttons (minimize, maximize, close) into the tab bar instead of showing a title bar
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.font = wezterm.font {
  family = 'JetBrains Mono',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}

config.font_size = 11.0

-- TODO: move keybindings to separate config file
-- keybindings
config.use_dead_keys = false
config.disable_default_key_bindings = true

local keycode = {
  ctrl = 'CTRL',
  leader = 'LEADER',
  leader_ctrl = 'LEADER|CTRL',
  leader_shift = 'LEADER|SHIFT',
  none = 'NONE',
  shift = 'SHIFT',
  shift_ctrl = 'SHIFT|CTRL',
  space = 'phys:Space'
}

config.leader = { key = 'm', mods = keycode.ctrl }

-- TODO: shortcuts to swap layout
-- TODO: shortcuts to detach tab / attach window
-- TODO: shortcuts to open Ubuntu
config.keys = {
  { key = keycode.space, mods = keycode.ctrl,        action = act.ActivateCommandPalette },
  { key = keycode.space, mods = keycode.shift,       action = act.ActivateCommandPalette },
  { key = '-',           mods = keycode.leader,      action = act.DecreaseFontSize },
  { key = '|',           mods = keycode.leader,      action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '+',           mods = keycode.leader,      action = act.IncreaseFontSize },
  { key = '=',           mods = keycode.leader_ctrl, action = act.ResetFontSize },
  { key = 'Copy',        mods = keycode.none,        action = act.CopyTo 'Clipboard' },
  { key = 'DownArrow',   mods = keycode.leader,      action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'DownArrow',   mods = keycode.shift_ctrl,  action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'Enter',       mods = keycode.leader,      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  {
    key = 'Enter',
    mods = keycode.ctrl,
    action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' }
  },
  { key = 'F11',        mods = keycode.leader,       action = act.ToggleFullScreen },
  { key = 'F5',         mods = keycode.leader,       action = act.ReloadConfiguration },
  { key = 'Insert',     mods = keycode.ctrl,         action = act.CopyTo 'PrimarySelection' },
  { key = 'Insert',     mods = keycode.shift,        action = act.PasteFrom 'PrimarySelection' },
  { key = 'LeftArrow',  mods = keycode.leader,       action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'LeftArrow',  mods = keycode.shift_ctrl,   action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'PageDown',   mods = keycode.leader_shift, action = act.ScrollByPage(1) },
  { key = 'PageUp',     mods = keycode.leader_shift, action = act.ScrollByPage(-1) },
  { key = 'Paste',      mods = keycode.none,         action = act.PasteFrom 'Clipboard' },
  { key = 'RightArrow', mods = keycode.leader,       action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'RightArrow', mods = keycode.shift_ctrl,   action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'UpArrow',    mods = keycode.leader,       action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'UpArrow',    mods = keycode.shift_ctrl,   action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'Tab',        mods = keycode.ctrl,         action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = keycode.shift_ctrl,   action = act.ActivateTabRelative(-1) },
  { key = 'c',          mods = keycode.leader,       action = act.ActivateCopyMode },
  { key = 'c',          mods = keycode.shift_ctrl,   action = act.CopyTo 'Clipboard' },
  { key = 'f',          mods = keycode.shift_ctrl,   action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f',          mods = keycode.shift_ctrl,   action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'i',          mods = keycode.leader,       action = act.ActivatePaneDirection 'Up' },
  { key = 'j',          mods = keycode.leader,       action = act.ActivatePaneDirection 'Left' },
  { key = 'k',          mods = keycode.leader,       action = act.ActivatePaneDirection 'Down' },
  { key = 'l',          mods = keycode.leader_shift, action = act.ShowDebugOverlay },
  { key = 'l',          mods = keycode.leader,       action = act.ActivatePaneDirection 'Right' },
  { key = 'n',          mods = keycode.shift_ctrl,   action = act.SpawnWindow },
  { key = 'p',          mods = keycode.shift_ctrl,   action = act.ActivateCommandPalette },
  { key = 's',          mods = keycode.leader,       action = act.QuickSelect },
  { key = 't',          mods = keycode.shift_ctrl,   action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't',          mods = keycode.shift_ctrl,   action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'u',          mods = keycode.leader,       action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'v',          mods = keycode.leader,       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'v',          mods = keycode.shift_ctrl,   action = act.PasteFrom 'Clipboard' },
  { key = 'w',          mods = keycode.shift_ctrl,   action = act.CloseCurrentTab { confirm = true } },
  { key = 'z',          mods = keycode.shift_ctrl,   action = act.TogglePaneZoomState },
}

config.key_tables = {
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

return config
