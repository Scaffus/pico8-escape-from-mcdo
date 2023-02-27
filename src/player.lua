function Player(_x, _y)
    local player = {}
    player.x = _x
    player.y = _y
    player.width = 8
    player.height = 8

    player.jumping = false
    player.landed = false
    player.falling = false
    player.running = false
    player.flip = false

    player.dx = 0
    player.dy = 0
    player.max_dx = 2
    player.max_dy = 3

    player.acceleration = 0.9
    player.boost = 4

    player.hp = 3

    player.update = function()
        player.dy += gravity
        player.dx *= friction

        if btn(0) then
            player.dx -= player.acceleration
            player.running = true
            player.flip = true
        end
        if btn(1) then
            player.dx += player.acceleration
            player.running = true
            player.flip = false
        end

        if player.running
        and not btn(0)
        and not btn(1)
        and not player.falling
        and not player.jumping then
            player.running = false
        end

        if btn(4)
        and player.landed then
            player.dy -= player.boost
            player.landed = false
        end

        -- Y axis collisions
        if player.dy > 0 then
            player.falling = true
            player.landed = false
            player.jumping = false

            player.dy = limit_speed(player.dy, player.max_dy)

            if collide_map(player, "down", 0) then
                player.landed = true
                player.falling = false
                player.dy = 0
                player.y -= ((player.y + player.height + 1) % 8) - 1
            end
        elseif player.dy < 0 then
            player.jumping = true
            if collide_map(player, "up", 0) then
                player.dy = 0
            end
        end

        -- X axis collisions
        if player.dx < 0 then
            player.dx = limit_speed(player.dx, player.max_dx)

            if collide_map(player, "left", 0) then
                player.dx = 0
            end
        elseif player.dx > 0 then

            player.dx = limit_speed(player.dx, player.max_dx)

            if collide_map(player, "right", 0) then
                player.dx=0
            end
        end

        player.x += player.dx
        player.y += player.dy
    end

    player.draw = function()
        spr(player_sprite, player.x, player.y)
    end

    player.animate = function()
        
    end

    return player
end
