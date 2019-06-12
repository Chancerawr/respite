ITEM.name = "Plastic (OOC)"
ITEM.desc = "A short introduction to a Plastic character.\nThis book is OOC."
ITEM.price = 0
ITEM.flag = "3"
ITEM.value = 20

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

ITEM.contents = [[

<p align="center"><font color='black' size='6'>Plastic</font></p><br/>
		
The creatures commonly referred to as “Plastics” by most speaking lifeforms, are one of the more common creatures in the Void. Their numbers likely far exceed those of Aberrations, and some believe they may even exceed those of abominations. This estimation was created through reports from drifters in abandoned respites. That being the case, it is likely not entirely accurate, considering it does not include numbers of still functioning respites, or from abandoned respites where survivors are very few.
	<br/><br/>	
Plastics, as their name implies, are almost completely made out of plastic, except for a very small metal core inside of their hearts. Not all plastics will remain composed out of the same materials for their entire lives, as they may accrue aberration body parts or other anomalies, but at creation, they will always start with plastic. 
	<br/><br/>	
They come in a variety of forms, such as animals, plants, fish, but the most common is the humanoid form. Such plastics have all of the same organs as human beings, but most do not perform as expected. There is no blood or air circulating through a plastic, nor any refuse. Also notable is the lack of most sexual organs. This is attributed to their non-sexual reproduction processes. That being the case, plastics do still retain a the appearance of a gender, some looking feminine, while others looking masculine.
	<br/><br/>	
Since the creatures are made of Plastic, their bodies are generally more frail, and more easily broken than a drifter’s is. However, this also comes with the benefits of electrical resistance, and the ability to survive in areas with toxic airborne substances. They seemingly do not even need to breathe, and can spend time underwater if they wish. They are however, not immune to blue haze since it is not necessary to breathe it in to be affected. Plastics do feel pain, and can feel differences in temperature. They can also see, hear, and smell, even if their eyes do not move, or their ears are very simple. Plastics that lack these senses also appear to be completely missing the organ for that sense. A plastic with nothing representing eyes will be completely blind, and a plastic with no ears will be deaf.
	<br/><br/>	
Plastics still require food and drink just as humans do. However, since many do not have mouths, they have a rather peculiar way of eating. They simply bring the food or drink up to where their mouth would be if they had one, and it simply disappears. The substances seemingly teleport right into their bodies, and then travel through them like it would if they were a human being, eventually disappearing after being in their stomachs for some period of time. Through this method plastics can even bite as a method of attack. However, it is not very effective in combat, and does not seem to inflict much damage, and in many cases it does less damage than a regular human bite.
	<br/><br/>	
Along with a lack of sexual organs, plastics do not feel emotions such as romantic love, and most will have no urge to seek a partner for any reason other than platonic friendship. In rare and strange cases where a drifter has pursued a romantic relationship with a plastic, results have been somewhat unexpected. Attempts at romantic contact resulted in a strange transference of human flesh to that of plastic. More severe cases are not mentioned here due to their disturbing nature. It is best advised to completely avoid attempting romance with a plastic of any sort.
	<br/><br/>	
While the organs of plastics seemingly do nothing, destruction of said organs will cause a plastic severe issues just as it would a human. Furthermore, open wounds on a plastic will eventually result in death as if they had bled out, even though they do not have blood. The time it takes for this to occur is roughly about the same time it takes for a human with a similar injury.
	<br/><br/>	
While plastic bodies can heal by themselves to some degree, the rate of this is far lower than that of a standard human being. In even moderate injuries, a plastic must pursue specific treatment methods if they wish to survive. Missing material must be replaced with actual plastic. For cuts or puncture wounds, plastic dust is generally required alongside water. They simply need to pack the wound with the material, cover it sufficiently in water (corrupted or otherwise), and wait about a day or so for it to be completely stable. A recently mended plastic will likely have the best outcome if they refrain from physical exertion for at least a day, otherwise they risk reopening their wounds or possibly worsening them. Dismembered limbs can be replaced with newly fashioned limbs, or even the limbs other other plastics, but the rate of survival for such procedures is not particularly high. Organ damage can be difficult to repair, and may require a specialist in plastic surgeries to have any reasonable chance of success.
	<br/><br/>	
The immense number of plastics and plastic settlements results in much variety in plastic cultures and lifestyles. However, there are still many constants. All plastics share the same written and sign language, which every plastic knows from the moment of their creation. Another constant is the perceived sanctity of shards. Plastics can often be seen worshipping shards wherever they find them, often constructing small shrines, or giving offerings to them. Some cultures have been seen to even perform sacrifices to shards. A popular theory is that it is because of the transformation reactions that can take place after a plastic touches a shard with their bare skin. This leads to the object itself becoming something a plastic instinctively does not wish to touch, unless there is something wrong with them.
	<br/><br/>	
Since plastics have a variety of different beliefs and ideals, conflict is not uncommon between plastic groups. That being said, it goes without saying that plastics are not innately friendly with all other plastics. Sometimes wars are waged between two competing groups, where each group does their best to attempt to exterminate or assimilate the other. The larger of these wars have been observed to lure in abominations and other creatures, creating gruesome battles for all involved. It is best to avoid respites where such battles are taking place.
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