-- Function to open URL based on ticket number under cursor
function OpenTicket()
  -- Get the word under the cursor
  local word = vim.fn.expand("<cWORD>")

  -- Remove surrounding brackets if they exist
  word = word:gsub("[%[%]]", "")

  -- Check if the word matches the TECH-12345 pattern
  if word:match("^TECH%-%d+$") then
    -- Format the URL with the ticket number
    local url = string.format('https://alyrica.atlassian.net/browse/%s', word)

    -- Open the URL using the appropriate command for your OS
    vim.fn.jobstart({"xdg-open", url}, {detach = true}) -- For Linux
    -- vim.fn.jobstart({"open", url}, {detach = true}) -- For macOS
  else
    print("No ticket number under cursor")
  end
end
-- Map <F3> to call OpenTicket function
vim.api.nvim_set_keymap("n", "<F3>", ":lua OpenTicket()<CR>", { noremap = true, silent = true })
