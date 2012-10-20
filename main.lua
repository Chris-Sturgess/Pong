--Pong: A LOVE2D game by Christopher Sturgess

playerSpeed = -5
enemySpeed = 5
ballX = 500
ballY = 250
ballSpeed = 5
playerScore = 0
enemyScore = 0
playerTextLoc = 0
function love.load()
	
	player = {x = 30, y = 200, width = 10, height = 100}
	enemy = {x = 970, y = 200, width = 10, height = 100}
	ballQuad = love.graphics.newQuad(0, 0, 100, 100, 100, 100) 
	ball = love.graphics.newImage("Images/Ball.png")
	scoreFont = love.graphics.setNewFont("fonts/segment14.ttf",100)
	
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
		playerScore = playerScore + 1
		if playerScore == 10 then playerTextLoc = 90 end
	elseif ballX <= 0 then 
		ballSpeed = 5 
		enemyScore = enemyScore + 1
	end

end

function love.draw()
	drawMidLine()
	drawPaddles()
	drawScores()
	love.graphics.drawq(ball, ballQuad, ballX, ballY, 0, .15, .15)
end

function drawScores()
	love.graphics.setFont(scoreFont)
	love.graphics.print(playerScore, 400 - playerTextLoc, 20, 0)
	love.graphics.print(enemyScore, 520, 20, 0)
end

function drawPaddles()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
	love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
end

function drawMidLine()
	love.graphics.setLine(20, "rough")
	love.graphics.line(490, 0, 490, 500)
end