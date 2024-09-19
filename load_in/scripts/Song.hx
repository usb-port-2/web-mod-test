if(SONG.meta.name == "popular" || SONG.meta.name == "perfect girl") GameOverSubstate.script = "data/scripts/gameover";

function create()
    camGame.fade(FlxColor.BLACK, 0);

function beatHit(curBeat:Int)
    if(curBeat == 0)
        camGame.fade(FlxColor.BLACK, (Conductor.crochet/1000) * 4, true);

if(SONG.meta.name.toLowerCase() == "shitno" || SONG.meta.name.toLowerCase() == "shinto")
    importScript("data/scripts/pixel");
