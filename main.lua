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
playing = false

function love.load()

	ball = puck.init()
	scoreFont = love.graphics.setNewFont("fonts/segment14.ttf",100)
	player = paddle.init(20, true)
	enemy = paddle.init(980, false)
	
end

function love.update()
	if playing then
		score(puck.move(ball))
		paddle.move(player)
		paddle.move(enemy)
	else
		checkForStart()
	end
end

function love.draw()
	if playing then
		drawMidLine()
		drawPaddles()
		drawScores()
		drawBall()
	else
		drawMenu()
	end
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

function drawMenu()
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(scoreFont)
	love.graphics.rectangle("line", 300, 300, 400, 100)
	love.graphics.print("Play", 385, 320)
	love.graphics.print("PONG", 260, 100, 0, 2, 2)
end

function checkForStart()
	if love.mouse.isDown("l") and love.mouse.getX() < 700 and love.mouse.getX() > 200 and love.mouse.getY() > 300 and love.mouse.getY() < 400 then
		playing = true
		love.mouse.setVisible(false)
	end
end