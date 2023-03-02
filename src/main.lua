function _init()
        char_width = 4
    char_height = 5

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
        yellow = 10,
        lime = 11,
        blue = 12,
        lavander = 13,
        pink = 14,
        beige = 15
    }
    
    sprites = {
        background = 1,
        heart = 28,
        shield_empty = 29,
        shield_full = 30,
        fries = {
            default = 38,
        },
        sauce = {
            ketchup = 45,
            mayonnaise = 46,
            potatoes = 47
        },
        burger = {
            default = 39,
            walk = {
                39, 40
            },
        },
        player = {
            default = 32,
            running = {
                34, 35
            },
            dead = 48
        },
        oil = {
            23, 24
        },
        furnace = {
            18, 31
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
        },
        sauce = {
            ketchup = {
                bit = 10,
                flags = {1, 3}
            },
            mayonnaise = {
                bit = 18,
                flags = {1, 4}
            },
            potatoes = {
                bit = 34,
                flags = {1, 5}
            }
        },
        terrormate = {
            bit = 20,
            flags = {2, 4}
        }
    }

    scores = {
        fries = 25,
        burger = 75
    }

    border_color = colors.orange
    background_color = colors.pink
    text_color = colors.white
    
    state = 0
    music(0)
    menu_init()
end

function _update60()
    if state == 0 then
        menu_update()
    else
        game_update()
    end
end

function _draw()
    if state == 0 then
        menu_draw()
    else
        game_draw()
    end
end