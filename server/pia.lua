local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ed = {}
Tunnel.bindInterface("vrp_blips",ed)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
function ed.checkPerm(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,perm) then
			return true
		else
			return false
		end
	end
end