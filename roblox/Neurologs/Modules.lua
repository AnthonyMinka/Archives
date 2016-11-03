-- Initial Startup Modules
-- Make sure to put it in neurologs.lua

-- Tests
--_G.LogADD(1, "shotty", {1,2});
--_G.LogADD(1, "died", {3,6,7});
--_G.LogADD(1, "blame", {1,3});
--print(_G.LogCMP(1, "shot", {1,2}));
--print(_G.LogPOP(1, "shotty", {1,2}));
--print(_G.LogRET(1,3,"blame", 1)[2]);
--_G.LogTrashCollector();
--print(_G.LogRET(1,2,"blame",nil));

-- Garbadge Module
while(wait(math.random(_G.TrashCollectorInterval,_G.TrashCollectorInterval+5))) do
	_G.LogTrashCollector();
end
