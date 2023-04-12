local status_ok, killersheep = pcall(require, "killersheep")
if not status_ok then
  return
end

killersheep.setup {
  gore = true,           -- Enables/disables blood and gore.
  keymaps = {
    move_left = "h",     -- Keymap to move cannon to the left.
    move_right = "l",    -- Keymap to move cannon to the right.
    shoot = "<Space>",   -- Keymap to shoot the cannon.
  },
}
-- :KillKillKill 
-- esc to exit
