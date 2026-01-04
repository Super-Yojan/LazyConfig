return {
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
    },
  },

  -- You also need this to install the lua magick binding automatically
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks must be loaded first
    config = true,
  },
}
