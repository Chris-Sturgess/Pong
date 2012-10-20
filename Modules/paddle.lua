module(..., package.seeall);

function move(paddle)
	if love.keyboard.isDown(paddle.upKey) then 
		paddle.speed = -5
	elseif love.keyboard.isDown(paddle.downKey) then 
		paddle.speed = 5 
	else
		paddle.speed = 0
	end
end

function draw(paddle)
	if (paddle.y > 0 and paddle.speed < 0) or (paddle.y < 400 and paddle.speed > 0) then paddle.y = paddle.y + paddle.speed end
	love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
end	
	
function init(startX, player)
	startSpeed = 5
	startY = 200
	startWidth = 10
	startHeight = 100
	retPaddle = {x = startX, y = startY, width = startWidth, height = startHeight, speed = startSpeed}
	if player then
		retPaddle.upKey = "w"
		retPaddle.downKey = "s"
	else
		retPaddle.upKey = "up"
		retPaddle.downKey = "down"
	end
	return retPaddle;
end