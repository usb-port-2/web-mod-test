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

function measureHit() {
    if(strumLines.members[1].character[0].getAnimName() != "idle")
        curCameraTarget = 1;
    else if(strumLines.members[0].character[0].getAnimName() != "idle")
        curCameraTarget = 0;
    else
        curCameraTarget = (curCameraTarget == 0 ? 1 : 0);
}
