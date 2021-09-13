/// @description Standard Attack Formula
/// @arg Strength
/// @arg damageBonus
/// @arg Defence
function standardAttack(strength, damageBonus, defence){
	var damage = damageBonus * strength/defence;
	damage = round(damage);
	return damage;
}