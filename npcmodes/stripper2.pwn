#include <a_npc>

main(){}

NextPlayback()
{
   StartRecordingPlayback(PLAYER_RECORDING_TYPE_ONFOOT,"stripper2");
}

public OnRecordingPlaybackEnd()
{
    NextPlayback();
}

public OnNPCSpawn()
{
    NextPlayback();
}

public OnNPCExitVehicle()
{
    StopRecordingPlayback();
}
