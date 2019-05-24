

me_attacksperround = {"0", "1", "2", "3", "4", "5", "1/2", "3/2", "5/2", "7/2", "9/2"}
me_attacksperround_haste = {"0", "2", "4", "6", "8", "10", "1", "3", "5", "7", "9"}
me_classids = {"Mage", "Fighter", "Cleric", "Thief", "Bard", "Paladin", "Fighter/Mage", "Fighter/Cleric", "Fighter/Thief", "Fighter/Mage/Thief", "Druid", "Ranger", "Mage/Thief", "Cleric/Mage", "Cleric/Thief", "Fighter/Druid", "Fighter/Mage/Cleric", "Cleric/Ranger", "Sorcerer", "Monk", "Shaman"}
me_monsterclassids = {"Ankheg", "Basilisk", "Greater Basilisk", "Black Bear", "Brown Bear", "Cave Bear", "Polar Bear", "Carrion Crawler", "Wild Dog", "War Dog", "Doppelganger", "Greater Doppelganger", "Drizzt", "Elminster", "Ettercap", "Ghoul", "Revenant", "Ghast", "Gibberling", "Gnoll", "Hobgoblin", "Kobold", "Tasloi", "Xvart", "Ogre", "Ogre Mage", "Half-ogre", "Ogrillion", "Sarevok", "Sirine", "Dryad", "Nereid", "Nymph", "Skeleton", "Skeleton Warrior", "Skeleton Boneguard", "Giant Spider", "Huge Spider", "Phase Spider", "Sword Spider", "Wraith Spider", "Volo", "Wolf", "Worg", "Dire Wolf", "Winter Wolf", "Vampiric Wolf", "Dread Wolf", "Wyvern", "Olive Slime", "Mustard Jelly", "Ochre Jelly", "Gray Ooze", "Green Slime", "Innocent", "Flaming Fist", "Werewolf", "Wolfwere", "Death Knight", "Demon", "Beholder", "Mind Flayer", "Vampire", "Vampyre", "Otyugh", "Rakshasa", "Troll", "Umber Hulk", "Sahuagin", "Shadow", "Spectre", "Wraith", "Kuo-toa", "Mist Creature", "Cat", "Duergar", "Mephit", "Mimic", "Devil", "Giant", "Orc", "Iron Golem", "Flesh Golem", "Stone Golem", "Clay Golem", "Air Elemental", "Fire Elemental", "Earth Elemental", "Fat Spider Woman", "Red Dragon", "Shadow Dragon", "Silver Dragon", "Djinni", "Dao", "Efreeti", "Noble Djinni", "Noble Efreeti", "Zombie", "Prey", "Predator", "Long Sword", "Mage", "Fighter", "Cleric", "Thief", "Bard", "Paladin", "Druid", "Ranger", "Wizard Eye", "Watcher", "Amnian Soldier", "Town Guard", "creature of unknown class", "creature of unknown class", "creature of unknown", "creature of unknown class", "creature of unknown class", "Water Elemental", "Green Dragon", "Neothelid", "Spectral Troll", "Wight", "creature of unknown class", "creature of unknown class"}
me_kitids = {[64] = "Abjurer", [128] = "Conjurer", [256] = "Diviner", [512] = "Enchanter", [1024] = "Illusionist", [2048] = "Invoker", [4096] = "Necromancer", [8192] = "Transmuter", [16385] = "Berserker", [16386] = "Wizard Slayer", [16387] = "Kensai", [16388] = "Cavalier", [16389] = "Inquisitor", [16390] = "Undead Hunter", [16391] = "Archer", [16392] = "Stalker", [16393] = "Beastmaster", [16394] = "Assassin", [16395] = "Bounty Hunter", [16396] = "Swashbuckler", [16397] = "Blade", [16398] = "Jester", [16399] = "Skald", [16400] = "Totemic Druid", [16401] = "Shapeshifter", [16402] = "Avenger", [16403] = "Priest of Talos", [16404] = "Priest of Helm", [16405] = "Priest of Lathander", [16416] = "Blackguard", [16417] = "Shadowdancer", [16418] = "Dwarven Defender", [16419] = "Dragon Disciple", [16420] = "Dark Moon Monk", [16421] = "Sun Soul Monk", [16424] = "Priest of Tyr", [16425] = "Priest of Tempus", [1073741824] = "Barbarian"}

function MESTATPR(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)

--	EEex_AlterActorEffect(targetID,{{"opcode",232}}, {{"parameter3",0}},-1)
--	local g_pBaldurChitin = EEex_ReadDword(EEex_Label("g_pBaldurChitin"))
--	local m_pObjectGame = EEex_ReadDword(g_pBaldurChitin + EEex_Label("CBaldurChitin::m_pObjectGame"))
	
--	EEex_WriteDword(creatureData + 0x2796, 0x343033)
--	Infinity_DisplayString(EEex_ReadWord(m_pObjectGame + 0x47EC, 0x0))
--	Infinity_DisplayString(EEex_ReadWord(m_pObjectGame + 0x47EE, 0x0))
--	EEex_Call(EEex_Label("CGameChunk::CGameChunk"), {0x0, targetID, 120, "MINSC01", 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, me_malloc, 0x0)
--	EEex_Call(EEex_Label("CGameSprite::Shatter"), {0x0}, creatureData, 0x0)
	me_class = EEex_GetActorClass(targetID)
	me_level1 = EEex_GetActorStat(targetID, 34)
	if (me_class >= 7 and me_class <= 10) or (me_class >= 13 and me_class <= 18) then
		me_level2 = "/" .. EEex_GetActorStat(targetID, 68)
	else
		me_level2 = ""
	end
	if me_class == 10 or me_class == 17 then
		me_level3 = "/" .. EEex_GetActorStat(targetID, 69)
	else
		me_level3 = ""
	end
	me_kit_string = ""
	me_kit_string_found = false
	for key,value in pairs(me_kitids) do
		if key == EEex_GetActorKit(targetID) then
			me_kit_string = value
			me_kit_string_found = true
		end
	end
	if EEex_GetActorKit(targetID) == -2147483648 then
		me_kit_string = "Wild Mage"
		me_kit_string_found = true
	end
	if me_kit_string_found == true then
		Infinity_DisplayString("Level " .. me_level1 .. me_level2 .. me_level3 .. " " .. me_kit_string)
	else
		if me_class >= 1 and me_class <= 21 then
			Infinity_DisplayString("Level " .. me_level1 .. me_level2 .. me_level3 .. " " .. me_classids[me_class])
		elseif me_class >= 101 and me_class <= 223 then
			Infinity_DisplayString("Level " .. me_level1 .. " " .. me_monsterclassids[me_class - 100])
		else
			Infinity_DisplayString("Level " .. me_level1 .. " creature of unknown class")
		end
	end
	
	Infinity_DisplayString("Hit Points: " .. EEex_ReadWord(creatureData + 0x438, 0x0) .. "/" .. EEex_GetActorStat(targetID, 1))
	Infinity_DisplayString("AC vs. slashing: " .. EEex_GetActorStat(targetID, 2) + EEex_GetActorStat(targetID, 6) .. "  AC vs. piercing: " .. EEex_GetActorStat(targetID, 2) + EEex_GetActorStat(targetID, 5) .. "  AC vs. crushing: " .. EEex_GetActorStat(targetID, 2) + EEex_GetActorStat(targetID, 3) .. "  AC vs. missiles: " .. EEex_GetActorStat(targetID, 2) + EEex_GetActorStat(targetID, 4))
	Infinity_DisplayString("Base THAC0: " .. EEex_GetActorStat(targetID, 7))
--	Infinity_DisplayString("Gold: " .. characters[id].gold)
--	Infinity_DisplayString("Base THAC0: " .. EEex_ReadByte(creatureData + 0x466, 0x0))
	if bit32.band(EEex_ReadDword(creatureData + 0x434), 0x8000) == 0x8000 or bit32.band(EEex_ReadDword(creatureData + 0xB30), 0x8000) == 0x8000 or EEex_GetActorStat(targetID, 155) > 0 then
		Infinity_DisplayString("Attacks per round: " .. me_attacksperround_haste[EEex_GetActorStat(targetID, 8) + 1])
	else
		Infinity_DisplayString("Attacks per round: " .. me_attacksperround[EEex_GetActorStat(targetID, 8) + 1])
	end
	Infinity_DisplayString("Attributes: ")
	if EEex_GetActorStat(targetID, 37) == 0 then
		me_strextra = ""
	elseif EEex_GetActorStat(targetID, 37) >= 100 then
		me_strextra = "/00"
	else
		me_strextra = "/" .. EEex_GetActorStat(targetID, 37)
	end
	Infinity_DisplayString("Strength: " .. EEex_GetActorStat(targetID, 36) .. me_strextra .. "  Dexterity: " .. EEex_GetActorStat(targetID, 40) .. "  Constitution: " .. EEex_GetActorStat(targetID, 41) .. "  Intelligence: " .. EEex_GetActorStat(targetID, 38) .. "  Wisdom: " .. EEex_GetActorStat(targetID, 39) .. "  Charisma: " .. EEex_GetActorStat(targetID, 42))
	Infinity_DisplayString(MEGetStat(targetID, "Slashing Resistance: ", 21, "%\n") .. MEGetStat(targetID, "Piercing Resistance: ", 23, "%\n") .. MEGetStat(targetID, "Crushing Resistance: ", 22, "%\n") .. MEGetStat(targetID, "Missile Resistance: ", 24, "%\n") .. MEGetStat(targetID, "Fire Resistance: ", 14, "%\n") .. MEGetStat(targetID, "Magical Fire Resistance: ", 19, "%\n") .. MEGetStat(targetID, "Cold Resistance: ", 15, "%\n") .. MEGetStat(targetID, "Magical Cold Resistance: ", 20, "%\n") .. MEGetStat(targetID, "Electricity Resistance: ", 16, "%\n") .. MEGetStat(targetID, "Acid Resistance: ", 17, "%\n") .. MEGetStat(targetID, "Poison Resistance: ", 74, "%\n") .. MEGetStat(targetID, "Magic Damage Resistance: ", 73, "%\n") .. MEGetStat(targetID, "Magic Resistance: ", 18, "%\n"))
	Infinity_DisplayString("Saving Throws: ")
	Infinity_DisplayString("Spell: " .. EEex_GetActorStat(targetID, 13) .. "  Death: " .. EEex_GetActorStat(targetID, 9) .. "  Breath: " .. EEex_GetActorStat(targetID, 12) .. "  Wands: " .. EEex_GetActorStat(targetID, 10) .. "  Polymorph: " .. EEex_GetActorStat(targetID, 11))
	Infinity_DisplayString(MEGetStat(targetID, "Backstab multiplier: ", 56, "x\n") .. MEGetStat(targetID, "Stoneskins remaining: ", 88, "\n") .. MEGetStat(targetID, "Casting time reduced by ", 77, "\n"))
	if EEex_GetActorStat(targetID, 79) > 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " casts wizard spells as if " .. EEex_GetActorStat(targetID, 79) .. " levels higher")
	end	
	if EEex_GetActorStat(targetID, 53) ~= 100 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " casts wizard spells with " .. EEex_GetActorStat(targetID, 53) .. "% the normal duration")
	end	
	if EEex_GetActorStat(targetID, 80) > 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " casts priest spells as if " .. EEex_GetActorStat(targetID, 80) .. " levels higher")
	end	
	if EEex_GetActorStat(targetID, 54) ~= 100 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " casts priest spells with " .. EEex_GetActorStat(targetID, 54) .. "% the normal duration")
	end	
	if EEex_GetActorStat(targetID, 76) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " can cast more than one spell per round")
	end
	if EEex_GetActorStat(targetID, 81) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " can see invisible creatures")
	end
	if EEex_GetActorStat(targetID, 191) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " can use any item")
	end
	if EEex_GetActorStat(targetID, 197) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is immune to time stop")
	end
	if EEex_GetActorStat(targetID, 175) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " cannot be backstabbed")
	end
	if EEex_GetActorStat(targetID, 187) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " cannot be turned")
	end
	if EEex_GetActorStat(targetID, 83) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " cannot be reduced below " .. EEex_GetActorStat(targetID, 83) .. " HP")
	end
	if EEex_GetActorStat(targetID, 192) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " will backstab on each hit")
	end
	if EEex_GetActorStat(targetID, 181) == 1 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is under the effect of Protection from Normal Weapons")
	end
	if EEex_GetActorStat(targetID, 128) == 1 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is under the effect of Mantle")
	elseif EEex_GetActorStat(targetID, 128) == 2 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is under the effect of Improved Mantle")
	elseif EEex_GetActorStat(targetID, 128) == 3 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is under the effect of Absolute Immunity")
	elseif EEex_GetActorStat(targetID, 128) == 4 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " is under the effect of Protection from Magical Weapons")
	end
	if EEex_GetActorStat(targetID, 122) ~= 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " will reflect missile attacks")
	end
	if EEex_GetActorStat(targetID, 145) > 19 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " will deal maximum damage with each hit")
	end
	if EEex_GetActorStat(targetID, 146) > 0 then
		if EEex_GetActorStat(targetID, 146) > 19 then
			Infinity_DisplayString(EEex_GetActorName(targetID) .. " will critically hit on every attack")
		else
			Infinity_DisplayString(EEex_GetActorName(targetID) .. " will critically hit on a roll between " .. 20 - EEex_GetActorStat(targetID, 146) .. " and 20")
		end
	end
	if EEex_GetActorStat(targetID, 200) > 0 then
		Infinity_DisplayString(EEex_GetActorName(targetID) .. " has been drained " .. EEex_GetActorStat(targetID, 200) .. " levels")
	end	

end

function MEGetStat(targetID, pre, stat, post)
	if EEex_GetActorStat(targetID, stat) == 0 then
		return ""
	else
		return pre .. EEex_GetActorStat(targetID, stat) .. post
	end
end

me_ghost_walk_dest_x = {}
me_ghost_walk_dest_y = {}
me_ghost_walk_area = {}

function MEGHOWST(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	me_ghost_walk_dest_x["" .. targetID] = EEex_ReadDword(creatureData + 0x3404)
	me_ghost_walk_dest_y["" .. targetID] = EEex_ReadDword(creatureData + 0x3408)
	me_ghost_walk_area["" .. targetID] = EEex_GetActorAreaRes(targetID)
end

function MEGHOWS2(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local destx = EEex_ReadDword(creatureData + 0x3404)
	local desty = EEex_ReadDword(creatureData + 0x3408)
--	Infinity_DisplayString("Going to: [" .. destx .. "." .. desty .. "]")
	if destx > 0 or desty > 0 then
--		EEex_LuaObject = targetID
		me_ghost_walk_dest_x["" .. targetID] = destx
		me_ghost_walk_dest_y["" .. targetID] = desty
		me_ghost_walk_area["" .. targetID] = EEex_GetActorAreaRes(targetID)
		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 148,
["target"] = 1,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGHOWLK",
["source_x"] = x,
["source_y"] = y,
["target_x"] = destx,
["target_y"] = desty,
["source_target"] = targetID,
["source_id"] = targetID
})
	end
end

function MEGHOWLK(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local x = EEex_ReadDword(creatureData + 0x8)
	local y = EEex_ReadDword(creatureData + 0xc)
	local destx = EEex_ReadDword(creatureData + 0x3404)
	local desty = EEex_ReadDword(creatureData + 0x3408)
	local storedx = me_ghost_walk_dest_x["" .. targetID]
	local storedy = me_ghost_walk_dest_y["" .. targetID]
	local storedarea = me_ghost_walk_area["" .. targetID]
--	Infinity_DisplayString("storedarea = " .. storedarea)
--	Infinity_DisplayString("newarea = " .. EEex_GetActorAreaRes(targetID))
--	Infinity_DisplayString("Location: [" .. x .. "." .. y .. "]")
--	Infinity_DisplayString("Destination: [" .. storedx .. "." .. storedy .. "]")
--	Infinity_DisplayString("Destination New: [" .. destx .. "." .. desty .. "]")
	if EEex_GetActorAreaRes(targetID) ~= storedarea then
--		Infinity_DisplayString("oogo")
		me_ghost_walk_area["" .. targetID] = EEex_GetActorAreaRes(targetID)
		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 321,
["target"] = 1,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGHOWLK",
["source_target"] = targetID,
["source_id"] = targetID
})	
	elseif destx > 0 and desty > 0 and (destx ~= storedx or desty ~= storedy) then
--		Infinity_DisplayString("aga")
--		EEex_LuaObject = targetID
		me_ghost_walk_dest_x["" .. targetID] = destx
		me_ghost_walk_dest_y["" .. targetID] = desty
		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 148,
["target"] = 1,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGHOWLK",
["source_x"] = x,
["source_y"] = y,
["target_x"] = destx,
["target_y"] = desty,
["source_target"] = targetID,
["source_id"] = targetID
})
--	Infinity_DisplayString("igi")
--	elseif math.abs(x - storedx) < 10 and math.abs(y - storedy) < 10 then
--		EEex_LuaObject = targetID
--		C:Eval("ApplySpellRES(\"MEGHOWEN\", EEex_LuaObject)")
	end
end

function MEBIRDFS(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local destx = EEex_ReadDword(creatureData + 0x3404)
	local desty = EEex_ReadDword(creatureData + 0x3408)
--	Infinity_DisplayString("Going to: [" .. destx .. "." .. desty .. "]")
	if destx > 0 or desty > 0 then
		me_ghost_walk_dest_x["" .. targetID] = destx
		me_ghost_walk_dest_y["" .. targetID] = desty
		C:Eval("ActionOverride(\"MEBIRD" .. me_bird_id .. "\", FlyToPoint([" .. destx .. "." .. desty .. "], 15))")
--		C:Eval("ActionOverride(\"MEBIRD" .. me_bird_id .. "\", ReallyForceSpellPointRES(\"MEBIRDF2\", [" .. destx .. "." .. desty .. "]))")
	end
end

function MEBIRDFL(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local x = EEex_ReadDword(creatureData + 0x8)
	local y = EEex_ReadDword(creatureData + 0xc)
	local destx = EEex_ReadDword(creatureData + 0x3404)
	local desty = EEex_ReadDword(creatureData + 0x3408)
	local me_bird_id = EEex_GetActorLocal(targetID, "ME_Bird_ID")
	local storedx = me_ghost_walk_dest_x["" .. targetID]
	local storedy = me_ghost_walk_dest_y["" .. targetID]
--	Infinity_DisplayString("Location: [" .. x .. "." .. y .. "]")
--	Infinity_DisplayString("Destination: [" .. storedx .. "." .. storedy .. "]")
	if destx > 0 and desty > 0 and (destx ~= storedx or desty ~= storedy) then
		me_ghost_walk_dest_x["" .. targetID] = destx
		me_ghost_walk_dest_y["" .. targetID] = desty
		C:Eval("ActionOverride(\"MEBIRD" .. me_bird_id .. "\", FlyToPoint([" .. destx .. "." .. desty .. "], 15))")
--		C:Eval("ActionOverride(\"MEBIRD" .. me_bird_id .. "\", ReallyForceSpellPointRES(\"MEBIRDF2\", [" .. destx .. "." .. desty .. "]))")
--	elseif math.abs(x - storedx) < 10 and math.abs(y - storedy) < 10 then
--		EEex_LuaObject = targetID
--		C:Eval("ApplySpellRES(\"MEGHOWEN\", EEex_LuaObject)")
	end
end

function MECREFLG(effectData, creatureData)
	local me_modifier = EEex_ReadDword(effectData + 0x18)
	local me_operand = EEex_ReadDword(effectData + 0x1c)
	local me_cre_flags = EEex_ReadDword(creatureData + 0x424)
	if me_operand == 0 then
		me_cre_flags = me_modifier
	elseif me_operand == 1 then
		me_cre_flags = bit32.band(me_cre_flags, me_modifier)
	elseif me_operand == 2 then
		me_cre_flags = bit32.bor(me_cre_flags, me_modifier)
	elseif me_operand == 3 then
		me_cre_flags = bit32.bxor(me_cre_flags, me_modifier)
	elseif me_operand == 4 then
		me_cre_flags = bit32.band(me_cre_flags, bit32.bnot(me_modifier))
	end
	EEex_WriteDword(creatureData + 0x424, me_cre_flags)
end

function MEINKILL(effectData, creatureData)
		EEex_LuaObject = EEex_ReadDword(creatureData + 0x34)
		C:Eval("ApplySpellRES(\"MEINKILL\", EEex_LuaObject)")
end

function MESEARCH(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local read_size = EEex_ReadDword(effectData + 0x40)
	local search_end = EEex_ReadDword(effectData + 0x44)
	if read_size == 1 then
		local search_target = EEex_ReadByte(effectData + 0x18, 0x0)
		for i = 0, search_end, 1 do
			if EEex_ReadByte(creatureData + i, 0x0) == search_target then
				Infinity_DisplayString("Match found for " .. search_target .. " at offset " .. i)
			end
		end
	elseif read_size == 2 then
		local search_target = EEex_ReadWord(effectData + 0x18, 0x0)
		for i = 0, search_end, 1 do
			if EEex_ReadWord(creatureData + i, 0x0) == search_target then
				Infinity_DisplayString("Match found for " .. search_target .. " at offset " .. i)
			end
		end
	elseif read_size == 4 or read_size == 0 then
--		local search_target = EEex_ReadDword(effectData + 0x18)
		local search_target = EEex_ReadDword(effectData + 0x10C)
		for i = 0, search_end, 1 do
			if EEex_ReadDword(creatureData + i) == search_target then
				Infinity_DisplayString("Match found for " .. search_target .. " at offset " .. i)
			end
		end
	else
		local search_target = EEex_ReadLString(effectData + 0x18, 0x8)
		for i = 0, search_end, 1 do
			if EEex_ReadLString(creatureData + i, 0x8) == search_target then
				Infinity_DisplayString("Match found for " .. search_target .. " at offset " .. i)
			end
		end
	end
end

function MEPRINTO(effectData, creatureData)
	local offset = EEex_ReadDword(effectData + 0x1c)
	local read_size = EEex_ReadDword(effectData + 0x40)
	if read_size == 1 then
		Infinity_DisplayString("Byte at offset " .. offset .. " is " .. EEex_ReadByte(creatureData + offset, 0x0))
	elseif read_size == 2 then
		Infinity_DisplayString("Word at offset " .. offset .. " is " .. EEex_ReadWord(creatureData + offset, 0x0))
	elseif read_size == 4 or read_size == 0 then
		Infinity_DisplayString("Dword at offset " .. offset .. " is " .. EEex_ReadDword(creatureData + offset))
	else
		Infinity_DisplayString("String at offset " .. offset .. " is " .. EEex_ReadLString(creatureData + offset, 0x8))
	end
end

--[[
function MECORMOV(effectData, creatureData)
	local destx = EEex_ReadDword(creatureData + 0x34C)
	local desty = EEex_ReadDword(creatureData + 0x350)
	local destx2 = EEex_ReadDword(creatureData + 0x3404)
	local desty2 = EEex_ReadDword(creatureData + 0x3408)
	local destx3 = EEex_ReadDword(creatureData + 0x3568)
	local desty3 = EEex_ReadDword(creatureData + 0x356C)
--	Infinity_DisplayString("Going to: [" .. destx .. "." .. desty .. "]")
--	Infinity_DisplayString("Maybe going to: [" .. destx2 .. "." .. desty2 .. "]")
--	Infinity_DisplayString("Perhaps going to: [" .. destx3 .. "." .. desty3 .. "]")
	if destx > 0 and desty > 0 then
		EEex_LuaObject = EEex_ReadDword(creatureData + 0x34)
		if destx < 6000 and desty < 6000 then
			C:Eval("ActionOverride(EEex_LuaObject,ReallyForceSpellPointRES(\"MECORMOT\",[" .. destx .. "." .. desty .. "]))")
--		else
--			C:Eval("ActionOverride(EEex_LuaObject,ReallyForceSpellPointRES(\"MECORMOT\",[" .. destx2 .. "." .. desty2 .. "]))")
		end
	end
end
--]]

function MECORMOV(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local x = EEex_ReadDword(creatureData + 0x8)
	local y = EEex_ReadDword(creatureData + 0xC)
--	local destx = EEex_ReadDword(creatureData + 0x34C)
--	local desty = EEex_ReadDword(creatureData + 0x350)
--	local prevx = EEex_ReadDword(creatureData + 0x410)
--	local prevy = EEex_ReadDword(creatureData + 0x414)
	local destx2 = EEex_ReadDword(creatureData + 0x3404)
	local desty2 = EEex_ReadDword(creatureData + 0x3408)
--	local destx3 = EEex_ReadDword(creatureData + 0x3568)
--	local desty3 = EEex_ReadDword(creatureData + 0x356C)
	if destx2 > 0 then
--		Infinity_DisplayString("Going to: [" .. destx .. "." .. desty .. "]")
--		Infinity_DisplayString("Maybe going to: [" .. destx2 .. "." .. desty2 .. "]")
--		Infinity_DisplayString("Perhaps going to: [" .. destx3 .. "." .. desty3 .. "]")
    	EEex_ApplyEffectToActor(targetID, {
["opcode"] = 124,
["target"] = 1,
["timing"] = 1,
["source_id"] = targetID,
["target_target"] = targetID,
["source_x"] = x,
["source_y"] = y,
["target_x"] = destx2,
["target_y"] = desty2
})
	end

end


me_balance_current_hp = {}
me_balance_max_hp = {}

function MEBALCST(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	me_balance_current_hp["" .. targetID] = EEex_ReadWord(creatureData + 0x438, 0x0)
	EEex_WriteWord(creatureData + 0x438, EEex_ReadWord(effectData + 0x18, 0x0))
end

function MEBALCEN(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	EEex_WriteWord(creatureData + 0x438, me_balance_current_hp["" .. targetID])
	Infinity_DisplayString(me_balance_current_hp["" .. targetID])
	Infinity_DisplayString(EEex_ReadWord(creatureData + 0x438, 0x0))
end

function MEBALMST(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	me_balance_max_hp["" .. targetID] = EEex_ReadWord(creatureData + 0x43A, 0x0)
	EEex_WriteWord(creatureData + 0x43A, EEex_ReadWord(effectData + 0x18, 0x0))
end

function MEBALMEN(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	EEex_WriteWord(creatureData + 0x43A, me_balance_max_hp["" .. targetID])
end

function MEGOLDAB(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	if targetID == 0x0 then return end
	local g_pBaldurChitin = EEex_ReadDword(EEex_Label("g_pBaldurChitin"))
	local m_pObjectGame = EEex_ReadDword(g_pBaldurChitin + EEex_Label("CBaldurChitin::m_pObjectGame"))
	local me_gold_ability_count = math.floor((EEex_ReadDword(m_pObjectGame + 0x47E8) / EEex_ReadDword(effectData + 0x18)) + 1)
    EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 1,
["parameter1"] = me_gold_ability_count,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MECO326",
["source_target"] = targetID,
["source_id"] = targetID
})
end

function MEGAZE(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	local sourceID = EEex_ReadDword(effectData + 0x10C)
	if targetID == 0x0 or sourceID == 0x0 then return end
	local sourceData = EEex_GetActorShare(sourceID)
	local sourcex = EEex_ReadDword(sourceData + 0x8)
	local sourcey = EEex_ReadDword(sourceData + 0xC)
	local eyeContactDirection = EEex_GetActorRequiredDirection(targetID, sourcex, sourcey)
	local range = EEex_ReadDword(effectData + 0x1c)
	local check_if_facing = EEex_ReadDword(effectData + 0x44)
	local sourceDirection = EEex_GetActorDirection(sourceID)
	local targetDirection = EEex_GetActorDirection(targetID)
	if check_if_facing == 1 then
		if EEex_WithinCyclicRange(eyeContactDirection, targetDirection, range, 0, 15) and (not EEex_WithinCyclicRange(sourceDirection, targetDirection, 9 - range, 0, 15)) then
			local res_number = EEex_ReadDword(effectData + 0x18)
    		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 2,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGAZ" .. res_number,
["source_target"] = targetID,
["source_id"] = sourceID
})
		end
	else
		if (not EEex_WithinCyclicRange(eyeContactDirection, targetDirection, range, 0, 15)) or EEex_WithinCyclicRange(sourceDirection, targetDirection, 9 - range, 0, 15) then
			local res_number = EEex_ReadDword(effectData + 0x18)
    		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 2,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGAZ" .. res_number,
["source_target"] = targetID,
["source_id"] = sourceID
})
		end
	end
end
--[[
function MEGAZE(effectData, creatureData)
	local range = EEex_ReadDword(effectData + 0x1c)
	local check_if_facing = EEex_ReadDword(effectData + 0x44)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	if targetID == 0x0 then return end
	local sourceDirection = EEex_GetActorDirection(sourceID)
	local targetDirection = EEex_GetActorDirection(targetID)
	if check_if_facing == 1 then
		if not (EEex_WithinCyclicRange(sourceDirection, targetDirection, range, 0, 15)) then
			local res_number = EEex_ReadDword(effectData + 0x18)
    		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 2,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGAZ" .. res_number,
["source_target"] = targetID,
["source_id"] = sourceID
})
		end
	else
		if EEex_WithinCyclicRange(sourceDirection, targetDirection, range, 0, 15) then
			local res_number = EEex_ReadDword(effectData + 0x18)
    		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 2,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["duration"] = 100,
["resource"] = "MEGAZ" .. res_number,
["source_target"] = targetID,
["source_id"] = sourceID
})
		end
	end
end
--]]
function ME_FMC_ActionbarListener(config)
	local actorID = EEex_GetActorIDSelected()
	if actorID ~= 0x0 then
--		Infinity_DisplayString(config)
--		Infinity_DisplayString(EEex_GetActorClass(actorID))
	    if config == 16 and EEex_GetActorClass(actorID) == 17 then
	        EEex_SetActionbarButton(0x3, EEex_ACTIONBAR_TYPE.FIND_TRAPS)
	        EEex_SetActionbarButton(0x4, EEex_ACTIONBAR_TYPE.THIEVING)
	        EEex_SetActionbarButton(0x5, EEex_ACTIONBAR_TYPE.STEALTH)
	    end
	end
end
--EEex_AddActionbarListener(ME_FMC_ActionbarListener)

function MESETQSP(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	if targetID == 0x0 then return end
	local first_four = EEex_ReadDword(effectData + 0x18)
	local second_four = EEex_ReadDword(effectData + 0x1c)
	local slot_number = EEex_ReadDword(effectData + 0x44)
	EEex_WriteDword(creatureData + 0x275E + (0x34 * slot_number), first_four)
	EEex_WriteDword(creatureData + 0x2762 + (0x34 * slot_number), second_four)
end

function MESpellToPoint(actorID)
	EEex_AddActionHook(function(actionData)
		local spellActions = {
			[31]  = 95 , -- Spell => SpellPoint
			[113] = 114, -- ForceSpell => ForceSpellPoint
			[181] = 337, -- ReallyForceSpell => ReallyForceSpellPoint
			[191] = 192, -- SpellNoDec => SpellPointNoDec
		}
		local newActionID = spellActions[EEex_GetActionID(actionData)]
		if newActionID then
			EEex_SetActionID(actionData, newActionID)
			local targetID = EEex_GetActionTarget(actionData)
			local targetX, targetY = EEex_GetActorLocation(targetID)
			EEex_SetActionPointX(actionData, targetX)
			EEex_SetActionPointY(actionData, targetY)
		end
	end)
end

function MEACHOOK(actorID)
	EEex_AddActionHook(function(actionData)
		Infinity_DisplayString(EEex_GetActionID(actionData))
	end)
end

function MESPIN(effectData, creatureData)
	me_initial_direction = EEex_ReadWord(creatureData + 0x31FE, 0x0)
--	for i = 0, 15, 1 do
		EEex_WriteWord(creatureData + 0x31FE, (me_initial_direction + 1) % 16)
--		for j = 0, 100, 1 do
--		end
--	end
end

function MEPERMCN(effectData, creatureData)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	if targetID == 0x0 then return end
	local contingencyRes = EEex_ReadLString(effectData + 0x18, 8)
	EEex_AlterActorEffect(targetID,{{"opcode",232},{"parent_resource",contingencyRes}}, {{"parameter3",0}},1)
end

function EEex_IterateActorEffects(effectData, creatureData, func)
	esi = EEex_ReadDword(creatureData + 0x33AC)
	while esi ~= 0x0 do
		edi = EEex_ReadDword(esi + 0x8)
		func(effectData, creatureData, edi)
		esi = EEex_ReadDword(esi)
	end
end

function MENOUAI(effectData, creatureData)
	EEex_IterateActorEffects(effectData, creatureData, function(eData, cData, iData)
		if EEex_ReadDword(iData + 0xC) == 302 then
			EEex_WriteDword(iData + 0x1C, 0)
		end
	end)
end

me_swap_id = {}

function MESWAP(effectData, creatureData)
	local sourceID = EEex_ReadDword(effectData + 0x10C)
	local targetID = EEex_ReadDword(creatureData + 0x34)
	if me_swap_id["" .. sourceID] == nil then
		me_swap_id["" .. sourceID] = targetID
	else
		local otherID = me_swap_id["" .. sourceID]
		local otherData = EEex_GetActorShare(otherID)
		EEex_ApplyEffectToActor(otherID, {
["opcode"] = 124,
["target"] = 2,
["timing"] = 1,
["parameter2"] = 3,
["source_id"] = targetID,
["source_target"] = otherID,
["source_x"] = EEex_ReadDword(creatureData + 0x8),
["source_y"] = EEex_ReadDword(creatureData + 0xC),
["target_x"] = EEex_ReadDword(otherData + 0x8),
["target_y"] = EEex_ReadDword(otherData + 0xC)
})
		me_swap_id["" .. sourceID] = nil
	end
end

function MEINHOST(effectData, creatureData)
	local sourceID = EEex_ReadDword(effectData + 0x10C)
	local targetID = EEex_ReadDword(creatureData + 0x318)
	if targetID > 0 then
		EEex_ApplyEffectToActor(targetID, {
["opcode"] = 146,
["target"] = 2,
["parameter1"] = 1,
["parameter2"] = 2,
["timing"] = 1,
["resource"] = "MEINHOST",
["source_id"] = sourceID,
["source_target"] = targetID
})
	end
end