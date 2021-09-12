local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
ed = Tunnel.getInterface("vrp_blips")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VÁRIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local read = true 

local blips = {
	[1] = {['x'] = 826.21, ['y'] = 1372.23, ['z'] = 348.52, ['icone'] = 84,	['cor'] = 1, ['nome'] = "Favela do C.V", ['tamanho'] = 0.6,
	['perm'] = "cv.permissao"},

	[2] = {['x'] = 596.21, ['y'] = 1372.23, ['z'] = 348.52, ['icone'] = 469, ['cor'] = 2, ['nome'] = "Farm de Maconha", ['tamanho'] = 0.6,
	['perm'] = "cv.permissao"},

	[3] = {['x'] = 826.21, ['y'] = 1072.23, ['z'] = 348.52, ['icone'] = 429, ['cor'] = 12, ['nome'] = "Favela do PCC", ['tamanho'] = 0.6,
	['perm'] = "pcc.permissao"},

	[4] = {['x'] = 596.21, ['y'] = 1372.23, ['z'] = 548.52, ['icone'] = 499, ['cor'] = 12, ['nome'] = "Farm de Cocaína", ['tamanho'] = 0.6,
	['perm'] = "pcc.permissao"},

} 
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGORITIMO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	if read then
		for e,d in pairs(blips) do

			if ed.checkPerm(d.perm) then
				setBlip(d.x,d.y,d.z,d.icone,d.cor,d.tamanho,d.nome)
			end
		end
	end
end)

function setBlip(x,y,z,icone,cor,tamanho,texto)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip,icone)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,cor)
	SetBlipScale(blip,tamanho)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(texto)
	EndTextCommandSetBlipName(blip)
end