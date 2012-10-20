module(..., package.seeall);

startSpeed = 5
startY = 200
startWidth = 10
startHeight = 100

function move(paddle)
	if paddle.y >= 400 then 
		paddle.speed = -5
	elseif paddle.y <= 0 then 
		paddle.speed = 5 
	end
end

function draw(paddle)
	paddle.y = paddle.y + paddle.speed
	love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
end	
	
function init(startX)
	return {x = startX, y = startY, width = startWidth, height = startHeight, speed = startSpeed}
end