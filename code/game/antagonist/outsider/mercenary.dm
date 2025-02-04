var/datum/antagonist/mercenary/mercs

/datum/antagonist/mercenary
	id = MODE_MERCENARY
	role_text = "Mercenary"
	bantype = "operative"
	antag_indicator = "synd"
	role_text_plural = "Mercenaries"
	landmark_id = "Syndicate-Spawn"
	leader_welcome_text = "You are the leader of the mercenary strikeforce; hail to the chief. Use :t to speak to your underlings."
	welcome_text = "To speak on the strike team's private channel use :t."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_HAS_NUKE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
	id_type = /obj/item/weapon/card/id/syndicate
	antaghud_indicator = "hudoperative"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 4

	faction = "syndicate"

/datum/antagonist/mercenary/New()
	..()
	mercs = src

/datum/antagonist/mercenary/create_global_objectives()
	if(!..())
		return 0
	global_objectives = list()
	global_objectives |= new /datum/objective/nuclear
	return 1

/datum/antagonist/mercenary/equip(var/mob/living/carbon/human/player)
	if(!..())
		return 0

	player.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(player), slot_shoes)
	if(!player.shoes) //If equipping shoes failed, fall back to equipping toeless jackboots
		var/fallback_type = pick(/obj/item/clothing/shoes/jackboots/unathi)
		player.equip_to_slot_or_del(new fallback_type(player), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/clothing/gloves/swat(player), slot_gloves)
	player.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/security(player), slot_belt)
	if(player.backbag == 2) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/syndie(player), slot_back)
	if(player.backbag == 3) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_syndie(player), slot_back)
	if(player.backbag == 4) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(player), slot_back)
	if(player.backbag == 5) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/duffel/syndie(player), slot_back)
	if(player.backbag == 6) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/messenger/syndie(player), slot_back)
	player.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(player.back), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/pill/cyanide(player), slot_in_backpack)

	var/obj/item/device/radio/uplink/U = new(player.loc, player.mind, DEFAULT_TELECRYSTAL_AMOUNT)
	player.put_in_hands(U)

	player.update_icons()
	player.faction = "syndicate"

	create_id("Mercenary", player)
	create_radio(SYND_FREQ, player)

	give_codewords(player)
	return 1
