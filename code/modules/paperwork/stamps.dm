/obj/item/weapon/stamp
	name = "rubber stamp"
	desc = "A rubber stamp for stamping important documents."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-qm"
	item_state = "stamp"
	throwforce = 0
	w_class = 1.0
	throw_speed = 7
	throw_range = 15
	matter = list(DEFAULT_WALL_MATERIAL = 60)
	attack_verb = list("stamped")

/obj/item/weapon/stamp/captain
	name = "colony director's rubber stamp"
	icon_state = "stamp-cap"

/obj/item/weapon/stamp/hop
	name = "personnel director's rubber stamp"
	icon_state = "stamp-hop"

/obj/item/weapon/stamp/hos
	name = "security chief's rubber stamp"
	icon_state = "stamp-hos"

/obj/item/weapon/stamp/ce
	name = "engineering chief's rubber stamp"
	icon_state = "stamp-ce"

/obj/item/weapon/stamp/rd
	name = "science director's rubber stamp"
	icon_state = "stamp-rd"

/obj/item/weapon/stamp/cmo
	name = "medical director's rubber stamp"
	icon_state = "stamp-cmo"

/obj/item/weapon/stamp/denied
	name = "\improper DENIED rubber stamp"
	icon_state = "stamp-deny"

/obj/item/weapon/stamp/clown
	name = "clown's rubber stamp"
	icon_state = "stamp-clown"

/obj/item/weapon/stamp/internalaffairs
	name = "government representative rubber stamp"
	icon_state = "stamp-intaff"

/obj/item/weapon/stamp/centcomm
	name = "highcom rubber stamp"
	icon_state = "stamp-cent"

// Syndicate stamp to forge documents.
/obj/item/weapon/stamp/chameleon/attack_self(mob/user as mob)

	var/list/stamp_types = typesof(/obj/item/weapon/stamp) - src.type // Get all stamp types except our own
	var/list/stamps = list()

	// Generate them into a list
	for(var/stamp_type in stamp_types)
		var/obj/item/weapon/stamp/S = new stamp_type
		stamps[capitalize(S.name)] = S

	var/list/show_stamps = list("EXIT" = null) + sortList(stamps) // the list that will be shown to the user to pick from

	var/input_stamp = input(user, "Choose a stamp to disguise as.", "Choose a stamp.") in show_stamps

	if(user && src in user.contents)

		var/obj/item/weapon/stamp/chosen_stamp = stamps[capitalize(input_stamp)]

		if(chosen_stamp)
			name = chosen_stamp.name
			icon_state = chosen_stamp.icon_state
