if(SONG.meta.name == "popular" || SONG.meta.name == "perfect girl") GameOverSubstate.script = "data/scripts/gameover";

function create()
    camGame.fade(FlxColor.BLACK, 0);

function beatHit(curBeat:Int)
    if(curBeat == 0)
        camGame.fade(FlxColor.BLACK, (Conductor.crochet/1000), true);

function onNoteCreation(e)
    if(e.noteType == "Bamber Smash")
        e.visible = false;

function onNoteHit(e)
    if(e.noteType == "Bamber Smash") {
        e.cancelAnim();
        e.character.playAnim("smash", true);
    }

function measureHit()
    curCameraTarget = strumLines.members[1].character[0].getAnim() != "idle" ? 1 : 0;