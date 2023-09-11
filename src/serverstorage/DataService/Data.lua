function returnData()
	local data = {
		SaveIndex = 0;
		LastSaved = tick();
		
		--Stat Data
		Money = 1000;
	}

	return data
end

return returnData()