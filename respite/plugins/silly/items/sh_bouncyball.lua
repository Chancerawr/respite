ITEM.name = "Bouncy Ball"
ITEM.desc = "A large, extremely bouncy ball."
ITEM.uniqueID = "bouncyball"
ITEM.model = "models/props_phx/misc/smallcannonball.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Weird"
ITEM.color = Color(255, 253, 0)

ITEM.price = 15

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local curBall = item:getData("ball")
		if(IsValid(curBall)) then 
			SafeRemoveEntity(curBall)
		end
		
		local dropPos = client:getItemDropPos()
		
		local ball = ents.Create("sent_ball")
		ball:SetPos(dropPos)
		ball.Use = function(ball, activator)
			activator:PickupObject(ball)
		end --turn off ball eating
		ball:Spawn()
		local size = math.random(12, 48)
		ball:SetBallSize(size)
		ball:Activate()
		
		item:setData("ball", ball)
		
		return false
	end,
}