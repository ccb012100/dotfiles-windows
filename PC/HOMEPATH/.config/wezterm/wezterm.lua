local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Banana Blueberry'

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local launch_menu = {}

  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in
  ipairs(
    wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
  )
  do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(launch_menu, {
      label = 'x64 Native Tools VS ' .. year,
      args = {
        'cmd.exe',
        '/k',
        'C:/Program Files (x86)/'
        .. vsvers
        .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
      },
    })
  end

  config.launch_menu = launch_menu
end

-- and finally, return the configuration to wezterm
return config
