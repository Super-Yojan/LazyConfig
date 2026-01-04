-- ~/.config/nvim/after/ftplugin/python.lua

local socket_path = "/tmp/manim_mpv_socket"

local function get_current_manim_class()
  local status, node = pcall(vim.treesitter.get_node)
  if not status or not node then
    return nil
  end
  while node do
    if node:type() == "class_definition" then
      local name_nodes = node:field("name")
      if name_nodes and name_nodes[1] then
        return vim.treesitter.get_node_text(name_nodes[1], 0)
      end
    end
    node = node:parent()
  end
  return nil
end

local function send_to_mpv(video_path)
  local uv = vim.loop
  local pipe = uv.new_pipe(false)
  pipe:connect(socket_path, function(err)
    if err then
      pipe:close()
      vim.schedule(function()
        vim.notify("⚠️ MPV closed. Restarting...", vim.log.levels.WARN)
        -- Added '--no-pause' to force playback on a fresh start
        vim.fn.jobstart(
          { "mpv", "--keep-open", "--no-pause", "--input-ipc-server=" .. socket_path, video_path },
          { detach = true }
        )
      end)
    else
      -- FIX: Send TWO commands separated by a newline (\n)
      -- 1. Load the new file
      -- 2. Force 'pause' to false (Play)
      local payload = string.format(
        '{ "command": ["loadfile", "%s", "replace"] }\n{ "command": ["set_property", "pause", false] }\n',
        video_path
      )
      pipe:write(payload)
      pipe:close()
      vim.schedule(function()
        vim.notify("🔄 Updated MPV View", vim.log.levels.INFO)
      end)
    end
  end)
end

local function render_scene()
  local class_name = get_current_manim_class()
  local file_name = vim.fn.expand("%")
  local video_name = file_name:gsub("%.py$", "")
  local video_path = string.format("media/videos/%s/480p15/%s.mp4", video_name, class_name)

  -- Table to capture error messages
  local stderr_chunks = {}

  if not class_name then
    vim.notify("❌ No Manim Class found! (Check Cursor)", vim.log.levels.ERROR)
    return
  end

  vim.cmd("write")
  vim.notify("🎬 Rendering " .. class_name .. "...", vim.log.levels.INFO)

  local cmd = string.format("uv run manim -ql %s %s", file_name, class_name)

  vim.fn.jobstart(cmd, {
    -- Capture output
    on_stderr = function(_, data, _)
      if data then
        for _, line in ipairs(data) do
          if line ~= "" then
            table.insert(stderr_chunks, line)
          end
        end
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        if vim.fn.filereadable(socket_path) == 0 then
          vim.notify("✅ Opening MPV", vim.log.levels.INFO)
          vim.fn.jobstart({ "mpv", "--keep-open", "--input-ipc-server=" .. socket_path, video_path }, { detach = true })
        else
          send_to_mpv(video_path)
        end
      else
        -- DISPLAY THE ERROR
        local error_msg = table.concat(stderr_chunks, "\n")
        vim.notify("🔥 Render Failed:\n" .. error_msg, vim.log.levels.ERROR)
      end
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

vim.keymap.set("n", "<leader>m", render_scene, { buffer = true, desc = "Manim Render" })
