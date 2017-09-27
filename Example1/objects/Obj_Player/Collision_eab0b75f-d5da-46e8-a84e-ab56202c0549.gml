/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 0217B93C
/// @DnDArgument : "obj" "Obj_Coin"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "1482f6d6-39c4-4e00-a0b5-913c91ec9822"
var l0217B93C_0 = false;
l0217B93C_0 = instance_exists(Obj_Coin);
if(!l0217B93C_0)
{
	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 71975424
	/// @DnDParent : 0217B93C
	room_goto_next();
}