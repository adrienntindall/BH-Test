/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(variable_instance_exists(self, "spell_surf") && surface_exists(spell_surf)) surface_free(spell_surf);
obj_room_transition.act = true;