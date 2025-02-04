/datum/job/merchant
	title = "Free Trader"
	faction = "Station"
	department = "Civilian"
	flag = MERCHANT
	department_flag = CIVILIAN
	total_positions = 0
	spawn_positions = 0
	supervisors = "yourself and the market"
	selection_color = "#515151"
	minimal_player_age = 10
	economic_modifier = 5
	ideal_character_age = 30
	create_record = 0
	account_allowed = 0

	access = list(access_merchant)
	minimal_access = list(access_merchant)

	latejoin_at_spawnpoints = TRUE

	outfit = /datum/outfit/job/merchant

/datum/outfit/job/merchant
	name = "Free Trader"
	jobtype = /datum/job/merchant

	uniform =/obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/brown
	id = /obj/item/weapon/card/id/merchant
	pda = /obj/item/device/pda/merchant
	r_pocket = /obj/item/device/price_scanner

/datum/job/merchant/announce(mob/living/carbon/human/H)
	to_chat(H,"You are a Free Trader, an independant merchant, heading to the [station_name()] to make profit, your main objective is to sell and trade with the station, ship, or colony.")

/datum/job/merchant/New()
	..()
	if(prob(config.merchant_chance))
		spawn_positions = 1
		total_positions = 1
