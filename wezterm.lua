local Config = require('config')
local wezterm = require('wezterm')

require('utils.backdrops')
   :set_images()
   :random()

require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })
require('events.new-tab-button').setup()

local function send_keys(window)
  -- Send Alt + t
  window:perform_action(wezterm.action.SendKey { key = 't', mods = 'ALT' }, window:active_pane())
  -- Send Alt + Left Arrow
  window:perform_action(wezterm.action.SendKey { key = 'LeftArrow', mods = 'ALT' }, window:active_pane())
  -- Send Alt + w
  window:perform_action(wezterm.action.SendKey { key = 'w', mods = 'ALT' }, window:active_pane())
end

wezterm.on('window-created', function(window, pane)
  -- Delay the execution to ensure the terminal is ready to receive input
  wezterm.sleep_ms(100)  -- Adjust the delay if needed
  send_keys(window)
end)

return Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.tabline'))
   :append(require('config.launch')).options
