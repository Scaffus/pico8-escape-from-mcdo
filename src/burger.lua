function CreateBurgers()
    burgers = {}
    for x = 0, 128 do
        for y = 0, 13 do
            if check_flags(flags.burger.flags, x, y) then
                burger = Burger(x * 8, y * 8)
                burgers[#burgers+1] = burger
                mset(x, y, 1)
            end
        end
    end
    return burgers
end


function Burger(x, y)
    local burger = {}
    burger.x = x
    burger.y = y
    burger.width = 8
    burger.height = 8

    burger.box = {
        x1 = 0,
        y1 = 0,
        x2 = 8,
        y2 = 8,
    }

    burger.flip = false
    burger.direction = "left"

    burger.update = function()
        new_x = 0
        if burger.direction == "left" then
            new_x -= 1
        elseif burger.direction == "right" then
            new_x += 1
        end

        if collide_map(burger, burger.direction, 0) or collide_map(burger, burger.direction, 7) then
            if burger.direction == "left" then
                burger.direction = "right"
            elseif burger.direction == "right" then
               burger.direction = "left"
            end
        else
            burger.x += new_x
        end
        if burger.direction == "left" then
            burger.flip = true
        else
            burger.flip = false
        end
    end

    burger.draw = function()
        spr(burgers_sprite, burger.x, burger.y, 1, 1, burger.flip)
    end

    return burger
end