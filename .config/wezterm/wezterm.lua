-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = {}
config.color_scheme = 'Horizon Dark (base16)'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 23
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.window_decorations = "NONE"
config.macos_window_background_blur = 10
config.initial_cols = 100
config.initial_rows = 27

wezterm.on('gui-startup', function(cmd) -- set startup Window position
  local tab, pane, window = mux.spawn_window(cmd or
    {position={x=23,y=170}}
  )
end)

return config
