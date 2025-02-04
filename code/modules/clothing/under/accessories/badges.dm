/*
	Badges are worn on the belt or neck, and can be used to show that the holder is an authorized
	Security agent - the user details can be imprinted on holobadges with a Security-access ID card,
	or they can be emagged to accept any ID for use in disguises.
*/

/obj/item/clothing/accessory/badge
	name = "ncis agent's badge"
	desc = "A naval security badge, made from gold and set on REAL leather!"
	icon_state = "badge"
	item_state = "marshalbadge"
	slot_flags = SLOT_BELT | SLOT_TIE

	var/stored_name
	var/badge_string = "NCIS Agent"

/obj/item/clothing/accessory/badge/press
	name = "Government press pass"
	desc = "A corporate reporter's pass, emblazoned with the Terran Government logo."
	icon_state = "pressbadge"
	item_state = "pbadge"
	badge_string = "Governmental Press"

/obj/item/clothing/accessory/badge/press/independent
	name = "press pass"
	desc = "A freelance journalist's pass."
	icon_state = "pressbadge-i"
	badge_string = "Freelance Journalist"

/obj/item/clothing/accessory/badge/old
	name = "faded badge"
	desc = "A faded security badge, backed with leather."
	icon_state = "badge_round"

/obj/item/clothing/accessory/badge/proc/set_name(var/new_name)
	stored_name = new_name
	name = "[initial(name)] ([stored_name])"

/obj/item/clothing/accessory/badge/attack_self(mob/user as mob)

	if(!stored_name)
		to_chat(user, "You inspect your [src.name]. Everything seems to be in order and you give it a quick cleaning with your hand.")
		set_name(user.real_name)
		return

	if(isliving(user))
		if(stored_name)
			user.visible_message("<span class='notice'>[user] displays their [src.name].\nIt reads: [stored_name], [badge_string].</span>","<span class='notice'>You display your [src.name].\nIt reads: [stored_name], [badge_string].</span>")
		else
			user.visible_message("<span class='notice'>[user] displays their [src.name].\nIt reads: [badge_string].</span>","<span class='notice'>You display your [src.name]. It reads: [badge_string].</span>")

/obj/item/clothing/accessory/badge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message("<span class='danger'>[user] invades [M]'s personal space, thrusting [src] into their face insistently.</span>","<span class='danger'>You invade [M]'s personal space, thrusting [src] into their face insistently.</span>")

//.Holobadges.
/obj/item/clothing/accessory/badge/holo
	name = "holobadge"
	desc = "This glowing blue badge marks the holder as a member of naval security."
	icon_state = "holobadge"
	item_state = "holobadge"
	var/emagged //Emagging removes Sec check.

/obj/item/clothing/accessory/badge/holo/cord
	icon_state = "holobadge-cord"
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/badge/holo/attack_self(mob/user as mob)
	if(!stored_name)
		to_chat(user, "Waving around a holobadge before swiping an ID would be pretty pointless.")
		return
	return ..()

/obj/item/clothing/accessory/badge/holo/emag_act(var/remaining_charges, var/mob/user)
	if (emagged)
		to_chat(user, "<span class='danger'>\The [src] is already cracked.</span>")
		return
	else
		emagged = 1
		to_chat(user, "<span class='danger'>You crack the holobadge security checks.</span>")
		return 1

/obj/item/clothing/accessory/badge/holo/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/card/id) || istype(O, /obj/item/device/pda))

		var/obj/item/weapon/card/id/id_card = null

		if(istype(O, /obj/item/weapon/card/id))
			id_card = O
		else
			var/obj/item/device/pda/pda = O
			id_card = pda.id

		if(access_security in id_card.access || emagged)
			to_chat(user, "You imprint your ID details onto the badge.")
			set_name(user.real_name)
		else
			to_chat(user, "[src] rejects your insufficient access rights.")
		return
	..()

/obj/item/clothing/accessory/badge/warden
	name = "master-at-arms' badge"
	desc = "A silver naval security badge. Stamped with the words 'Master-At-Arms.'"
	icon_state = "silverbadge"
	slot_flags = SLOT_TIE


/obj/item/clothing/accessory/badge/hos
	name = "security chief's badge"
	desc = "An immaculately polished gold naval security badge. Labeled 'Security Chief.'"
	icon_state = "goldbadge"
	slot_flags = SLOT_TIE

/obj/item/clothing/accessory/badge/sol_visa
	name = "alliance visa"
	desc = "A compact piece of legal paperwork, permitting temporary entrance in the Sol Alliance."
	icon_state = "sol-visa"
	slot_flags = SLOT_TIE
	badge_string = "Temporary Sol Alliance Visa"

/obj/item/clothing/accessory/badge/ceti_visa
	name = "\improper Tau Ceti residence visa"
	desc = "A compact piece of legal paperwork, permitting temporary residence in the Republic of Biesel."
	icon_state = "tc-visa"
	slot_flags = SLOT_TIE
	badge_string = "Tau Ceti Temporary Residence"

/obj/item/clothing/accessory/badge/hadii_card
	name = "party member card"
	desc = "A card denoting a member of the Hadiist party."
	icon_state = "hadii-id"
	slot_flags = SLOT_TIE
	badge_string = "Member of Party of the Free Tajara under the Leadership of Hadii"

