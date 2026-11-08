-- WezTerm config. Linked to ~/.wezterm.lua on macOS.
-- herdr owns panes and sessions, so this config has no leader key,
-- no ssh_domains and no unix_domains.

local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50

-- Dim unfocused windows so the focused one is obvious at a glance.
local UNFOCUSED_FOREGROUND_TEXT_HSB = { hue = 1.0, saturation = 0.25, brightness = 0.45 }
local UNFOCUSED_WINDOW_BACKGROUND_OPACITY = 0.62

-- get_config_overrides() returns a copy, so compare fields, not identity.
local function same_text_hsb(actual, expected)
  if actual == nil or expected == nil then
    return actual == expected
  end
  return actual.hue == expected.hue
    and actual.saturation == expected.saturation
    and actual.brightness == expected.brightness
end

wezterm.on("window-focus-changed", function(window)
  local overrides = window:get_config_overrides() or {}
  local text_hsb, opacity
  if not window:is_focused() then
    text_hsb = UNFOCUSED_FOREGROUND_TEXT_HSB
    opacity = UNFOCUSED_WINDOW_BACKGROUND_OPACITY
  end
  -- Write only on a real change: each set_config_overrides() reloads the config.
  if same_text_hsb(overrides.foreground_text_hsb, text_hsb) and overrides.window_background_opacity == opacity then
    return
  end
  overrides.foreground_text_hsb = text_hsb
  overrides.window_background_opacity = opacity
  window:set_config_overrides(overrides)
end)

-- Left Option sends Alt (Meta). Right Option composes characters.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

config.notification_handling = "SuppressFromFocusedWindow"

-- "desk" is an OpenSSH Host alias, defined outside this repo.
-- Use /usr/bin/ssh: WezTerm's built-in SSH client ignores CertificateFile and ControlMaster.
local DESK = "desk"
local herdr = wezterm.home_dir .. "/.local/share/mise/shims/herdr"

config.keys = {
  -- New tab attached to herdr on the remote host
  { key = "d", mods = "CMD|SHIFT",
    action = act.SpawnCommandInNewTab({ args = { herdr, "--remote", DESK, "--remote-keybindings", "server" } }) },
}

config.launch_menu = {
  { label = "herdr --remote " .. DESK, args = { herdr, "--remote", DESK, "--remote-keybindings", "server" } },
  { label = "herdr on " .. DESK .. " (ssh)", args = { "/usr/bin/ssh", "-t", DESK, "herdr" } },
}

return config
