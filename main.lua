--Pong: A LOVE2D game by Christopher Sturgess

playerSpeed = -5
enemySpeed = 5
ballX = 500
ballY = 250
ballSpeed = 5
function love.load()
	
	player = {x = 30, y = 200, width = 10, height = 100}
	enemy = {x = 970, y = 200, width = 10, height = 100}
	ballQuad = love.graphics.newQuad(0, 0, 100, 100, 100, 100) 
	ball = love.graphics.newImage("Images/Ball.png")
end

function love.update()

	player.y = player.y + playerSpeed
	enemy.y = enemy.y + enemySpeed
	ballX = ballX + ballSpeed
	
	if player.y >= 400 then 
		playerSpeed = -5
	elseif player.y <= 0 then 
		playerSpeed = 5 
	end
	
	if enemy.y >= 400 then 
		enemySpeed = -5
	elseif enemy.y <= 0 then 
		enemySpeed = 5 
	end

	if ballX >= 980 then 
		ballSpeed = -5
	elseif ballX <= 0 then 
		ballSpeed = 5 
	end

end

function love.draw()

	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
	love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
	love.graphics.drawq(ball, ballQuad, ballX, ballY, 0, .15, .15)
end

