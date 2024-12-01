<p align="center">
  <img src="https://github.com/ShibaRed4/SNet/blob/main/.github/icon.png" alt="Qualitize Banner" />
</p>


<div align="center">

  <a href="">![LUA BABY](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)</a>
  <a href="">![ROBLOX](https://img.shields.io/badge/ROBLOX-FF0000?style=for-the-badge&logo=roblox&logoColor=white)</a>
  <a href="">![ROBLOX STUDIO](https://img.shields.io/badge/ROBLOX_STUDIO-00A2FF?style=for-the-badge&logo=robloxstudio&logoColor=white)</a>

</div>

<h1 align="center" style="font-size: 100px; font-weight: bold">SNet</h1>



<div align="center">
  <h2>A simple module that allows you to create network events within your modules. Whether it'd be server-client or client-server, this module can do it all!</h2>
</div>

# Usage: 

## Main Server Script:

```
local SNet = require(path.to.SNet).new()
local ExampleModule = require(path.to.ExampleModule)

-- SNet --

SNet:Rollup({
  -- List of ModuleScripts goes here --
  ExampleModule.Package()
})

SNet:Compose()
```

## Example Module Script:

```
local ExampleModule = {}
ExampleModule.__index = ExampleModule

function ExampleModule.new()
    local self = setmetatable({}, ExampleModule)
    return self
end

function ExampleModule.Package()
  return require(script.EmittableFunctions)
end
```

## Example EmittableFunctions (This goes inside of your module script):

```
local EmittableFunctions = {
	Server = {
		Events = {
			["TestServerEvent"] = function(player, ...) -- "TestServerEvent" will be known as the "eventName"
			end
		},
		Callbacks = {
			["TestServerCallback"] = function(player, ...)
				return "Hello World"
			end
		},
	},
	Client = {
		Events = {
			["TestClientEvent"] = function(...)
				
			end,
		},
		Callbacks = {
			["TestClientCallback"] = function(...)
				return "Hello World from Client!"
			end,
		}
	},
	Name = script.Parent.Name -- "This will be youir "hostName"
}

return EmittableFunctions
```

# Methods:
- SNet:EmitCallback(hostName: string, callbackName: string, ...)
- SNet:EmitEvent(hostName: string, eventName: string, ...)
- SNet:EmitClientEvent(player: Player, hostName: string, eventName: string, ...)
- SNet:EmitClientCallback(player: Player, hostName: string, eventName: string, ...)
- SNet:EmitAllClientEvent(hostName: string, eventName: string, ...)


# Why should I use this?

So you don't have multiple server scripts doing `RemoteEvent.OnServerEvent:Connect(function(player) end)` over and over again. Same thing with ClientSide events, it allows for better organization of your modules and logic. So instead of calling a (probably horribly named) remote event for a specific task, make a module that handles that task and other similar tasks, and when you need something done over the network, you can call methods that do it for you.
