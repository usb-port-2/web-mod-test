function postCreate()
    camGame.fade(FlxColor.BLACK, 0);

function beatHit(curBeat:Int)
    if(curBeat == 0)
        camGame.fade(FlxColor.BLACK, (Conductor.crochet/1000) * 4, true);