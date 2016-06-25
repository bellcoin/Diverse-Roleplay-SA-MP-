#include <a_npc>

new gStoppedForTraffic = 0,
gPlaybackFileCycle=0;

public ScanTimer();

#define AHEAD_OF_CAR_DISTANCE    9.0
#define SCAN_RADIUS     		 9.0

main()
{
	printf("NPC: Bus Route Loaded.");
}

stock GetXYInfrontOfMe(Float:distance, &Float:x, &Float:y)
{
    new Float:z, Float:angle;
    GetMyPos(x,y,z);
    GetMyFacingAngle(angle);
    x += (distance * floatsin(-angle, degrees));
    y += (distance * floatcos(-angle, degrees));
}

public OnNPCModeInit()
{
	SetTimer("ScanTimer",200,1);
}

LookForAReasonToPause()
{
  	new Float:X,Float:Y,Float:Z;
	GetMyPos(X,Y,Z);
	GetXYInfrontOfMe(AHEAD_OF_CAR_DISTANCE,X,Y);
	
	for(new x = 0; x <= MAX_PLAYERS; x++)
	{
	    if(IsPlayerConnected(x) && IsPlayerStreamedIn(x) && GetPlayerVehicleID(x) != 1 && GetPlayerVehicleID(x) != 2)
	    {
			if( (GetPlayerState(x) == PLAYER_STATE_DRIVER || GetPlayerState(x) == PLAYER_STATE_ONFOOT) )
			{
				if(IsPlayerInRangeOfPoint(x,SCAN_RADIUS,X,Y,Z))
				{
				    return 1;
				}
			}
		}
	}
	return 0;
}

public ScanTimer()
{
    new ReasonToPause = LookForAReasonToPause();
	if(ReasonToPause && !gStoppedForTraffic)
	{
		PauseRecordingPlayback();
		gStoppedForTraffic = 1;
	}
	else if(!ReasonToPause && gStoppedForTraffic)
	{
	    ResumeRecordingPlayback();
	    gStoppedForTraffic = 0;
	}
}

StartPlayback()
{
	if(gPlaybackFileCycle == 19) gPlaybackFileCycle=0;
	switch(gPlaybackFileCycle)
	{
	    case 0: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route1");
	    case 1: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route2");
	    case 2: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route3");
	    case 3: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route4");
	    case 4: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route5");
	    case 5: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route6");
	    case 6: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route7");
	    case 7: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route8");
	    case 8: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route9");
	    case 9: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route10");
	    case 10: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route11");
	    case 11: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route12");
	    case 12: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route13");
	    case 13: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route14");
	    case 14: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route15");
	    case 15: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route16");
	    case 16: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route17");
	    case 17: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route18");
	    case 18: StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"route19");
	}
	gPlaybackFileCycle++;
	gStoppedForTraffic = 0;
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
    gPlaybackFileCycle = 0;
}
