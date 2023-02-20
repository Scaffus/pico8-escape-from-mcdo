function Player(_x, _y)
    local player = {}
    player.x = _x
    player.y = _y

    player.update = function()
        if btn(0) then
            player.move( -1, 0)
        end

        if btn(1) then
            player.move(1, 0)
        end
    end

    player.move = function(x, y)
        player.x = player.x + x
        player.y = player.y + y
    end

    player.draw = function()
        spr(1, player.x, player.y)
    end

    return player
end
