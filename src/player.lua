function Player(_x, _y)
    local player = {}
    player.x = _x
    player.y = _y
    player.width = 8
    player.height = 8

    player.box = {
        x1 = 0,
        y1 = 0,
        x2 = 8,
        y2 = 8
    }

    player.jumping = false
    player.landed = false
    player.falling = false
    player.running = false
    player.flip = false

    player.current_sprite = sprites.player.default
    
    player.dx = 0
    player.dy = 0
    player.max_dx = 2
    player.max_dy = 3

    player.acceleration = 1
    player.boost = 4
    
    player.is_dead = false
    player.hp = 3
    player.hit_cooldown = 15
    player.last_hit = 0
    player.invulnerable = 0
    
    player.score = 0
    player.pos_score = 0
    player.kill_score = 0
    player.fries_score = 0
    
    player.max_x_reached = 0
    
    player.update = function()
        if player.is_dead then 
            return
        end
        
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

        if btn(2)
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
                -- Furnace
                if collide_map(player, "down", 1) then
                    player.damage(1)
                end
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

        -- Fries & Burgers collisions & collection
        local celx, cely = flr(player.x / 8), flr(player.y / 8)

        -- Fries
        for _, frie in pairs(fries) do
            if collide(player, frie) then
                player.kill_score += scores.fries
                fries[indexOf(fries, frie)] = Dummy()
            end 
        end

        -- Burgers
        for _, burger in pairs(burgers) do
            if collide(player, burger) then
                -- Burger kapout
                if player.y > burger.y then
                    player.kill_score += scores.burger
                    burgers[indexOf(burgers, burger)] = Dummy()
                -- Player kapout
                else
                    player.damage(1)
                end
            end 
        end

        -- Score
        if player.x > player.max_x_reached then
            player.max_x_reached = player.x
        end

        if player.x == player.max_x_reached then
            player.pos_score = flr(player.x / 10) * 10
        end

        player.score = player.pos_score + player.kill_score + player.fries_score

        player.animate()

        player.last_hit = player.last_hit + 1
        if player.last_hit >= player.hit_cooldown then
            player.last_hit = 0
            player.invulnerable = false
        else
            player.invulnerable = true
        end

        if player.is_dead then
            player.current_sprite = sprites.player.dead[1]
        end
    end

    player.draw = function()
        spr(player.current_sprite, player.x, player.y, 1, 1, player.flip)
    end

    player.animate = function()
    end

    player.damage = function(num)
        if player.invulnerable then 
            return
        end

        player.hp -= 1

        if player.hp < 1 then
            player.is_dead = true
        end
    end

    return player
end
