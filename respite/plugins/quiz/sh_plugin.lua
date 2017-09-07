PLUGIN.name = "Quiz"
PLUGIN.author = "Qemist & AleXXX_007 (NS 1.1)"
PLUGIN.desc = "A quiz which will be shown the first time a player joins your server which they will have to answer correctly to gain access to the server."
PLUGIN.players = {}

nut.util.Include("sh_config.lua")
nut.util.Include("sh_lang.lua")
nut.util.Include("cl_quiz.lua")

function PLUGIN:PlayerInitialSpawn(client)
	timer.Simple(5,function()
		local passed = client:getNutData("passedQuiz", false)
		
		if passed == nil then
			passed = false
		end
		
		--passed = false
		
		if (!passed) then
			netstream.Start(client, "nut_Quiz")
		end
	end)
end
netstream.Hook("nut_QuizResult", function(client, result)
	if (result == true) then
		client:setNutData("passedQuiz", true)
		netstream.Start(client, "nut_Char")
	else
		client:Kick(nut.config.quiz.kickMessage)
	end
end)	