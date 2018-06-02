ITEM.name = "Drifter (OOC)"
ITEM.desc = "A short introduction to a Drifter character, and Respite.\nThis book is OOC."
ITEM.price = 0
ITEM.flag = "3"
ITEM.value = 10

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

ITEM.contents = [[

<p align="center"><font color='black' size='6'>Drifter</font></p><br/>
		
A drifter is essentially a regular human. They will generally have memories of the regular, modern world, and are probably a functioning adult. 
	<br/><br/>	
As for how your character ended up here, he/she would have one day awoke in some sort of insidious facility. The amount of time your character spent in the facility is up to you, it can be anywhere from several years to only a day or two. The longer your character spent there, the more terrible experiences they will have in memory.
	<br/><br/>	
The staff of this facility included strange humanoids made entirely out of plastic, and shadowy beings called shades. The temperament of the staff would largely depend on your character's behavior, but it is reasonable for your character to hate them or anything that resembles them.
	<br/><br/>	
While your character was in the facility, he/she would have been put through something the facility staff called “blight extraction”. Blight extraction is a very painful process that leaves the body temporarily weak and exhausted. This would have been performed almost daily. Your character may have also been subjected to a variety of experiments that could have left mental or physical scars.
	<br/><br/>	
That is not to say that all time spent in the facility was torture, only about half. When your character was not being tortured, they were likely socializing with other prisoners, eating, or maybe just sleeping.
	<br/><br/>	
Eventually, the drifters kept in the facility escaped, including your character. The escape included heavy fighting, and lots of running. Eventually, your character arrived at a large portal, and stepped through it, teleporting them to the current area. 
	<br/><br/>	
An unfamiliar and strange world full of nonsensical constructs and horrors awaits you, and you will need teamwork and ingenuity to survive. There will be many challenges ahead of you, and one misstep could bring about your death.
	<br/><br/>	
(If is important to note that most of the storyline and details about the setting will be something you find out in character. The forums will have sparse details on it, as your character will know next to nothing in the beginning.)
	<br/><br/>	
(If you want a special authorization for equipment, training, or anything else, please go to the forums and make an authorization post. You cannot obtain a gun from an authorization.)
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