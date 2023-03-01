function _init()
    char_width = 4
    char_height = 5
    gravity = 0.3
    friction = 0.75

    colors = {
        black = 0,
        dark_blue = 1,
        purple = 2,
        green = 3,
        brown = 4,
        dark_gray = 5,
        light_gray = 6,
        white = 7,
        red = 8, 
        orange = 9,
        yellow = "a",
        lime = "b",
        blue = "c",
        lavander = "d",
        pink = "e",
        beige = "f"
    }
    
    sprites = {
        background = 1,
        heart = 28,
        fries = {
            default = 38,
        },
        tomato = {
            default = 42,
            walk = {
                42, 43
            },
            dead = {
                44
            },
        },
        burger = {
            default = 39,
            walk = {
                39, 40
            },
            dead = {
                41
            },
        },
        player = {
            default = 32,
            idle = {
                32, 33
            },
            running = {
                34, 35
            },
            jumping = {
                36, 37
            },
            dead = {
                48
            }
        }
    }

    flags = {
        fries = { 
            bit = 6,
            flags = {1, 2}
        },
        burger = {
            bit = 12,
            flags = {2, 3}
        }
        -- terromate = 20
    }

    scores = {
        fries = 25,
        burger = 75
    }

    player_current_level = 0

    player = Player(8, 56)
    burgers = CreateBurgers()
    fries = CreateFries()
    hud = Hud(player)
end

function _update60()
    player.update()
    -- Update burgers
    for _, burger in pairs(burgers) do
        burger.update()
    end
    -- Update fries
    for _, frie in pairs(fries) do
        frie.update()
    end
    hud.update()
end

function _draw()
    cls()
    camera(player.x - 64, -8)
    map(0, 0, 0, 0)
    -- Draw burgers
    for _, burger in pairs(burgers) do
        burger.draw()
    end
    -- Draw fries
    for _, frie in pairs(fries) do
        frie.draw()
    end
    player.draw()
    camera()
    hud.draw()
    flip()
end