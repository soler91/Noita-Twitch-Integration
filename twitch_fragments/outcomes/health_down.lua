--Health Down
--Unlucky :(
--bad
--30
--todo
function twitch_health_down()
    twiddle_health(function(cur, max)
        max = max * 0.8
        cur = math.min(max, cur)
        return cur, max
    end)
end
