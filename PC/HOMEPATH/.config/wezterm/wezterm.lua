local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Wombat'

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local launch_menu = {}

  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  config.launch_menu = launch_menu
end

-- keybindings
config.use_dead_keys = false
config.disable_default_key_bindings = true

config.leader = { key = 'Space', mods = 'SHIFT|CTRL' }

config.keys = {
  { key = '-',          mods = 'LEADER',       action = act.DecreaseFontSize },
  { key = '|',          mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '+',          mods = 'LEADER',       action = act.IncreaseFontSize },
  { key = '=',          mods = 'LEADER|CTRL',  action = act.ResetFontSize },
  { key = 'Copy',       mods = 'NONE',         action = act.CopyTo 'Clipboard' },
  { key = 'DownArrow',  mods = 'LEADER',       action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'DownArrow',  mods = 'SHIFT|CTRL',   action = act.ActivatePaneDirection 'Down' },
  { key = 'Enter',      mods = 'LEADER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'F11',        mods = 'LEADER',       action = act.ToggleFullScreen },
  { key = 'F5',         mods = 'LEADER',       action = act.ReloadConfiguration },
  { key = 'Insert',     mods = 'CTRL',         action = act.CopyTo 'PrimarySelection' },
  { key = 'Insert',     mods = 'SHIFT',        action = act.PasteFrom 'PrimarySelection' },
  { key = 'LeftArrow',  mods = 'CTRL|SHIFT',   action = act.ActivatePaneDirection 'Left' },
  { key = 'LeftArrow',  mods = 'LEADER',       action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'PageDown',   mods = 'LEADER|SHIFT', action = act.ScrollByPage(1) },
  { key = 'PageUp',     mods = 'LEADER|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'Paste',      mods = 'NONE',         action = act.PasteFrom 'Clipboard' },
  { key = 'phys:Space', mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'phys:Space', mods = 'SHIFT|CTRL',   action = act.QuickSelect },
  { key = 'RightArrow', mods = 'LEADER',       action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|CTRL',   action = act.ActivatePaneDirection 'Right' },
  { key = 'Space',      mods = 'CTRL',         action = act.ActivateCommandPalette },
  { key = 'UpArrow',    mods = 'LEADER',       action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'UpArrow',    mods = 'SHIFT|CTRL',   action = act.ActivatePaneDirection 'Up' },
  { key = 'Tab',        mods = 'CTRL',         action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = 'SHIFT|CTRL',   action = act.ActivateTabRelative(-1) },
  { key = 'c',          mods = 'LEADER',       action = act.ActivateCopyMode },
  { key = 'c',          mods = 'SHIFT|CTRL',   action = act.CopyTo 'Clipboard' },
  { key = 'f',          mods = 'CTRL|SHIFT',   action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f',          mods = 'SHIFT|CTRL',   action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'l',          mods = 'LEADER',       action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'l',          mods = 'LEADER|SHIFT', action = act.ShowDebugOverlay },
  { key = 'm',          mods = 'LEADER',       action = act.Hide },
  { key = 'm',          mods = 'SHIFT|CTRL',   action = act.Hide },
  { key = 'm',          mods = 'SUPER',        action = act.Hide },
  { key = 'n',          mods = 'SHIFT|CTRL',   action = act.SpawnWindow },
  { key = 'p',          mods = 'SHIFT|CTRL',   action = act.ActivateCommandPalette },
  { key = 't',          mods = 'SHIFT|CTRL',   action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't',          mods = 'SHIFT|CTRL',   action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'v',          mods = 'SHIFT|CTRL',   action = act.PasteFrom 'Clipboard' },
  { key = 'v',          mods = 'SHIFT|CTRL',   action = act.PasteFrom 'Clipboard' },
  { key = 'w',          mods = 'SHIFT|CTRL',   action = act.CloseCurrentTab { confirm = true } },
  { key = 'w',          mods = 'SHIFT|CTRL',   action = act.CloseCurrentTab { confirm = true } },
  { key = 'z',          mods = 'SHIFT|CTRL',   action = act.TogglePaneZoomState },
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
