/datum/job/ai
	title = "Artificial Intelligence"
	flag = AI
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#ccffcc"
	supervisors = "your laws"
	minimal_player_age = 7
	account_allowed = 0
	economic_modifier = 0
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		return 1

/datum/job/ai/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/datum/job/ai/equip_preview(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/straight_jacket(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/cardborg(H), slot_head)
	return 1

/datum/job/cyborg
	title = "Cyborg"
	flag = CYBORG
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "your laws and the Artificial Intelligence, if linked."	//Nodrak
	selection_color = "#ddffdd"
	minimal_player_age = 1
	alt_titles = list("Android", "Robot")
	account_allowed = 0
	economic_modifier = 0

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		return 1

/datum/job/cyborg/equip_preview(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/cardborg(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/cardborg(H), slot_head)
	return 1
