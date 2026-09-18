local PLUGIN = PLUGIN

if(CLIENT) then return end
if(game.GetMap() != "gm_fazbears_forgotten") then return end

PLUGIN.scripts = PLUGIN.scripts or {}
--
PLUGIN.scripts["intro"] = {
	ents = {
		{
			class = "resp_puppet",
			pos = Vector(7356.6518554688,7449.2021484375,1392.03125),
			ang = Angle(0,272.53234863281,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7351.2202148438,7394.5405273438,1392.03125),
			ang = Angle(0,89.287689208984,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7338.7231445313,6961.98046875,1392.03125),
			ang = Angle(0,180.15705871582,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7878.8701171875,6661.5747070313,1392.03125),
			ang = Angle(0,86.777488708496,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8189.0185546875,7433.4467773438,1392.03125),
			ang = Angle(0,227.34858703613,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8189.4877929688,7386.359375,1392.03125),
			ang = Angle(0,149.78340148926,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8154.28125,7410.8115234375,1392.03125),
			ang = Angle(0,0.92852783203125,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7595.5634765625,7406.7065429688,1392.03125),
			ang = Angle(0,179.69207763672,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7539.7587890625,7120.4174804688,1391.0533447266),
			ang = Angle(-2.544444452498e-14,175.32649230957,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7542.09375,7186.8891601563,1391.2305908203),
			ang = Angle(2.0355555619984e-13,-168.98551940918,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7471.515625,7123.0869140625,1391.0939941406),
			ang = Angle(0,5.1338686943054,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7470.2602539063,7189.8051757813,1389.1466064453),
			ang = Angle(-5.0888875497432e-14,-1.5270453691483,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7095.5244140625,7574.0986328125,1402.03125),
			ang = Angle(0,91.119384765625,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8222.5029296875,7547.6318359375,1392.03125),
			ang = Angle(0,3.5133972167969,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7099.8916015625,7443.9453125,1392.03125),
			ang = Angle(0,194.53952026367,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7105.513671875,7398.8237304688,1392.03125),
			ang = Angle(0,176.46607971191,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7083.1225585938,6986.1010742188,1392.03125),
			ang = Angle(0,149.10488891602,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7068.9379882813,6945.3461914063,1392.03125),
			ang = Angle(0,132.03552246094,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7131.0673828125,6974.1728515625,1392.03125),
			ang = Angle(0,158.8946685791,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7203.2299804688,7190.8608398438,1392.03125),
			ang = Angle(0,354.4765625,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7197.40234375,7110.62109375,1392.03125),
			ang = Angle(0,357.99078369141,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7557.8061523438,6893.0278320313,1392.03125),
			ang = Angle(0,179.98001098633,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8122.3100585938,6404.5498046875,1397.9692382813),
			ang = Angle(0,339.66632080078,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8460.939453125,6846.564453125,1397.9389648438),
			ang = Angle(0,87.102828979492,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9292.271484375,6520.9033203125,1397.9389648438),
			ang = Angle(0,182.49044799805,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10932.073242188,7511.990234375,1392.03125),
			ang = Angle(0,175.712890625,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11060.458984375,7328.94140625,1392.03125),
			ang = Angle(0,359.99865722656,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11164.147460938,7331.4985351563,1392.03125),
			ang = Angle(0,177.7582244873,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11412.0546875,6492.6083984375,1392.03125),
			ang = Angle(1.5256487739812e-10,-160.36973571777,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11386.125,6441.9477539063,1392.03125),
			ang = Angle(0,75.065361022949,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11350.154296875,6489.3266601563,1392.03125),
			ang = Angle(0,341.20999145508,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11614.883789063,5399.1181640625,1392.03125),
			ang = Angle(0,264.89987182617,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11398.5,5532.4995117188,1397.9692382813),
			ang = Angle(0,97.68327331543,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10495.04296875,6324.0356445313,1392.03125),
			ang = Angle(0,178.2975769043,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10775.08984375,6107.1899414063,1392.03125),
			ang = Angle(0,74.24991607666,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10765.173828125,6164.044921875,1392.03125),
			ang = Angle(0,285.26956176758,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10806.239257813,6138.8139648438,1392.03125),
			ang = Angle(0,202.05641174316,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10539.43359375,5668.283203125,1392.03125),
			ang = Angle(0,354.55078125,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10154.515625,6776.5,1392.03125),
			ang = Angle(0,270.45889282227,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8867.9521484375,6066.1171875,1397.9389648438),
			ang = Angle(0,5.0935668945313,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9139.6435546875,5035.0288085938,1392.03125),
			ang = Angle(0,270.45904541016,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8717.5771484375,6268.8505859375,1392.03125),
			ang = Angle(0,182.35089111328,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8520.33984375,6099.7377929688,1397.9692382813),
			ang = Angle(0,86.461265563965,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8510.1005859375,6214.2583007813,1397.9389648438),
			ang = Angle(0,282.29412841797,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8242.115234375,5711.7216796875,1392.03125),
			ang = Angle(0,88.720367431641,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9166.365234375,6349.7543945313,1392.03125),
			ang = Angle(0,183.85688781738,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10704.680664063,7930.8759765625,1392.03125),
			ang = Angle(0,91.193145751953,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10669.357421875,8019.5112304688,1392.03125),
			ang = Angle(0,273.97299194336,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10684.765625,7794.4594726563,1402.03125),
			ang = Angle(0,95.711532592773,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10690.2734375,7864.1962890625,1397.9692382813),
			ang = Angle(0,269.70574951172,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11636.506835938,7337.9404296875,1397.9692382813),
			ang = Angle(0,290.03845214844,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11664.43359375,7009.0473632813,1397.9389648438),
			ang = Angle(0,270.70983886719,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11723.977539063,6828.986328125,1392.03125),
			ang = Angle(0,178.29722595215,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11524.029296875,5753.2197265625,1392.03125),
			ang = Angle(0,359.19451904297,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(11524.01953125,5799.8208007813,1392.03125),
			ang = Angle(0,358.06500244141,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(10892.244140625,5720.513671875,1392.03125),
			ang = Angle(0,358.31597900391,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9877.10546875,5524.88671875,1392.03125),
			ang = Angle(0,91.983695983887,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9658.388671875,5377.4555664063,1402.03125),
			ang = Angle(0,269.99395751953,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9673.0087890625,5279.7392578125,1397.9389648438),
			ang = Angle(0,91.230323791504,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9550.6259765625,5032.6240234375,1392.03125),
			ang = Angle(0,268.73910522461,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9133.4609375,5345.4487304688,1392.03125),
			ang = Angle(-8.1422179111848e-13,-125.09177398682,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9240.080078125,4801.5322265625,1392.03125),
			ang = Angle(0,105.57592773438,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8980.603515625,4255.9184570313,1392.03125),
			ang = Angle(0,179.41241455078,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8369.884765625,3085.537109375,1392.03125),
			ang = Angle(0,270.57022094727,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8609.9091796875,3451.0354003906,1402.03125),
			ang = Angle(0,269.81704711914,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8064.8061523438,3694.3095703125,1393.7045898438),
			ang = Angle(-1.2213329306232e-12,-120.79916381836,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7504.7270507813,3617.0446777344,1392.7779541016),
			ang = Angle(4.0711100397946e-13,-21.635606765747,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7534.1909179688,3643.7338867188,1392.03125),
			ang = Angle(-4.0711100397946e-13,-38.760646820068,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7571.5439453125,3054.7912597656,1392.03125),
			ang = Angle(0,1.1884460449219,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8234.888671875,3274.4907226563,1392.03125),
			ang = Angle(0,3.4477691650391,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8252.54296875,3419.9975585938,1392.03125),
			ang = Angle(0,103.92989349365,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8207.0234375,3413.9074707031,1392.03125),
			ang = Angle(0,88.617660522461,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8160.974609375,3426.5307617188,1392.03125),
			ang = Angle(0,62.260528564453,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7412.703125,3647.8708496094,1392.03125),
			ang = Angle(0,181.74578857422,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6952.0263671875,3070.3786621094,1392.2718505859),
			ang = Angle(-8.467909012877e-11,89.900917053223,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6960.9501953125,3841.9245605469,1392.03125),
			ang = Angle(0,3.4471130371094,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7130.6606445313,4150.076171875,1397.9389648438),
			ang = Angle(0,3.4845123291016,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6749.6640625,4106.0024414063,1397.9389648438),
			ang = Angle(0,3.7354431152344,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6808.9794921875,4263.4482421875,1392.03125),
			ang = Angle(0,90.588241577148,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6887.5258789063,4725.6083984375,1392.03125),
			ang = Angle(0,-2.5401647090912,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6677.9765625,4619.09765625,1392.03125),
			ang = Angle(0,92.847389221191,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6684.4145507813,4661.4013671875,1392.03125),
			ang = Angle(0,273.36810302734,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6886.7060546875,5413.970703125,1392.03125),
			ang = Angle(0,84.726554870605,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7253.494140625,5251.9340820313,1392.03125),
			ang = Angle(0,1.7272186279297,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7106.3862304688,4971.9711914063,1392.03125),
			ang = Angle(0,89.11971282959,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7114.5288085938,5028.03125,1392.03125),
			ang = Angle(0,269.89147949219,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(8083.3466796875,5155.9506835938,1392.8197021484),
			ang = Angle(-4.0711100397946e-13,148.83445739746,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7412.1782226563,5551.3857421875,1392.03125),
			ang = Angle(0,177.5158996582,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7143.5009765625,6218.837890625,1392.03125),
			ang = Angle(0,183.00086975098,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6903.349609375,6456.3583984375,1390.7092285156),
			ang = Angle(0,-166.73146057129,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6758.19140625,6207.3715820313,1390.3248291016),
			ang = Angle(-2.9515552328607e-12,14.233688354492,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7008.8168945313,6570.9375,1392.03125),
			ang = Angle(0,270.64385986328,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7014.4868164063,6437.197265625,1392.03125),
			ang = Angle(0,93.172729492188,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(7662.3803710938,6553.6196289063,1392.03125),
			ang = Angle(0,91.666595458984,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(6567.7622070313,7017.1684570313,1392.03125),
			ang = Angle(0,141.36824035645,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9447.96484375,4197.076171875,1392.03125),
			ang = Angle(2.0355550198973e-13,-165.51707458496,0),
		},
		{
			class = "resp_puppet",
			pos = Vector(9397.203125,4185.3842773438,1392.03125),
			ang = Angle(0,18.031034469604,0),
		},
		{
			class = "prop_physics",
			pos = Vector(6864.6704101563,7153.1625976563,1484.4119873047),
			ang = Angle(-0.033032234758139,0.36727854609489,-0.03179931640625),
			name = "stage",
			model = "models/hunter/blocks/cube2x2x2.mdl",
			color = Color(255,255,255,0),
			frozen = true,
			noCollide = true,
		},
	},
	
	triggers = {
		{
			event = "lightsoff",
			pos = Vector(6889.8247070313,7142.4799804688,1502.5),
			mins = Vector(85.92041015625,86.08740234375,-65.46875),
			maxs = Vector(-85.92041015625,-86.08740234375,65.46875),
			name = "stageT",
		},
	},
	
	onLoad = function(self, entity)
		if(self.storedEnts and IsValid(self.storedEnts["stage"])) then
			--set the trigger to glow
			local stage = self.storedEnts["stage"]

			local haloDraw = {
				color = Color(0,255,0),
				blurX = 1,
				blurY = 1,
				passes = 1,
				additive = true,
				ignoreZ = true,
			}
			
			timer.Simple(2, function()
				PLUGIN:AddHalo(stage, haloDraw)
			end)
		end
		
		if(self.storedTriggers and IsValid(self.storedTriggers["stageT"])) then
			--set the trigger to glow
			local trigger = self.storedTriggers["stageT"]
			if(IsValid(trigger)) then
				trigger.OnTrigger = function(trigger, entity)
					if(!IsValid(entity)) then return end
					if(entity.IntroStage) then return end
					
					if(entity:IsPlayer()) then
						entity.IntroStage = true
						self.playerCount = (self.playerCount or 0)+1
					end
					
					if(self.playerCount >= #(player.GetAll())) then
						PLUGIN:EndScript(self.id)
						PLUGIN:RunScript("lightsoff")
					
						SafeRemoveEntity(trigger)
					end
				end
			end
		end
		
		--make it so the power cannot go off
		local powerButton = ents.GetMapCreatedEntity(2882)
		if(IsValid(powerButton)) then
			powerButton:Fire("Lock")
		end
	end,
	onEnd = function(self)
		local stage = self.storedEnts["stage"]
		if(IsValid(stage)) then
			SafeRemoveEntity(stage)
		end
	end,
}

PLUGIN.scripts["lightsoff"] = {
	ents = {
		{
			class = "prop_physics",
			pos = Vector(7027.4721679688,4056.9868164063,1247.0744628906),
			ang = Angle(0,-180,0),
			name = "generator",
			model = "models/hunter/blocks/cube2x2x2.mdl",
			color = Color(255,255,255,0),
			frozen = true,
			noCollide = true,
		},
		{
			class = "resp_moon",
			pos = Vector(7259.234375,9374.4970703125,1800),
			ang = Angle(0.024821221828461,0.0073786405846477,-0.0074462890625),
			frozen = true,
			noCollide = true,
		},
		{
			class = "resp_moon",
			pos = Vector(7834.1616210938,1955.8117675781,1800),
			ang = Angle(-0.095496527850628,-4.2735286115203e-05,0.051467895507813),
			frozen = true,
			noCollide = true,
		},
	},

	onLoad = function(self, entity)
		--make every NPC face the players
		local audience = ents.FindByClass("resp_puppet")
		for k, v in pairs(audience) do
			local ranPlayer = table.Random(player.GetAll())
			
			v:FaceTarget(ranPlayer)
		end

		timer.Simple(30, function()
			for k, v in ipairs(player.GetAll()) do
				v:SetNWBool("customFlashlight", false)
			end
		
			--turn off the power
			local powerButton = ents.GetMapCreatedEntity(2882)
			if(IsValid(powerButton)) then
				powerButton:Fire("Unlock")
				powerButton:Fire("Press")

				local MapLua = ents.Create( "lua_run" )
				MapLua:SetName( "triggergeneratorhook" )
				MapLua:Spawn()
				
				local powerButton2 = ents.GetMapCreatedEntity(4394)
				if(IsValid(powerButton2)) then
					powerButton2:Fire( "AddOutput", "OnPressed triggergeneratorhook:RunPassedCode:hook.Run( 'OnGeneratorButtonPressed' ):0:-1" )
					
					hook.Add("OnGeneratorButtonPressed", "TestButtonHook", function()
						local activator, caller = ACTIVATOR, CALLER

						PLUGIN:EndScript("lightsoff")
						PLUGIN:RunScript("lightsrestored")

						hook.Remove("OnGeneratorButtonPressed", "TestButtonHook")
					end )
				end
				
				local generator = self.storedEnts["generator"]

				--highlight the button
				local haloDraw = {
					color = Color(0,255,0),
					blurX = 1,
					blurY = 1,
					passes = 1,
					additive = true,
					ignoreZ = true,
				}
				
				timer.Simple(1, function()
					PLUGIN:AddHalo(generator, haloDraw)
				end)
			end
			
			--ragdoll all the puppets
			--maybe fling them a little too
			for k, v in pairs(audience) do
				if(IsValid(v) and !v.pretending) then
					timer.Simple(math.Rand(0,1), function()
						local ragdoll = v:Ragdoll()
						local phys = ragdoll:GetPhysicsObject()
						if(IsValid(phys)) then
							phys:ApplyForceCenter(VectorRand()*1000)
						end
					end)
				end
			end
			
			timer.Simple(10, function()
				local msg = {
					{
						data = {
							text = "THE MOON IS WATCHING",
							color = Color(255,255,255),
						},
						duration = 5,
					},
					{
						data = {
							text = "RESTORE THE POWER",
							color = Color(255,0,0),
						},
						duration = 5,
					},
				}

				PLUGIN:SendMessage(msg)
			end)
		end)
	end,
	onEnd = function(self)
		local generator = self.storedEnts["generator"]
		if(IsValid(generator)) then
			SafeRemoveEntity(generator)
		end
		
		for k, v in ipairs(self.shades or {}) do
			SafeRemoveEntity(v)
		end
	end,
	think = function(self)
		self.shades = self.shades or {}
	
		local shades = self.shades
		
		local count = 0
		for k, shade in ipairs(shades) do
			if(IsValid(shade)) then
				count = count + 1
			else
				table.remove(self.shades, k)
			end
		end

		if (count < 15) then
			local spawns = {
				Vector(6899.1147460938,2082.5244140625,1392.03125),
				Vector(7419.10546875,2144.1337890625,1392.03125),
				Vector(8805.0361328125,2103.2846679688,1392.03125),
				Vector(8318.5205078125,2536.7463378906,1392.03125),
				Vector(8917.68359375,8182.1318359375,1392.03125),
				Vector(7770.16796875,8300.908203125,1392.03125),
				Vector(6901.0249023438,8125.2495117188,1392.03125),
				Vector(6358.97265625,7346.3139648438,1392.03125),
				Vector(5000.4291992188,7594.7915039063,1392.03125),
			}
			
			local shades = {
				"resp_siren",
				"resp_stranger",
				"resp_revenge",
				"resp_figment",
				"resp_babu_s",
				"resp_housewife_s",
			}
			
			local rallies = {
				Vector(6626.048828125,3559.6909179688,1200.03125),
				Vector(7229.0107421875,4176.744140625,1200.03125),
				Vector(9510.1875,4956.966796875,1200.03125),
				Vector(8792.25390625,5742.69140625,1200.03125),
				Vector(7999.7768554688,5276.9340820313,1200.03125),
				Vector(7967.224609375,3674.6923828125,1200.03125),
				Vector(8543.5185546875,3835.3862304688,1200.03125),
				Vector(6970.4956054688,3413.1555175781,1200.03125),
				Vector(6887.0244140625,5156.8041992188,1200.03125),
			}	
			
			local spawn = table.Random(spawns)
			local shade = table.Random(shades)
			
			local safeDist = 100000
			local tooClose
			for k, v in ipairs(player.GetAll()) do
				if(v:GetPos():DistToSqr(spawn) < safeDist) then
					tooClose = true
				end
			end
			
			if(!tooClose) then
				local enemy = ents.Create(shade)
				enemy:SetPos(spawn)
				enemy:Spawn()

				local data = {}
					data.start = spawn --position value
					data.endpos = spawn
					data.filter = {enemy}
				local trace = util.TraceEntity(data, enemy)
				
				if(IsValid(trace.Entity) or trace.HitWorld or !util.IsInWorld(spawn)) then
					SafeRemoveEntity(enemy)
					return false
				end
				
				table.insert(self.shades, enemy)
				
				timer.Simple(5, function()
					if(IsValid(enemy)) then
						local rally = table.Random(rallies)
					
						enemy.rallyPoint = rally
					end
				end)
			end
		end
	end
}

PLUGIN.scripts["lightsrestored"] = {
	onLoad = function(self, entity)
		local msg = {
			{
				data = {
					text = "RETURN TO THE STAGE",
					color = Color(255,255,255),
				},
				duration = 5,
			},
		}

		PLUGIN:SendMessage(msg)
	
		timer.Simple(30, function()
			--enrage all the ragdolled puppets
			local audience = ents.FindByClass("resp_puppet")
			for k, v in pairs(audience) do
				timer.Simple(math.Rand(0,3), function()
					v:FakeDeath(dmginfo)
				end)
			end
			
			local text = [[
Shoe-In walks a mile in the shoes of our warehouse staff.
Hula-Honey is right at home with the gifts.
Dolly just loves a nutritious meal.
				
Return them to this stage, and the puppets will rest again.
			]]
			
			local paper = ents.Create("nut_paper")
			paper:SetPos(Vector(7035.0170898438,7154.515625,1393.7847900391))
			paper:SetAngles(Angle(-0.091369636356831,-2.2154734134674,0.011520385742188))
			paper:Spawn()
			paper:setNetVar("text", text)
			
			local haloDraw = {
				color = Color(0,255,0),
				blurX = 1,
				blurY = 1,
				passes = 1,
				additive = true,
			}
			
			timer.Simple(2, function()
				PLUGIN:AddHalo(paper, haloDraw)
			end)
			
			local scavenger = {
				{
					pos = Vector(5521.6606445313,6234.9995117188,1493.3494873047),
					ang = Angle(-0.43985036015511,-76.685279846191,0.13481140136719),
					model = "models/props_junk/shoe001a.mdl",
				},
				{
					pos = Vector(5731.498046875,8478.93359375,1450.4549560547),
					ang = Angle(-0.44938188791275,82.408973693848,1.7285461425781),
					model = "models/props_lab/huladoll.mdl",
				},
				{
					pos = Vector(9639.1416015625,5313.5981445313,1436.4322509766),
					ang = Angle(-46.246822357178,-51.85689163208,87.537452697754),
					model = "models/props_c17/doll01.mdl",
				},
			}
			
			for k, v in ipairs(scavenger) do
				local entity = ents.Create("prop_physics")
				entity:SetModel(v.model)
				entity:SetPos(v.pos)
				entity:SetAngles(v.ang)
				entity:Spawn()
				
				timer.Simple(1, function()
					local haloDraw = {
						color = Color(0,0,255),
						blurX = 1,
						blurY = 1,
						passes = 1,
						additive = true,
					}
				
					PLUGIN:AddHalo(entity, haloDraw)
				end)
			end
			
			local objPos = {
				{
					pos = Vector(6912.2216796875,7117.9995117188,1436.8863525391),
					ang = Angle(-0.22752630710602,13.072972297668,-0.23828125),
				},
				{
					pos = Vector(6910.8486328125,7148.2465820313,1442.015625),
					ang = Angle(-4.8478229893942e-13,0.015550832264125,0),
				},
				{
					pos = Vector(6910.8725585938,7177.8076171875,1445.5091552734),
					ang = Angle(-0.32367238402367,-19.394031524658,-1.9468383789063),
				},
			}

			local trigger = ents.Create("nut_trigger")
			trigger:SetPos(Vector(6878.0073242188,7150.6098632813,1479.7740478516))
			trigger:Spawn()
			trigger.propTrigger = true --detects props not players
			trigger:SetCollisionBounds(Vector(125.97607421875,-193.2001953125,-87.742797851563), Vector(-125.97607421875,193.2001953125,87.742797851563))
			trigger.OnTrigger = function(trigger, entity)
				if(!IsValid(entity)) then return end
				if(entity.EventMarked) then return end
				
				local class = entity:GetClass()
				if(class != "prop_physics") then return end
				
				local check
				local model = entity:GetModel()
				for k, v in pairs(scavenger) do	
					if(model == v.model) then
						check = true
					end
				end
				if(!check) then return end
				
				self.objCount = (self.objCount or 0) + 1

				local posTbl = objPos[self.objCount]
				if(posTbl) then
					entity:SetPos(posTbl.pos)
					entity:SetAngles(posTbl.ang)
					
					entity.EventMarked = true
					
					local physObj = entity:GetPhysicsObject()
					if(IsValid(physObj)) then
						physObj:EnableMotion(false)
					end
				end
				
				if(self.objCount >= 3) then
					PLUGIN:EndScript(self.id)
					PLUGIN:RunScript("moonattack")
					
					SafeRemoveEntity(trigger)
				end
			end
			
			local msg = {
				{
					data = {
						text = "THE PUPPETS RISE",
						color = Color(255,0,0),
					},
					duration = 5,
				},
			}

			PLUGIN:SendMessage(msg)
		end)
	end,
	onEnd = function()
		--put the puppets to sleep
		local audience = ents.FindByClass("resp_puppet")
		for k, v in pairs(audience) do
			v:Calm()
			
			if(!v.pretending) then
				timer.Simple(math.Rand(0,1), function()
					local ragdoll = v:Ragdoll()
				end)
			end
		end
	end,
}

PLUGIN.scripts["moonattack"] = {
	onLoad = function(self, entity)
		local souls = {
			{
				pos = Vector(11379.671875,5552.3188476563,1450),
				ang = Angle(0,0,0),
				model = "models/Humans/Charple04.mdl",
			},
			{
				pos = Vector(9253.2197265625,6486.5703125,1438),
				ang = Angle(0,0,0),
				model = "models/Humans/Charple03.mdl",
			},
			{
				pos = Vector(7838.2734375,5267.0908203125,1400),
				ang = Angle(0,0,0),
				model = "models/Humans/Charple02.mdl",
			},
		}
			
		self.souls = {}
		
		for k, v in ipairs(souls) do
			local soul = ents.Create("prop_ragdoll")
			soul:SetModel(v.model)
			soul:SetMaterial("models/props_combine/tpballglow")
			soul:SetPos(v.pos)
			soul:SetAngles(v.ang)
			soul:Spawn()
			
			soul.EventHP = 100
			
			local haloDraw = {
				color = Color(255,0,0),
				blurX = 1,
				blurY = 1,
				passes = 1,
				additive = true,
			}
			
			timer.Simple(2, function()
				PLUGIN:AddHalo(soul, haloDraw)
			end)
			
			self.souls[#self.souls+1] = soul
		end
		
		timer.Simple(10, function()
			local msg = {
				{
					data = {
						text = "BANISH THE MOON",
						color = Color(255,255,255),
					},
					duration = 5,
				},
				{
					data = {
						text = "DESTROY WHAT IT SEEKS",
						color = Color(255,0,0),
					},
					duration = 5,
				},
			}

			PLUGIN:SendMessage(msg)
		end)
	end,
	onEnd = function(self)
		for k, v in ipairs(self.wraiths or {}) do
			SafeRemoveEntity(v)
		end
	end,
	think = function(self)
		if(!self.wraiths) then self.wraiths = {} end
	
		local wraiths = self.wraiths
		
		local count = 0
		for k, wraith in ipairs(wraiths) do
			if(IsValid(wraith)) then
				count = count + 1
			else
				table.remove(self.wraiths, k)
			end
		end
		
		if (count < 15) then
			local spawns = {
				Vector(6899.1147460938,2082.5244140625,1392.03125),
				Vector(7419.10546875,2144.1337890625,1392.03125),
				Vector(8805.0361328125,2103.2846679688,1392.03125),
				Vector(8318.5205078125,2536.7463378906,1392.03125),
				Vector(8917.68359375,8182.1318359375,1392.03125),
				Vector(7770.16796875,8300.908203125,1392.03125),
				Vector(6901.0249023438,8125.2495117188,1392.03125),
				Vector(6358.97265625,7346.3139648438,1392.03125),
				Vector(5000.4291992188,7594.7915039063,1392.03125),
			}
			
			local wraiths = {
				"resp_creeper_w",
				"resp_housewife",
				"resp_horror_w",
				"resp_skinless_w",
				"resp_torso_w",
				"resp_wraith",
			}
			
			local rallies = {
				Vector(8286.0751953125,4434.97265625,1392.03125),
				Vector(9914.2421875,5449.4702148438,1392.03125),
				Vector(11175.001953125,6813.7763671875,1392.03125),
				Vector(8089.619140625,7273.93359375,1392.03125),
				Vector(8543.3037109375,5797.1162109375,1392.03125),
				Vector(7834.568359375,3875.2116699219,1392.03125),
				Vector(8307.482421875,4723.6469726563,1392.03125),
				Vector(6841.4125976563,4674.9116210938,1392.03125),
				Vector(8686.9306640625,6460.6284179688,1392.03125),
			}	
			
			local spawn = table.Random(spawns)
			local wraith = table.Random(wraiths)
			
			local safeDist = 100000
			local tooClose
			for k, v in ipairs(player.GetAll()) do
				if(v:GetPos():DistToSqr(spawn) < safeDist) then
					tooClose = true
				end
			end
			
			if(!tooClose) then
				local enemy = ents.Create(wraith)
				enemy:SetPos(spawn)
				enemy:Spawn()

				local data = {}
					data.start = spawn --position value
					data.endpos = spawn
					data.filter = {enemy}
				local trace = util.TraceEntity(data, enemy)
				
				if(IsValid(trace.Entity) or trace.HitWorld or !util.IsInWorld(spawn)) then
					SafeRemoveEntity(enemy)
					return false
				end

				table.insert(self.wraiths, enemy)
				
				timer.Simple(5, function()
					if(IsValid(enemy)) then
						local rally = table.Random(rallies)
					
						enemy.rallyPoint = rally
					end
				end)
			end
		end
		
		self.souls = self.souls or {}
		for k, v in pairs(self.souls) do
			if(!IsValid(v)) then 
				self.souls[k] = nil 
			end
		end
		
		if(table.Count(self.souls) <= 0) then
			PLUGIN:EndScript(self.id)
			PLUGIN:RunScript("moonend")
		end
	end,
}

PLUGIN.scripts["moonend"] = {
	onLoad = function(self, entity)
		--remove the moon
		local moon = ents.FindByClass("resp_moon")
		for k, v in pairs(moon) do
			SafeRemoveEntity(v)
		end

		--change the weather or something

		timer.Simple(10, function()
			local msg = {
				{
					data = {
						text = "THE NIGHTMARE IS OVER",
						color = Color(255,0,0),
					},
					duration = 5,
				},
			}

			PLUGIN:SendMessage(msg)
		end)
	end,
}