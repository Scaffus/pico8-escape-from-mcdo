function Burger()
    local burger = {}

    burger.x = 1
    burger.y = 1

    burger.update = function()

    end

    burger.draw = function()
        spr(sprites.burger.default, burger.x, burger.y)
    end

    return burger
end
