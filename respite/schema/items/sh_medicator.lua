ITEM.name = "Device - Medicator"
ITEM.uniqueID = "medicator"
ITEM.model = "models/props_combine/health_charger001.mdl"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'DEPRESSANTS', another slot labelled 'ORGANICS', and a small output slot labelled 'MEDICATION'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.functions.Medical = {
	name = "Create Medical Supplies",
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local organic = inventory:hasItem("j_scrap_organic")	
		local depress = inventory:hasItem("drug_depress")	
		
		local meds = {}
			meds[1] = "medical_kit"
			meds[2] = "medical_bandages"
			meds[3] = "medical_gauze"
			meds[4] = "medical_iv"
			meds[5] = "medical_splint"
			meds[6] = "medical_suture"
			meds[7] = "drug_antibiotics"
			meds[8] = "drug_antidepressants"
			meds[9] = "drug_antipsychotics"
			meds[10] = "drug_antivenom"
			meds[11] = "drug_burnointment"
			meds[12] = "drug_disinfectant"
			meds[13] = "drug_painkillers"
			meds[14] = "pills_energy"
			meds[15] = "drug_rubbingalcohol"
			meds[16] = "drug_sleepingpills"
			meds[17] = "drug_steroid"

		local amount = organic:getData("Amount")
		
		nut.chat.send(client, "itclose", "The machine accepts the materials, vibrates intensely, and outputs a something medical after a short period of time.")

		if(amount > 10) then
			organic:setData("Amount", amount - 10)
		else
			organic:remove()
		end
		depress:remove()
		
		nut.item.spawn(meds[math.random(1,17)], position)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local organic = player:getChar():getInv():hasItem("j_scrap_organic")
		
		if !player:getChar():getInv():hasItem("drug_depress") or !organic or (organic and organic:getData("Amount") < 10) then --if item of importance isn't in the inventory.
			return false
		end
	end
}