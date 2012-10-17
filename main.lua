--Pong: A LOVE2D game by Christopher Sturgess

function love.load()
	
	player = {x = 30, y = 200, width = 10, height = 100}
	enemy = {x = 970, y = 200, width = 10, height = 100}

end

function love.update()




end

function love.draw()

	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
	love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)

end

