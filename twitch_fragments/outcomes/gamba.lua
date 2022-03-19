--Gamba
--Lucky... or maybe not x2?
--unknown
--20
--yeehaw
function twitch_gamba()
    local outcome = ti_outcomes[math.random(1, #ti_outcomes)]
    local outcome2 = ti_outcomes[math.random(1, #ti_outcomes)]
    while outcome2.id == outcome.id do
        outcome2 = ti_outcomes[math.random(1, #ti_outcomes)]
    end
    local name = outcome.name .. " & " .. outcome2.name
    GamePrintImportant(name, "whoa")
    GamePrint("GAMBA: " .. name)
    outcome.fn()
    outcome2.fn()

end
