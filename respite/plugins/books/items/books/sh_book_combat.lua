ITEM.name = "Combat (OOC)"
ITEM.desc = "A book detailing the combat system, this book is OOC.\nThis book can be sold."
ITEM.price = 0
ITEM.flag = "3"
ITEM.contents = [[

<h3>Original System By 5ym5</h3>
<p align="center"><font color='red' size='6'>Combat Rules</font></p><br/>
<font color='black' size='3'>Commands: 
		<br/><br/>		
/reflexes : Used at the beginning of the fight to determine turn order.
		<br/><br/>		
/dodge : Determines if an attack is dodged, or if the projectile fired at you will miss. Can also be used to avoid /grapple. Uses agility.
		<br/><br/>		
/block : Determines if an attack is blocked. Cannot be used against bullets. If a thrown object is blocked, it cannot be reflected. Mostly uses strength, uses some accuracy.
		<br/><br/>		
/parry : Determines if an attack is blocked, and allows for a counterattack. Cannot be used against bullets. If a thrown object is blocked, it can be reflected. IF /parry succeeds against a /melee, attacker must 
roll /dodge against previous /parry roll. If the same /parry roll wins again, a counterattack occurs. If the /dodge succeeds, the attack is only blocked and the counterattack misses. Can only counterattack with 
melee attacks ICly. If a /throw is parried successfully, roll /throw and use the previous /parry roll and the new /throw part, send attack towards any enemy in reasonable range. Target can /block or /dodge, but 
cannot /parry. Uses agility, strength, and accuracy in equal parts.
		<br/><br/>		
/defend : Determines if an ally is defended. Allows you to defend an ally in combat. Can only be done if you are close to them. /defend is rolled during your turn. If an enemy attacks the one you are defending, 
they must roll /dodge to avoid your counterattack. If they are hit by your /defend roll, they cannot attack this turn. Melee attacks are used for defense ICly. Attackers can use /block or /parry here, but they 
cannot attack their original target if they do so. (You cannot defend by shooting, but you can melee with your firearm.) If the one you are defending is attacked multiple times, only the first attack will be 
defended against. Uses agility, strength, and accuracy in equal parts.
		<br/><br/>		
/throw : Determines if a thrown object hits its target. Rolled against /dodge, /block, or /defend. If the object has a sharp edge, like a knife, it will only cut if the /throw roll is at least 2 higher than the 
reaction roll (/dodge, /block, /parry, etc.)
		<br/><br/>		
/firearms : Determines if and where your weapon's single shot will hit. Rolled against /dodge. Chooses a random body part to hit. Mostly uses accuracy, uses a little strength.
		<br/><br/>		
/firearmsaimed : Determines if an aimed shot will hit. Rolled against dodge. Requires two turns to complete, first turn to aim, second turn to fire. Allows for player to decide what body part to target. Bullets 
cannot be blocked by melee weapons. Mostly uses accuracy, uses a little strength.
		<br/><br/>		
/firearmsburst : Fires three shots with decreasing accuracy, can only be used with automatic weapons or burst fire weapons (not semi automatic.) Accuracy decreases based on your strength (Higher strength = less 
reduction.
		<br/><br/>		
/firearmsburstaimed : Same as /firearmsaimed, but for burst.
		<br/><br/>		
/akimbo : Used when dual wielding pistols. Multiple targets can be chosen. Has an aim penalty. Uses accuracy and strength.		
		<br/><br/>
/suppress : Determines if an enemy is hit by suppressing fire. A player rolls suppression against an enemy in cover. If the enemy attempts to use a weapon or move into the open, it will have to /dodge to avoid 
being hit. /dodge is rolled the /suppress roll. Can only suppress one target at a time unless all parties agree otherwise in a case where it would make sense. If that is the case, suppression is only rolled once, 
and every /dodge is compared to that roll. Mostly uses strength and some accuracy.
		<br/><br/>	
/execute : Used in point blank firearm conditions where target has a low chance of avoiding the hit. Double a normal firearms aimed. If this roll fails, it is assumed that the target has diverted the aim of the executioner, if that is impossible (They are unconscious, lack movement capabilities, etc.), then you shouldn't be using this roll.
		<br/><br/>	
/quickdraw : Used to draw your weapon and fire it in the same turn. Can only be used with SMGs and Pistols. Has a roll penalty (30%). Uses accuracy and agility.
		<br/><br/>	
/melee : For melee attacks, mostly uses strength with a little bit of accuracy. Mostly uses strength, uses some accuracy.
		<br/><br/>	
/flail : For melee attacks, uses a luck roll instead of accuracy. Not the smartest thing to use.
		<br/><br/>		
/grapple : Used to grab a target, preventing them from escaping unless they use their turn to try and break free (/grapple vs /grapple). After a successful grapple, the next successful melee attack on an opponent will be stronger, (+5). Bonus applies to those other than grappler (Allies.) Mostly uses strength, uses a little accuracy.
		<br/><br/>		
/sneak : Used for sneaking by a target, or for sneak attacks. Rolled against /perception. If /sneak is successful for a sneak attack, a /melee(+2) or a /firearmsaimed will be used for an attack. Uses agility.
		<br/><br/>		
/perception : Used to detect sneaking targets. If successful, detector is alerted and can act accordingly. If combat is initiated, regular reflex rolls are used. Uses perception.
		<br/><br/>		
/flee : Used to attempt to leave combat. Rolled against any reasonable roll that could stop you, /firearms, /melee, /grapple, etc. If the /flee roll fails against any rolls, /flee is cancelled. If /flee is not 
stopped, player can exit combat, but cannot disconnect or character swap for at least half an hour, unless otherwise agreed upon by involved parties.
		<br/><br/>		
/fortitude : Used to roll resistance against mental and hallucination based effects like blue haze grenades, ongoing hallucinogens, hallucination based attacks, etc. See: 
spite.boards.net/thread/684/status-effects
		<br/><br/>		
/endure : Used to roll resistance against physical effects like flashbangs, tear gas, fire, poison, etc. See: spite.boards.net/thread/684/status-effects
		<br/><br/>		
/scavenge : Used to determine what your loot is when scavenging something. Can only be used with admin oversight and assistance, admin determines loot reward based off of what is being scavenged, and what the 
scavenge roll is. Can only scavenge the same spot once per day per person. Uses luck, and lots of RNG.
		<br/><br/>		
		<br/><br/>		
Combat is done in a number of easy steps.
		<br/><br/>		
1. Both Player 1 and Player 2 type /reflexes.
		<br/><br/>		
2. Whoever had the higher /reflexes roll may now take the first turn.
		<br/><br/>		
3. The player now has 2 action points. A player can use them to move twice (dash), move and attack, just attack, or for other things depending on the circumstances.
		<br/><br/>		
4. The attacked opponent rolls a single reaction roll (/dodge, /melee, /block, /parry, etc.)
		<br/><br/>		
5. If the attacker rolls higher than the defender then the action succeeds, otherwise the defender successfully dodges/blocks the attack.
		<br/><br/>		
6. The defender types their reaction to attack, and their action. They go to step 3 and the cycle repeats.
		<br/><br/>		
		<br/><br/>		
Rules of Combat
		<br/><br/>		
· If in cover, the bullet hits the cover in front of the target limb, whether or not it pierces cover is between the two RPers.
		<br/><br/>		
· If a player is not attacking on their turn, they may make two movements.
		<br/><br/>		
· Shooting from cover still requires that you assume proper firing posture, so most cover (Leaning out from a wall, firing overtop of a barricade) will only protect the lower abdomen and below.
		<br/><br/>		
· P2L with injuries. You are not Robocop, so stop that.
		<br/><br/>		
· Injuries are determined by those they are dealt to, not the attacker.
		<br/><br/>		
· When you see someone roll for reflexes, drop what you are doing and roll for reflexes, then look to the chat to see what the turn order is.
		<br/><br/>		
· You must use one action to unholster a weapon. This means that you can move or attack after unholstering it provided that the distance is not too great.
		<br/><br/>		
· If all parties agree on a bonus/penalty to a roll or to roll for different stats entirely it is permitted. If any party says no, then it is resolved by the default rules.
		<br/><br/>		
· If you kill someone, do not shoot them with your weapon until they’ve given the OK.
		<br/><br/>		
· If you are not in the combat when it begins, you are subject to timescale, and to join that combat you may have to wait several turns before being given a turn. Typically you are put at the end of the turn order. Turn delay is determined by how many turns have gone by in the combat. Every two turns is a one turn delay for incoming participants. Once combat is over, you cannot immediately jump onto the survivors due to timescale, you must wait at least thirty minutes before pursuing.
		<br/><br/>		
· Once combat has started, your movements are limited to your turns. 
The two props used for movement measurement are models/hunter/blocks/cube025x4x025.mdl (Movement Distance) and models/hunter/blocks/cube025x8x025.mdl (Dash Distance)
You may move the full movement distance (Small prop) in addition to any actions on your turn, or forego your action to move the dash distance (Large prop). 
		<br/><br/>		
· Different effects do different things, please see: spite.boards.net/thread/684/status-effects.
		<br/><br/>		
· If you get hit by something that should reasonably cause an effect, please RP accordingly. For example, a severe head blow may stun you for a turn. If your arms are broken, your melee attacks may be hampered, etc.
		
		<br/><br/>
		
		<br/><br/>
		
		<br/><br/>
	
		<br/><br/>
		
		<br/><br/>		
					
		<br/><br/>	
		
		If you have any questions or concerns you can ask an admin and they should be able to help you.
		You can also see this information under Community Info on the forums. Which you can get to by typing /forums.
		<br/><br/>		
		</font>
		]]