/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1
/// @DnDHash : 5AD3DBA0
/// @DnDArgument : "x" "3"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "object" "Obj_Wall"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "921885e1-2614-46d8-839e-921c9bc8a492"
var l5AD3DBA0_0 = instance_place(x + 3, y + 0, Obj_Wall);
if (!(l5AD3DBA0_0 > 0))
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 6DA97C18
	/// @DnDParent : 5AD3DBA0
	/// @DnDArgument : "speed" "3"
	/// @DnDArgument : "type" "1"
	hspeed = 3;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4B09598F
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 054FAF14
	/// @DnDParent : 4B09598F
	/// @DnDArgument : "type" "1"
	hspeed = 0;
}