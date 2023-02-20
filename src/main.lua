function _init()
    player = Player(1, 1)
    burger = Burger()
end

function _update()
    player.update()
    burger.update()
end

function _draw()
    cls()
    map(0, 0, 0, 0, 16, 16)
    player.draw()
    burger.draw()
    flip()
end
