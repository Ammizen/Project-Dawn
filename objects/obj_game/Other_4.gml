/// @description Spawn new enemy

if (room == rm_test) {
	instance_create_layer(irandom_range(60, room_width - 60), irandom_range(60, room_height - 60), "Instances", obj_encounter);
}

global.battleProcessing = false;