/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1
/// @DnDHash : 4305FE2E
/// @DnDArgument : "x" "-3"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "object" "Obj_Wall"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "921885e1-2614-46d8-839e-921c9bc8a492"
var l4305FE2E_0 = instance_place(x + -3, y + 0, Obj_Wall);
if (!(l4305FE2E_0 > 0))
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 46AE20E8
	/// @DnDParent : 4305FE2E
	/// @DnDArgument : "speed" "-3"
	/// @DnDArgument : "type" "1"
	hspeed = -3;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 67CAE685
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1B5FDA14
	/// @DnDParent : 67CAE685
	/// @DnDArgument : "type" "1"
	hspeed = 0;
}