-------------------------------------------------------------------------------
--- AUTHORS: iSarCasm, Nostrademous
--- GITHUB REPO: https://github.com/Nostrademous/Dota2-WebAI
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--- CODE SPECIFIC
-------------------------------------------------------------------------------

globalInit = false

function InitializeGlobalVars()
    heroData = require( GetScriptDirectory().."/hero_data" )
    globalInit = true
end

function GetTableKeyNameFromID( hTable, iIndex )
	if hTable == nil or iIndex == nil then
		return "nil"
	end

	for key, value in pairs(hTable) do
		if value == iIndex then
			return tostring(key)
		end
	end
	
	return nil
end

-------------------------------------------------------------------------------
--- DOTA2 SPECIFIC
-------------------------------------------------------------------------------

function GetShop()
    if (GetTeam() == TEAM_RADIANT) then
        return SHOP_RADIANT
    elseif (GetTeam() == TEAM_DIRE) then
        return SHOP_DIRE
    end
end

function GetEnemyTeam()
    if (GetTeam() == TEAM_RADIANT) then
        return TEAM_DIRE
    elseif (GetTeam() == TEAM_DIRE) then
        return TEAM_RADIANT
    end
end

function GetFront(Team, Lane)
    return GetLaneFrontLocation(Team, Lane, GetLaneFrontAmount(Team, Lane, true))
end

function Safelane()
    return ((GetTeam() == TEAM_RADIANT) and LANE_BOT or LANE_TOP)
end

function Hardlane()
    return ((GetTeam() == TEAM_RADIANT) and LANE_TOP or LANE_BOT)
end

function GetSeconds()
    return math.floor(DotaTime()) % 60
end
