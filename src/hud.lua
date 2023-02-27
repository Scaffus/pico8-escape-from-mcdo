function Hud(player)
    local hud = {}
    hud.player = player

    hud.padding = .2

    hud.text_color = 7

    hud.hearts = player.hp
    hud.positions = {
        hearts = {
            x = 1,
            y = 128 - 8 - hud.padding * 10
        },
        score = {
            x = 1,
            y = 1
        }
    }

    hud.update = function()
        hud.hearts = player.hp
    end

    hud.draw = function()
        print("score: " .. tostr(player.score), hud.padding * 8, hud.padding * 8, hud.text_color)
        for i=0, hud.hearts-1 do
            spr(63,  (hud.positions.hearts.x + hud.padding) * 8 * i, hud.positions.hearts.y)
        end
        print("/3", (hud.positions.hearts.x + hud.padding) * 8 * 3, hud.positions.hearts.y + 2)
    end

    return hud
end