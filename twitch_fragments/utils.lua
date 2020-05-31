async_loop(function()
    local gate = GlobalsGetValue("twitch_collapse_gate", "0")
	local wandmirage = GlobalsGetValue("twitch_mirage_wand", "0")
	
    if(gate ~= "0") then 
        CheckCollapseGate()
    end
	
	if(wandmirage ~= "0") then
		MirageWand()
	end
	
    wait(10)
end)