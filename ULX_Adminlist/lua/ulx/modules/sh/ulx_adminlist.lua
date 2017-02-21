local CATEGORY_NAME = "Chat"


function ulx.listadmins(calling_ply)


	--hard coded values. Change if rank in game ever changes. 
	local rank_check = {'helper','moderator','admin','superadmin','owner'}


	if IsValid(calling_ply) and calling_ply ~= "Console" then 
		local admins_online = {}
		for _ , ply in pairs(player.GetAll()) do

			--encase the hard coded values are changed and updating this is slow, we'll just get any rank t hat inherits from admin
			if IsValid(ply) and table.HasValue(rank_check,ply:GetUserGroup()) or ply:IsAdmin() then
				table.insert(admins_online, ply)
			end
		end
		if #admins_online >= 1 then
			ulx.fancyLogAdmin( calling_ply, "Currently online admins: #T", admins_online )
		else
			ULib.tsayError(	calling_ply, "No admins are currently online.",true	)
		end

	end
end
local adminlist = ulx.command(CATEGORY_NAME, "ulx stafflist", ulx.listadmins, "stafflist", true)
adminlist:defaultAccess( ULib.ACCESS_ALL )
adminlist:help("Shows a list of currently online administrators.")