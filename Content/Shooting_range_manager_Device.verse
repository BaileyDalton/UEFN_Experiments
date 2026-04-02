
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

Shooting_range_manager_device := class(creative_device):

    # Score Manager
    @editable
    ScoreManager:score_manager_device = score_manager_device{}

    # Good Targets give points when hit, and pop down until reset.
    @editable
    GoodTarget1:shooting_range_target_track_device = shooting_range_target_track_device{}
    @editable
    GoodTarget2:shooting_range_target_track_device = shooting_range_target_track_device{}
    @editable
    GoodTarget3:shooting_range_target_track_device = shooting_range_target_track_device{}

    # Bad Targets take points when hit, and pop down until reset.
    @editable
    BadTarget1:shooting_range_target_device = shooting_range_target_device{}
    @editable
    BadTarget2:shooting_range_target_device = shooting_range_target_device{}
    @editable
    BadTarget3:shooting_range_target_device = shooting_range_target_device{}


    @editable
	var GoodTargetScore:int = 100
    @editable
	var BadTargetScore:int = -100

    OnBegin<override>()<suspends>:void=
        GoodTarget1.HitEvent.Subscribe(OnGoodTarget1Hit)
        GoodTarget2.HitEvent.Subscribe(OnGoodTarget1Hit)
        GoodTarget3.HitEvent.Subscribe(OnGoodTarget1Hit)

        BadTarget1.HitEvent.Subscribe(OnBadTarget1Hit)
        BadTarget2.HitEvent.Subscribe(OnBadTarget2Hit)
        BadTarget3.HitEvent.Subscribe(OnBadTarget3Hit)


    OnGoodTarget1Hit():void=
        GoodTarget1.PopDown()
        AdjustScore(GoodTargetScore)

    OnGoodTarget2Hit():void=
        GoodTarget2.PopDown()
        AdjustScore(GoodTargetScore)

    OnGoodTarget3Hit():void=
        GoodTarget3.PopDown()
        AdjustScore(GoodTargetScore)

    OnBadTarget1Hit():void=
        BadTarget1.PopDown()
        AdjustScore(BadTargetScore)

    OnBadTarget2Hit():void=
        BadTarget2.PopDown()
        AdjustScore(BadTargetScore)

    OnBadTarget3Hit():void=
        BadTarget3.PopDown()
        AdjustScore(BadTargetScore)

    AdjustScore(scoreDelta:int):void=
        {
            ScoreManager.SetScoreAward(scoreDelta)
            if (Player:player = GetPlayspace().GetPlayers()[0]):
                ScoreManager.Activate(Player)

                
        }
        
