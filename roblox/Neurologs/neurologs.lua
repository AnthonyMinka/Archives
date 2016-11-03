_G.LogMatrix = {};
_G.LogTrashCollectorDelay = game.ServerScriptService.Configurations["BigData.h"].TrashCollectorDelay.Value;
_G.TrashCollectorInterval = game.ServerScriptService.Configurations["BigData.h"].TrashCollectorInterval.Value;
_G.LogUsable = true;

-- Adds an entry to the LogMatrix table.
_G.LogADD = (function(flag, data, args)
	while _G.LogUsable == false do
		wait();
	end
	_G.LogUsable = false;
	wait();
	local counter = #_G.LogMatrix+1; -- Reduces the amount of corruption;
	_G.LogMatrix[counter] = {};
	_G.LogMatrix[counter][1] = time();
	_G.LogMatrix[counter][2] = flag;
	_G.LogMatrix[counter][3] = data;
	_G.LogMatrix[counter][4] = args;
	_G.LogUsable = true;
end)

-- Removes an entry from the LogMatrix table.
_G.LogPOP = (function(flag, data, args)
	while _G.LogUsable == false do
		wait();
	end
	_G.LogUsable = false;
	wait();
	local counter = #_G.LogMatrix;
	for i=1, counter do
		if (_G.LogMatrix[i]~=nil and (_G.LogMatrix[i][2] == flag) and (_G.LogMatrix[i][3] == data)) then
			for j=1, #_G.LogMatrix[i][4] do
				if (args[j] ~= _G.LogMatrix[i][4][j]) then
					_G.LogUsable = true;
					return false;
				end
			end
			_G.LogMatrix[i]=nil;
			_G.LogUsable = true;
			return true;
		end
	end
	_G.LogUsable = true;
	return false;
end)


--[[
	Returns first encountered from settings, from oldest to the most young.
	
	returned values:
		0:		returns data when args are the same
		1:		returns args when data is the same
		2:		returns the first entry that correspond to the the flag
		else: 	The value of the returned variable is decremented by 2 & returns the args if the argument in args according to the returned variable is the same.
--]]
_G.LogRET = (function(flag, returned, data, args)
	while _G.LogUsable == false do
		wait();
	end
	_G.LogUsable = false;
	wait();
	local counter = #_G.LogMatrix;
	for i=1, counter do
		if (_G.LogMatrix[i]~=nil and _G.LogMatrix[i][2] == flag) then
			if (returned == 0 and (#args == #_G.LogMatrix[i][4])) then
				for j=1, #args do
					if (_G.LogMatrix[i][4][j] ~= args[j]) then
						break;
					elseif (j==#args) then
						_G.LogUsable = true;
						return _G.LogMatrix[i][3];
					end
				end
			elseif (returned == 1) then
				if (_G.LogMatrix[i][3] == data) then
					_G.LogUsable = true;
					return _G.LogMatrix[i][4];
				end
			elseif (returned == 2) then
				_G.LogUsable = true;
				return _G.LogMatrix[i];
			elseif (_G.LogMatrix[i][3] == data and _G.LogMatrix[i][4][returned-2]==args) then
				_G.LogUsable = true;
				return _G.LogMatrix[i][4];
			end
		end
	end
	_G.LogUsable = true;
	return false;
end)

--_G.LogOR = (function(flag, data, args)
--	while _G.LogUsable == false do
--		wait();
--	end
--	for i=1, #_G.LogMatrix do
--		
--	end
--end)
--
--_G.LogAND = (function(flag, data, args)
--	while _G.LogUsable == false do
--		wait();
--	end
--	for i=1, #_G.LogMatrix do
--		
--	end
--end)
--
--_G.LogXOR = (function(flag, data, args)
--	while _G.LogUsable == false do
--		wait();
--	end
--	for i=1, #_G.LogMatrix do
--		
--	end
--end)

-- Returns if match is found in entries.
_G.LogCMP = (function(flag, data, args)
	while _G.LogUsable == false do
		wait();
	end
	_G.LogUsable = false;
	wait();
	local counter = #_G.LogMatrix;
	for i=1, counter do
		if (_G.LogMatrix[i]~=nil and (_G.LogMatrix[i][2] == flag) and (_G.LogMatrix[i][3] == data)) then
			for j=1, #_G.LogMatrix[i][4] do
				if (args[j] ~= _G.LogMatrix[i][4][j]) then
					_G.LogUsable = true;
					return false;
				end
			end
			_G.LogUsable = true;
			return true;
		end
	end
	_G.LogUsable = true;
	return false;
end)

_G.LogTrashCollector = (function()
	while _G.LogUsable == false do
		wait();
	end
	_G.LogUsable = false;
	wait(_G.LogTrashCollectorDelay);
	local temporaryLogMatrix = {};
	local counter = #_G.LogMatrix;
	local counter2 = 1;
	for i=1, counter do
		if (_G.LogMatrix[i]~=nil and (time() - _G.LogMatrix[i][1] <= _G.TrashCollectorInterval)) then
			temporaryLogMatrix[counter2] = {};
			temporaryLogMatrix[counter2][1] = _G.LogMatrix[i][1];
			temporaryLogMatrix[counter2][2] = _G.LogMatrix[i][2];
			temporaryLogMatrix[counter2][3] = _G.LogMatrix[i][3];
			temporaryLogMatrix[counter2][4] = _G.LogMatrix[i][4];
			counter2=counter2+1;
		end
	end
	_G.LogMatrix = temporaryLogMatrix;
	_G.LogUsable = true;
end)

script.Modules.Disabled = false;
