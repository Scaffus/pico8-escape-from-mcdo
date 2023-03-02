function CreateSauces()
    sauces = {}
    for x = 0, 127 do
        for y = 0, 12 do
            -- Kecktup
            if check_flags(flags.sauce.ketchup.flags, x, y) then
                add(sauces, Sauce(x * 8, y * 8, "ketchup", sprites.sauce.ketchup))
                mset(x, y, sprites.background)
            end
            -- Mayonnaise
            if check_flags(flags.sauce.mayonnaise.flags, x, y) then
                add(sauces, Sauce(x * 8, y * 8, "mayonnaise", sprites.sauce.mayonnaise))
                mset(x, y, sprites.background)
            end
            -- Potatoes 
            if check_flags(flags.sauce.potatoes.flags, x, y) then
                add(sauces, Sauce(x * 8, y * 8, "potatoes", sprites.sauce.potatoes))
                mset(x, y, sprites.background)
            end
        end
    end
    return sauces
end


function Sauce(x_, y_, type, sprite)
    local sauce = {}
    sauce.x = x_
    sauce.y = y_
    sauce.y_offset = 0
    sauce.width = 8
    sauce.height = 8

    sauce.type = type
    sauce.sprite = sprite

    sauce.box = {
        x1 = 1,
        y1 = 1,
        x2 = 7,
        y2 = 7,
    }

    sauce.dir = "-"
    sauce.anim_timer_bounce = 0
    sauce.anim_max_bounce = 12

    sauce.update = function()
        sauce.anim_timer_bounce = sauce.anim_timer_bounce + 1
        if sauce.anim_timer_bounce >= sauce.anim_max_bounce then
            if sauce.dir == "+" then
                sauce.y_offset += 1
                sauce.dir = "-"
            else
                sauce.y_offset -= 1
                sauce.dir = "+"
            end
            sauce.anim_timer_bounce = 0
        end
    end

    sauce.draw = function()
        spr(sauce.sprite, sauce.x, sauce.y + sauce.y_offset)
    end

    return sauce
end