local MoneyService = {}

--// Variables
local Data = _G.Data

--// Functions
function MoneyService:AddMoney(player, amount)
	if not player or not amount then return end
	if not Data[player.UserId] then return end
	
	local playerData = Data[player.UserId].Data
	if not playerData then return end
	
	playerData.Money += amount
end

function MoneyService:RemoveMoney(player, amount)
	if not player or not amount then return end
	if not Data[player.UserId] then return end

	local playerData = Data[player.UserId].Data
	if not playerData then return end

	playerData.Money -= amount
end

function MoneyService:SetMoney(player, amount)
	if not player or not amount then return end
	if not Data[player.UserId] then return end

	local playerData = Data[player.UserId].Data
	if not playerData then return end

	playerData.Money = amount
end

function MoneyService:HasEnough(player, amount)
	if not player or not amount then return end
	if not Data[player.UserId] then return end

	local playerData = Data[player.UserId].Data
	if not playerData then return end
	
	if playerData.Money >= amount then
		return true
	end
	
	return false
end

return MoneyService