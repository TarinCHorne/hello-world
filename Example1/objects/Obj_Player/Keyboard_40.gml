/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1
/// @DnDHash : 791CF1F1
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "4"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "object" "Obj_Wall"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "921885e1-2614-46d8-839e-921c9bc8a492"
var l791CF1F1_0 = instance_place(x + 0, y + 4, Obj_Wall);
if (!(l791CF1F1_0 > 0))
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1B521687
	/// @DnDParent : 791CF1F1
	/// @DnDArgument : "speed" "3"
	/// @DnDArgument : "type" "2"
	vspeed = 3;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 5FC057DA
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 3EDAAD90
	/// @DnDParent : 5FC057DA
	/// @DnDArgument : "type" "2"
	vspeed = 0;
}