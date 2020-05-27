--Ceasefire 
--Let's talk this out
--curses
--15
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
        for _, c in ipairs(ability) do
			if ComponentGetTypeName(c) == "AbilityComponent" then
                --local left = tonumber(ComponentGetValue(c, "mReloadFramesLeft"))
				local frame = GameGetFrameNum()
                ComponentSetValue(c, "mReloadFramesLeft", tostring(wait))
                ComponentSetValue(c, "mNextFrameUsable", tostring(frame+wait))
			end
        end
    end
end
