-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")

------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
lCP = {}
Tunnel.bindInterface("lc_academia",lCP)
vCLIENT = Tunnel.getInterface("lc_academia")
vPLAYER = Tunnel.getInterface("player")


-- function lCP.startAnim(anim,b,prop)
-- 	local source = source
-- 	if source ~= nil then
-- 		vRPC.playAnim(source,false,{anim,b},false)
-- 		TriggerClientEvent("inventory:Cancel",source,true)
-- 	end
-- end

-- function lCP.stopAnim()
-- 	local source = source
-- 	if source ~= nil then
-- 		vRPC.stopAnim(source,false)
-- 		TriggerClientEvent("inventory:Cancel",source,false)
-- 		FreezeEntityPosition(source,false)
-- 	end
-- end

function lCP.startExercice(qtd)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		vRP.setWeight(user_id,qtd)
		TriggerClientEvent("Notify",source,"verde","Bora monstro, adquirido mais "..qtd.."kg na mochila!",8000)
	end
end

function lCP.stopExercice()
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		TriggerClientEvent("Notify",source,"verde","Sessão de exercícios finalizada, inicie outra sessão caso queira mais mochila",5000)
		TriggerClientEvent("inventory:blockButtons",source,false)
		FreezeEntityPosition(source,false)
	end
end
 function lCP.checkBackpack()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getWeight(user_id) >= 100 then
			TriggerClientEvent("Notify",source,"amarelo","Sua mochila atingiu o limite máximo",5000)
			return false
		else 
			return true
		end
	end
 end

 function lCP.checkBackpack2()
	local source = source
	TriggerClientEvent("player:Commands",source,true)
	TriggerClientEvent("inventory:Buttons",source,true)
end

function lCP.checkBackpack3()
	local source = source
	TriggerClientEvent("player:Commands",source,false)
	TriggerClientEvent("inventory:Buttons",source,false)
end

