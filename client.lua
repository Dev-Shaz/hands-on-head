--I got asked to make it so i made this quick hands on head script. 
local handsonhead = false

RegisterCommand("handsonhead", function()
    handonhead()
end)


RegisterKeyMapping("handsonhead", "Hands on head", "keyboard", "Z")

function handonhead()
	while not HasAnimDictLoaded("random@arrests@busted") do
        RequestAnimDict("random@arrests@busted")
        Citizen.Wait(5)
    end
	if not handsonhead then 
		handsonhead = true
		TaskPlayAnim(PlayerPedId(), "random@arrests@busted", "idle_c", 3.0, 1.0, -1, 50, 0, false, false, false)
	else
		handsonhead = false
		ClearPedTasks(PlayerPedId())
	end
end



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_c", 3) then
			DisableControlAction(0, 24, true) -- attack
			DisableControlAction(0, 25, true) -- aim
			DisableControlAction(0, 37, true) -- weapon wheel
			DisableControlAction(0, 44, true) -- cover
			DisableControlAction(0, 45, true) -- reload
			DisableControlAction(0, 140, true) -- light attack
			DisableControlAction(0, 141, true) -- heavy attack
			DisableControlAction(0, 142, true) -- alternative attack
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
		end
	end
end)