//Captain's voidsuit
/obj/item/clothing/head/helmet/space/void/captain
	name = "colony director's voidsuit helmet"
	icon_state = "capspace"
	item_state = "capspace"
	item_state_slots = list(
		slot_l_hand_str = "capspacehelmet",
		slot_r_hand_str = "capspacehelmet"
	)
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Only for the most fashionable of government figureheads."
	armor = list(melee = 65, bullet = 50, laser = 50,energy = 25, bomb = 50, bio = 100, rad = 50)

/obj/item/clothing/suit/space/void/captain
	name = "colony director's voidsuit"
	desc = "A bulky, heavy-duty piece of exclusive Terran armor. YOU are in charge!"
	icon_state = "capspace"
	item_state = "capspace"
	item_state_slots = list(
		slot_l_hand_str = "capspacesuit",
		slot_r_hand_str = "capspacesuit"
	)
	w_class = 4
	allowed = list(/obj/item/weapon/tank, /obj/item/device/flashlight,/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	slowdown = 1.5
	armor = list(melee = 65, bullet = 50, laser = 50, energy = 25, bomb = 50, bio = 100, rad = 50)
