#include <a_npc>

main(){}

public OnRecordingPlaybackEnd()
{
    StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"DriveByCar");
}

public OnNPCEnterVehicle(vehicleid, seatid)
{
    StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"DriveByCar");
}
public OnNPCExitVehicle()
{
    StopRecordingPlayback();
}
