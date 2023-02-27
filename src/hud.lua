function Hud(player)
    local hud = {}
    hud.player = player

    hud.padding = .2

    hud.hearts = player.hp
    hud.hearts_position = {
        x = 1,
        y = 128 - 8 - hud.padding * 10
    }

    hud.update = function()
        hud.hearts = player.hp
    end

    hud.draw = function()
        for i=0, hud.hearts-1 do
            spr(63,  (hud.hearts_position.x + hud.padding) * 8 * i, hud.hearts_position.y)
        end
    end

    return hud
end