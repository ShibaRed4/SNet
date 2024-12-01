local StateManager = {}
StateManager.__index = StateManager 

local SNet = require(script.Parent.Parent.Util.SNet).new()

function StateManager.new()
	local self = setmetatable({}, StateManager) 
	return self
end

function StateManager:EnterState(newState: string)

	if newState == self:GetState() then
		warn(`[StateMachine]: player is already in {newState}`)
	end

	local nextState = self.States[newState]

	if not table.find(nextState.validFrom, self:GetState()) then
		error(`[StateMachine]: {newState} does not accept {self:GetState()} as a valid prior state to transition from.`)
		return
	end


	SNet:EmitEvent(script.Name, "WriteState", newState)
end


function StateManager:GetState()
	return SNet:EmitCallback(script.Name, "GetState")
end

function StateManager.Package()
	return require(script.EmittableFunctions)
end
