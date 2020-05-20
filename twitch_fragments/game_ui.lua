twitch_display_lines = {}
gui = gui or GuiCreate()
xpos = xpos or 1
ypos = ypos or 12
randomOnNoVotes = true
math.randomseed(os.time())

function draw_twitch_display()
  GuiStartFrame( gui )
  local player = get_player()
  if player ~=nil then
    local inven_gui = EntityGetFirstComponent(player, "InventoryGuiComponent")
    if inven_gui ~= nil then
      local is_open = ComponentGetValue(inven_gui, "mActive")

      if is_open == "1" then
          GuiLayoutBeginHorizontal( gui, xpos, 97 )
        else
          GuiLayoutBeginVertical( gui, xpos, ypos )
      end
    end
    
    for idx, line in ipairs(twitch_display_lines) do
      GuiText(gui, 0, 0, line)
    end
    GuiLayoutEnd( gui )
  end
end

function set_countdown(timeleft)
  twitch_display_lines = {"Next vote: " .. timeleft .. "s"}
end

function clear_display()
  twitch_display_lines = {}
end

function update_outcome_display(choices,vote_time_left)
  clear_display()
  twitch_display_lines = {"Voting ends: " .. vote_time_left .. "s, "}
  for idx, outcome in ipairs(choices) do
    table.insert(twitch_display_lines, outcome)
  end
end

add_persistent_func("twitch_gui", draw_twitch_display)
