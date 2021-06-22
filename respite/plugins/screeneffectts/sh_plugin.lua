local PLUGIN = PLUGIN
PLUGIN.name = "Screen Effects"
PLUGIN.author = "7192"
PLUGIN.desc = "A thing that makes it easy to add effects to players' screens."

local playerMeta = FindMetaTable("Player")

if(SERVER) then
	function playerMeta:nutEffectAdd(itemID, effect)
		netstream.Start(self, "nut_effectAdd", itemID, effect)
	end
	
	function playerMeta:nutEffectRemove(itemID)
		netstream.Start(self, "nut_effectRemove", itemID)
	end
else --client
	--networking add
	netstream.Hook("nut_effectAdd", function(itemID, effect)
		local client = LocalPlayer()
		
		if(!client.nutEffects) then
			client.nutEffects = {}
		end
		
		if(effect.duration) then
			effect.endTime = CurTime() + effect.duration
		end
		
		client.nutEffects[itemID] = effect
	end)
	
	--networking remove
	netstream.Hook("nut_effectRemove", function(itemID)
		local client = LocalPlayer()
	
		if(!client.nutEffects) then
			client.nutEffects = {}
		end
		
		client.nutEffects[itemID] = nil
	end)

	--these are the actual effects as referenced. the first one in brackets and quotes eg ("bloom1") is the one actually referenced in the item.effect part of the drug itself.
    hook.Add("PreDrawEffects", "drugsEffects", function()
		local client = LocalPlayer()
	
		if(client.nutEffects) then --table that contains all of the effects on the player
			for itemID, effect in pairs(client.nutEffects) do
				--colormod
				if(effect.colorMod) then
					DrawColorModify(effect.colorMod)
				end
				
				--bloom
				if(effect.bloom) then
					local bloom = effect.bloom
				
					--default bloom is (0.65, 2, 9, 9, 1, 1, 1, 1, 1)
					DrawBloom(bloom.darken, bloom.mult, bloom.sizeX, bloom.sizeY, bloom.passes, bloom.colorMult, bloom.r, bloom.g, bloom.b)
				end
				
				--texturize
				if(effect.texturize) then
					DrawTexturize(1, effect.texturize)
				end
				
				--sobel
				if(effect.sobel) then
					DrawSobel(effect.sobel)
				end		
				
				--sharpen
				if(effect.sharpen) then
					local sharpen = effect.sharpen
			
					DrawSharpen(sharpen.contrast, sharpen.dist)
				end
				
				--motion blur
				if(effect.motionBlur) then
					local motionBlur = effect.motionBlur
					
					DrawMotionBlur(motionBlur.addAlpha, motionBlur.drawAlpha, motionBlur.delay)
				end
				
				--if it has a duration specified by the effect, just get rid of it when it's done
				if(effect.endTime) then
					if(CurTime() > effect.endTime) then
						client.nutEffects[itemID] = nil
					end
				end
			end
		end
    end)
end