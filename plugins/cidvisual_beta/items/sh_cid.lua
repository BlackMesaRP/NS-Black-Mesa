ITEM.name = "Citizen ID"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.uniqueID = "cid2"
ITEM.desc = "An ID cards with the digits %Digits|00000% assigned to %Owner|no one%."
ITEM.functions = {}
ITEM.functions.ShowID = {
	menuOnly = true,
	text = "Show ID Forward",
	tip = "Show this CID to someone in front of you.",
	icon = "icon16/arrow_up.png",
	run = function(itemTable, client, data, entity)
			if (SERVER) then
			local td = {}
				td.start = client:GetShootPos()
				td.endpos = td.start + client:GetAimVector()*84
				td.filter = client
			local trace = util.TraceLine(td)
			local entity = trace.Entity

			if (IsValid(entity) and entity:IsPlayer() and entity.character) then
				entity:ShowCID( client, data.Digits, data.Owner, data.Model, data.Forged )
			end
		end
		return false
	end
}

ITEM.functions.ViewID = {
	text = "View ID Card",
	tip = "Examine this ID Card.",
	icon = "icon16/application_view_list.png",
	run = function(itemTable, client, data, entity)
		if ( SERVER ) then
			if (IsValid(client) and client:IsPlayer() and client.character) then
				client:ShowCID( client, data.Digits, data.Owner, data.Model, data.Forged, true )
			end
		end
		return false
	end
}
