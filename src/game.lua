function game_init()
    gravity = 0.3
    friction = 0.75

    cells_to_animate = {
        {
            start_x = 55,
            end_x = 62,
            start_y = 10,
            end_y = 11,
            frames = sprites.oil,
            current_frame = 0,
            last_ani = 0,
            ani_cooldown = 12
        },
        {
            start_x = 41,
            end_x = 45,
            start_y = 10,
            end_y = 10,
            frames = sprites.furnace,
            current_frame = 0,
            last_ani = 0,
            ani_cooldown = 12
        },
    }

    player = Player(8, 56)
    burgers = CreateBurgers()
    fries = CreateFries()
    sauces = CreateSauces()
    hud = Hud(player)

    burgers_ani_cooldown = 6
    burgers_last_ani = 0
    burgers_current_frame = 1
    burgers_sprite = sprites.burger.default

    state = 1
end

function game_update()
    player.update()
    -- Update burgers
    for _, burger in pairs(burgers) do
        burger.update()
    end
    -- Update fries
    for _, frie in pairs(fries) do
        frie.update()
    end
    -- Update sauces
    for _, sauce in pairs(sauces) do
        sauce.update()
    end
    hud.update()
end

function game_draw()
    cls()
    camera(player.x - 64, -8)
    animate()
    map(0, 0, 0, 0)
    -- Draw burgers
    for _, burger in pairs(burgers) do
        burger.draw()
    end
    -- Draw sauces
    for _, frie in pairs(fries) do
        frie.draw()
    end
    -- Draw fries
    for _, sauce in pairs(sauces) do
        sauce.draw()
    end
    player.draw()
    camera()
    hud.draw()
    flip()
end

function animate()
    animate_burgers()
    animate_cells()
end

function animate_burgers()
    burgers_last_ani += 1
    if burgers_last_ani >= burgers_ani_cooldown then
        burgers_last_ani = 0
        if burgers_current_frame + 1 <= #sprites.burger.walk then
            burgers_current_frame += 1
        else
            burgers_current_frame = 1
        end
        burgers_sprite = sprites.burger.walk[burgers_current_frame]
    end
end

function animate_cells()
    for cells in all(cells_to_animate) do
        for x = cells.start_x, cells.end_x do
            for y = cells.start_y, cells.end_y do
                cells.last_ani += 1
                if cells.last_ani >= cells.ani_cooldown then
                    cells.last_ani = 0
                    if cells.current_frame + 1 <= #cells.frames then
                        cells.current_frame += 1
                    else
                        cells.current_frame = 1
                    end
                    mset(x, y, cells.frames[cells.current_frame])
                end
            end
        end
    end
end