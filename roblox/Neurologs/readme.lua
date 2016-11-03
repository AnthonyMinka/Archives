--[[
	README 1.1
	
	Fixes: table corruptions fixed. x2
	
	Settings:
		Located under the NeuroLogs script.
		TrashCollectorDelay:		Delay before the trash gets cleaned up when the function is activated.
		TrashCollectorInterval:		Interval between the automatic garbadge cleanups. (Keep in mind that its possible for the data to be badly cleaned up, so always cut the original value in half)
	
	The following functions can be used to do what you want, if you need more functions, ask away, also okay if you want things changed.
	
	Notes: the flag setting must always be an integer & the script goes into the ServerScriptService.
	
	_G.LogCMP = (function(flag, data, args)
	Syntax:	 _G.LogCMP(flag, data, args);
	This function allows you to check if a specific entry was logged.
	The return value is a boolean, meaning true or false.
	
	_G.LogTrashCollector = (function()
	Syntax: 	_G.LogTrashCollector();
	This function allows you to manually activate the garbadge collector.
	There's no return value, altought after activated, no logging will be available, the logging functions will be suspended untill the garbadge collection is done.
	Note: This function is automaticly activated in the Modules script.
	
	_G.LogRET = (function(flag, returned, data, args)
	Syntax: 	_G.LogRET(flag, returned, data, args);
	This function returns the first encountered from the settings & from the oldest to the most recent entry in the log table.
	Note: The function will return false if the value is not found.
	Returned setting values:
		0:		returns data when args are the same
		1:		returns args when data is the same
		2:		returns the first entry that correspond to the the flag
		else: 	The value of the returned variable is decremented by 2 & returns the args if the argument in args according to the returned variable is the same.
	
	_G.LogADD = (function(flag, data, args)
	Syntax: 	_G.LogADD(flag, data, args);
	This function allows you to add an entry to the log table.
	Note: how you use the settings is up to you, meaning you decide how the settings are interpreted, has long has the flag setting is always an integer.
	
	_G.LogPOP = (function(flag, data, args)
	Syntax: 	_G.LogPOP(flag, data, args);
	This function allows you to remove an entry in the log table.
	It returns a boolean value, true if it was removed, false if it wasnt found.
	Note: how you use the settings is up to you, meaning you decide how the settings are interpreted, has long has the flag setting is always an integer.
	
	To be added:
		1. nil
		
	Has always, enjoy :)
	
--]]
