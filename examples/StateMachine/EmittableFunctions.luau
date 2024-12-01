-- @StateManagement

local EmittableFunctions = {
	Server = {
		Events = {
			["WriteState"] = function(player: Player, newState: string)
				local Character = player.Character
				local State = Character:FindFirstChild('State')

				State.Value = newState
			end,
		},
		Callbacks = {
			["GetState"] = function(player: Player)
				local Character = player.Character
				local State: StringValue = Character:WaitForChild('State')

				return State.Value
			end,
		}
	},
	Name = script.Parent.Name
}

return EmittableFunctions
