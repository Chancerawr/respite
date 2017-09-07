local PANEL = {}
	function PANEL:Init()
		
		self:SetPos(ScrW() * 0.250, ScrH() * 0.125)
		self:SetSize(ScrW() * nut.config.quiz.menuWidth, ScrH() * nut.config.quiz.menuHeight)
		self:MakePopup()
		self:ShowCloseButton(false)
		self:SetDraggable(false)
		self:SetDrawOnTop(true)
		self:SetTitle(nut.lang.Get("quiz_title"))

		local noticePanel = self:Add( "nut_NoticePanel" )
		noticePanel:Dock(TOP)
		noticePanel:DockMargin(0, 0, 0, 5)
		noticePanel:SetType(1)
		noticePanel:SetText(nut.lang.Get("quiz_notification"))
		
		local panel = self:Add("DScrollPanel")
		panel:Dock(FILL)
		panel:SetDrawBackground(true)

		local answers = {}	
		for k, question in ipairs(nut.config.quiz.questions) do
			answers[k] = {}

			local text = panel:Add("DLabel")
			text:Dock(TOP)
			text:DockMargin(4, 0, 4, 0)
			text:SetText(question.question)
			text:SetAutoStretchVertical(true)

			local options = panel:Add("DComboBox")
			options:Dock(TOP)
			options:DockMargin( 4, 0, 4, 15 )
			options:SetValue(question.text and question.text or nut.config.quiz.defaultText)		
			options.OnSelect = function(panel, index, value)
				answers[k].correct = question.correct == index
				answers[k].selected = true
			end

			for _, option in ipairs(question.options) do
				options:AddChoice(option)
			end
		end

		local submit = self:Add("DButton")
		submit:Dock(BOTTOM)
		submit:DockMargin(0, 5, 0, 0)
		submit:SetText(nut.lang.Get("quiz_submit"))
		submit.DoClick = function()
			for _, answer in pairs(answers) do
				answer.correct = answer.correct or false
				answer.selected = answer.selected or false

		    	if (!answer.correct or !answer.selected) then
					print("test")
		    		netstream.Start("nut_QuizResult", false)
		    		return
				end		    		
		    end

		    netstream.Start("nut_QuizResult", true)

		    self:Remove()
		end
	end
vgui.Register("nut_Quiz", PANEL, "DFrame")

netstream.Hook("nut_Quiz", function(data)
	--[[
	if (nut.gui.char) then
		nut.gui.char:Remove()
	end
	--]]

	nut.gui.quiz = vgui.Create("nut_Quiz")
end)
