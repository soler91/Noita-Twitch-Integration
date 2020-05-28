--Health Up
--Lucky you!
--helpful
--150
--todo
function twitch_health_up()
    twiddle_health(function(cur, max) return cur + 1, max + 1 end)
end
