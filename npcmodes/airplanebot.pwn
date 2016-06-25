#include <a_npc>

main()
{
	printf("NPC: Air Plane Bot Loaded.");
}

StartPlayback()
{
	StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"airplanebot");
}

public OnRecordingPlaybackEnd()
{
    StartPlayback();
}

public OnNPCEnterVehicle(vehicleid, seatid)
{
    StartPlayback();
}

public OnNPCExitVehicle()
{
    StopRecordingPlayback();
}
