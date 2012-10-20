--Pong: A LOVE2D game by Christopher Sturgess

require "modules.paddle"
require "modules.puck"

player = null
enemy = null
ballX = 500
ballY = 250
ballSpeed = 5
playerScore = 0
enemyScore = 0
playerTextLoc = 0
paddle = modules.paddle
puck = modules.puck

function love.load()

	ball = puck.init()
	scoreFont = love.graphics.setNewFont("fonts/segment14.ttf",100)
	player = paddle.init(20, true)
	enemy = paddle.init(980, false)
	
end

function love.update()

	score(puck.move(ball))
	paddle.move(player)
	paddle.move(enemy)

end

function love.draw()
	drawMidLine()
	drawPaddles()
	drawScores()
	drawBall()
end

function drawScores()
	love.graphics.setFont(scoreFont)
	love.graphics.print(playerScore, 410 - playerTextLoc, 20, 0)
	love.graphics.print(enemyScore, 520, 20, 0)
end

function drawPaddles()
	love.graphics.setColor(255,255,255)
	paddle.draw(player)
	paddle.draw(enemy)
end

function drawMidLine()
	i = 0
	love.graphics.setLine(10, "rough")
	while (i < 3) do
		love.graphics.line(495, i * 200, 495, i * 200 + 100)
		i = i + 1
	end
end

function drawBall()
	puck.draw(ball)
end

function score(scoreVal)
	if scoreVal == 1 then
		playerScore = playerScore + 1
		if playerScore == 10 then playerTextLoc = 90 end
	elseif scoreVal == -1 then 
		enemyScore = enemyScore + 1
	end
end
