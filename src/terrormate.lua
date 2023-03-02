function CreateTerrormates()
    terrormates = {}
    for x = 0, 128 do
        for y = 0, 13 do
            if check_flags(flags.terrormate.flags, x, y) then
                terrormate = Terrormate(x * 8, y * 8)
                terrormates[#terrormates+1] = terrormate
                mset(x, y, 1)
            end
        end
    end
    return terrormates
end


function Terrormate(x, y)
    local terrormate = {}
    terrormate.x = x
    terrormate.y = y
    terrormate.width = 8
    terrormate.height = 8

    terrormate.ani_cooldown = 6
    terrormate.last_ani = 0
    terrormate.current_frame = 1

    terrormate.box = {
        x1 = 0,
        y1 = 0,
        x2 = 8,
        y2 = 8,
    }

    terrormate.flip = false
    terrormate.direction = "left"

    terrormate.update = function()
        new_x = 0
        if terrormate.direction == "left" then
            new_x -= 1
        elseif terrormate.direction == "right" then
            new_x += 1
        end

        if collide_map(terrormate, terrormate.direction, 0) or collide_map(terrormate, terrormate.direction, 7) then
            if terrormate.direction == "left" then
                terrormate.direction = "right"
            elseif terrormate.direction == "right" then
               terrormate.direction = "left"
            end
        else
            terrormate.x += new_x
        end
        if terrormate.direction == "left" then
            terrormate.flip = true
        else
            terrormate.flip = false
        end

        terrormate.last_ani += 1
        if terrormate.last_ani >= terrormate.ani_cooldown then
            terrormate.last_ani = 0
            if terrormate.current_frame + 1 <= #sprites.terrormate.walk then
                terrormate.current_frame += 1
            else
                terrormate.current_frame = 1
            end
        end
    end

    terrormate.draw = function()
        spr(sprites.terrormate.walk[terrormate.current_frame], terrormate.x, terrormate.y, 1, 1, terrormate.flip)
    end

    return terrormate
end