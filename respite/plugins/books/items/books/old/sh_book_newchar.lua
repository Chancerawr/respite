ITEM.name = "Drifter (OOC)"
ITEM.desc = "A short introduction to a Drifter character, and Respite.\nThis book is OOC."
ITEM.price = 0
ITEM.flag = "3"
ITEM.value = 20

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

ITEM.contents = [[

<p align="center"><font color='black' size='6'>Drifter</font></p><br/>
		
A drifter is essentially a regular human. They will generally have memories of the regular, modern world, and are probably a functioning adult. 
	<br/><br/>	
As for how your character ended up here, he/she would have had a dream where they somehow ended up opening a door. Upon walking through said door, they would have woken up in this world with no explanation or anything else.
	<br/><br/>	
Furthermore, some characters may find themselves with behaviours of afflictions that they did not have before winding up here. (These are represented by the “Curse” traits at the bottom of the traits list in character creation, but it is perfectly fine for your character to have had them before as well.)
	<br/><br/>	
An unfamiliar and strange world full of nonsensical constructs and horrors awaits you, and you will need teamwork and ingenuity to survive. There will be many challenges ahead of you, and one misstep could bring about your death.
	<br/><br/>	
(If is important to note that most of the storyline and details about the setting will be something you find out in character. The forums will have sparse details on it, as your character will know next to nothing in the beginning.)
	<br/><br/>	
(If you want a special authorization for equipment, training, or anything else, please go to the forums and make an authorization post. You cannot obtain a gun from an authorization.)
	<br/><br/>	
(For information about the server's combat system, press F2 to open extra menu, and click on Combat Guide.)
	<br/><br/>	
</font>
]]

ITEM.functions.Destroy = {
	name = "Destroy",
	icon = "icon16/coins.png",
	sound = "ambient/materials/cupdrop.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()

		client:notify("You have received "..item.value.." scrap coins.")
		char:giveMoney(item.value)
	end
}

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		draw.SimpleText("OOC", "DermaDefault", w - 25, h - 14, Color(125,125,125), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
	end
end