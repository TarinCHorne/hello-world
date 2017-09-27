/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1
/// @DnDHash : 7C6FC84F
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "-3"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "object" "Obj_Wall"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "921885e1-2614-46d8-839e-921c9bc8a492"
var l7C6FC84F_0 = instance_place(x + 0, y + -3, Obj_Wall);
if (!(l7C6FC84F_0 > 0))
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 47E74C10
	/// @DnDParent : 7C6FC84F
	/// @DnDArgument : "speed" "-3"
	/// @DnDArgument : "type" "2"
	vspeed = -3;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 237CB3A3
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 0D84ECA3
	/// @DnDParent : 237CB3A3
	/// @DnDArgument : "type" "2"
	vspeed = 0;
}