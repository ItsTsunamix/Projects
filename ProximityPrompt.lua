--Written by Tsunamix/Proxide

CreateProximityPrompt = function(Info)
	Info.Text = Info.Text or "";
	Info.HoldDuration = Info.HoldDuration or 2;
	Info.Magnitude = Info.Magnitude or 35;
	Info.MaxTriggers = Info.MaxTriggers or math.huge;
	
	local ProximityPrompt = Instance.new("ProximityPrompt");
	local TimesTriggered = 0;
	
	ProximityPrompt.Parent = Info.Part;
	ProximityPrompt.HoldDuration = Info.HoldDuration;
	ProximityPrompt.ActionText = Info.Text;
	ProximityPrompt.MaxActivationDistance = Info.Magnitude;
	ProximityPrompt.ObjectText = "Hold";
	ProximityPrompt.HoldDuration = Info.HoldDuration;
	
	if Info.HoldDuration < 1 then
		ProximityPrompt.ObjectText = "";
		ProximityPrompt.HoldDuration = 0;
	end;
	
	ProximityPrompt.Triggered:Connect(function(Player)
		if (Info.Part.Position - Player.Character.HumanoidRootPart.Position).Magnitude < Info.Magnitude then
			if Info.MaxTriggers > TimesTriggered then
				Info.Callback();
				TimesTriggered = TimesTriggered + 1;
			else
				print("You have triggered more times than you are allowed to! You can't do that!");
			end;
		end;
	end);
end;

CreateProximityPrompt({
	Text = "Interact",
	HoldDuration = 1,
	Magnitude = 35,
	Part = workspace.SpawnLocation,
	MaxTriggers = 2,
	Callback = function()
		print("Hello World!")
	end,
});
