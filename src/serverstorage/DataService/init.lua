local DataService = {}

_G.Data = {}
local Data = _G.Data

--// Services
local PlayerService = game:GetService("Players")
local ProfileService = require(script.ProfileService)

--// Modules
local DataTemplate = require(script.Data)

--// Variables
local dataVersion = "0.2"
local gameProfileStore = ProfileService.GetProfileStore(
	"PlayerData"..dataVersion,
	DataTemplate
)

function DataService:Load(player)
	local profile = gameProfileStore:LoadProfileAsync(
		"Player_"..player.UserId,
		"ForceLoad"
	)

	if profile ~= nil then
		profile:Reconcile()
		profile:ListenToRelease(function()
			Data[player.UserId] = nil
			player:Kick()
		end)

		if player:IsDescendantOf(PlayerService) then
			Data[player.UserId] = profile
			return _G.Data[player.UserId]
		else
			profile:Release()
		end
	else
		player:Kick("Data was unable to load, please try rejoining, if multiple attempts have failed, contact a Developer")
	end
end

function DataService:Save(player)
	local profile = Data[player.UserId]
	if not profile then return end

	profile:Release()
end

return DataService
