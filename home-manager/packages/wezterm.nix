{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    package = pkgs.stable.wezterm;
    extraConfig = ''
                  -- Pull in the wezterm API
            local wezterm = require("wezterm")

            -- This will hold the configuration.
            local config = wezterm.config_builder()
            -- This is where you actually apply your config choices
            config.font = wezterm.font("MesloLGS Nerd Font")
            config.font_size = 12
            local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
            custom.tab_bar.active_tab.bg_color = "#89b4fa"
            config.color_schemes = {
            	["OLEDppuccin"] = custom,
            }
            config.color_scheme = "OLEDppuccin"
            config.enable_tab_bar = true
            config.tab_bar_at_bottom = true
            config.use_fancy_tab_bar = false
            -- Don't let any individual tab name take too much room
            config.tab_max_width = 32

            -- Switch to the last active tab when I close a tab
            config.switch_to_last_active_tab_when_closing_tab = true
            config.window_decorations = "RESIZE"
            config.pane_focus_follows_mouse = true
            config.scrollback_lines = 5000
            -- I don't really have need for padding between panes
            config.window_padding = {
            	left = 0,
            	right = 0,
            	top = 0,
            	bottom = 0,
            }
            config.unix_domains = {
            	{
            		name = "unix",
            	},
            }
            config.leader = {
            	key = "a",
            	mods = "CTRL",
            	timeout_milliseconds = 2000,
            }
            config.keys = {
            	{
            		key = "[",
            		mods = "LEADER",
            		action = wezterm.action.ActivateCopyMode,
            	},
            	{
            		key = "f",
            		mods = "ALT",
            		action = wezterm.action.TogglePaneZoomState,
            	},
            	{
            		key = "c",
            		mods = "LEADER",
            		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
            	},
            	{
            		key = "n",
            		mods = "LEADER",
            		action = wezterm.action.ActivateTabRelative(1),
            	},
            	{
            		key = "p",
            		mods = "LEADER",
            		action = wezterm.action.ActivateTabRelative(-1),
            	},
            	{
            		key = ",",
            		mods = "LEADER",
            		action = wezterm.action.PromptInputLine({
            			description = "Enter new name for tab",
            			action = wezterm.action_callback(function(window, pane, line)
            				if line then
            					window:active_tab():set_title(line)
            				end
            			end),
            		}),
            	},
            	{
            		key = "w",
            		mods = "LEADER",
            		action = wezterm.action.ShowTabNavigator,
            	},
            	{
            		key = "&",
            		mods = "LEADER|SHIFT",
            		action = wezterm.action.CloseCurrentTab({ confirm = true }),
            	},
            	-- Vertical split
            	{
            		-- |
            		key = "|",
            		mods = "LEADER|SHIFT",
            		action = wezterm.action.SplitPane({
            			direction = "Right",
            			size = { Percent = 50 },
            		}),
            	},
            	-- Horizontal split
            	{
            		-- -
            		key = "-",
            		mods = "LEADER",
            		action = wezterm.action.SplitPane({
            			direction = "Down",
            			size = { Percent = 50 },
            		}),
            	},
            	-- CTRL + (h,j,k,l) to move between panes
            	{
            		key = "h",
            		mods = "CTRL|ALT",
            		action = wezterm.action({ ActivatePaneDirection = "Left" }),
            	},
            	{
            		key = "j",
            		mods = "CTRL|ALT",
            		action = wezterm.action({ ActivatePaneDirection = "Down" }),
            	},
            	{
            		key = "k",
            		mods = "CTRL|ALT",
            		action = wezterm.action({ ActivatePaneDirection = "Up" }),
            	},
            	{
            		key = "l",
            		mods = "CTRL|ALT",
            		action = wezterm.action({ ActivatePaneDirection = "Right" }),
            	},
            	-- ALT + (h,j,k,l) to resize panes
            	{
            		key = "h",
            		mods = "ALT",
            		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
            	},
            	{
            		key = "j",
            		mods = "ALT",
            		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
            	},
            	{
            		key = "k",
            		mods = "ALT",
            		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
            	},
            	{
            		key = "l",
            		mods = "ALT",
            		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
            	},
            	{
            		-- |
            		key = "{",
            		mods = "LEADER|SHIFT",
            		action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
            	},
            	{
            		key = ";",
            		mods = "LEADER",
            		action = wezterm.action.ActivatePaneDirection("Prev"),
            	},
            	{
            		key = "o",
            		mods = "LEADER",
            		action = wezterm.action.ActivatePaneDirection("Next"),
            	},
            	-- Attach to muxer
            	{
            		key = "a",
            		mods = "LEADER",
            		action = wezterm.action.AttachDomain("unix"),
            	},

            	-- Detach from muxer
            	{
            		key = "d",
            		mods = "LEADER",
            		action = wezterm.action.DetachDomain({ DomainName = "unix" }),
            	},
            	-- Rename current session; analagous to command in tmux
            	{
            		key = "$",
            		mods = "LEADER|SHIFT",
            		action = wezterm.action.PromptInputLine({
            			description = "Enter new name for session",
            			action = wezterm.action_callback(function(window, pane, line)
            				if line then
            					wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
            				end
            			end),
            		}),
            	},
            	-- Show list of workspaces
            	{
            		key = "s",
            		mods = "LEADER",
            		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
            	},
            }
            -- and finally, return the configuration to wezterm
            return config

    '';
  };
}
