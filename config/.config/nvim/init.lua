--  _   _ _____ _____     _____ __  __ 
-- | \ | | ____/ _ \ \   / /_ _|  \/  |
-- |  \| |  _|| | | \ \ / / | || |\/| |
-- | |\  | |__| |_| |\ V /  | || |  | |
-- |_| \_|_____\___/  \_/  |___|_|  |_|
--

-- Enable termguicolors early
vim.o.termguicolors = true;

-- Bootstrap packer.nvim to install/manage plugins.
require("bootstrap-packer")

-- Initialize the plugins themselves.
require("plugins")

-- Load configs for plugins
require("config")

-- Load all the miscellaneous settings
require("settings")

-- Load keybindings
require("keybinds")
