--Ceasefire 
--Let's talk this out
--curses
--102
--Wand on cooldown for a bit
function twitch_ceasefire()
    local wands = GetWands()
    if wands == nil then return end

	local min = 15
	local max = 50
	local range = max - min
	local power = 3 -- bigger power (x^power), bigger bias to minimum | no bias at 1 | bias toward long delay under 1
	local div = math.pow(range, power - 1) -- how to compensate exponent to end at max
	local r = Random(0, range)
	local wait = math.pow(r, power)/div + min -- still in between <min, max>
	-- power = 3 => on average 8.75second shorter wait than just Random(min, max), but still can roll max
	wait = wait * 60 -- 60/second
	
    for i = 1, table.getn(wands) do
        local ability = EntityGetAllComponents(wands[i])
		local isActive = IsActiveWand(ability)
        for _, c in ipairs(ability) do
			if ComponentGetTypeName(c) == "AbilityComponent" then
				local frame = GameGetFrameNum()
				if isActive == true then
					ComponentSetValue(c, "mReloadFramesLeft", tostring(wait)) -- special for currently equiped wand
				end
                ComponentSetValue(c, "mNextFrameUsable", tostring(frame+wait))
			end
        end
    end
end

function IsActiveWand(ability)
	for _, c in ipairs(ability) do
		if ComponentGetTypeName(c) == "AudioLoopComponent" or ComponentGetTypeName(c) == "SpriteComponent" then
			local enabled = ComponentGetIsEnabled(c)
			if enabled ~= nil and enabled == true then
				return true;
			end
		end
	end
	return false;
end