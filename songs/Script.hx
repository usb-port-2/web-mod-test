import openfl.display.BitmapData;

function postCreate()
    camGame.fade(FlxColor.BLACK, 0);

function beatHit(curBeat:Int)
    if(curBeat == 0)
        camGame.fade(FlxColor.BLACK, (Conductor.crochet/1000) * 4, true);

if(SONG.meta.name.toLowerCase() == "shitno" || SONG.meta.name.toLowerCase() == "shinto"){
    function onNoteCreation(event) {
        var note = event.note;

        var bitmap = BitmapData.loadFromFile(parentURL + "notes/shitno" + (event.note.isSustainNote ? "-ends" : "") + ".png?raw=true");
        bitmap.onComplete(function(bitmap) {
            note.loadGraphic(bitmap, true, (event.note.isSustainNote ? 7 : 17), (event.note.isSustainNote ? 6 : 17));
            note.antialiasing = false;
        });

        if (event.note.isSustainNote) {
            note.animation.add("hold", [event.strumID]);
            note.animation.add("holdend", [4 + event.strumID]);
        } else {
            note.animation.add("scroll", [4 + event.strumID]);
        }

        note.scale.set(6, 6);
        note.updateHitbox();
    }

    function onPostNoteCreation(event) {
        var splashes = event.note;
            splashes.splash = "pixel-default";
    }

    function onStrumCreation(event) { 
        var strum = event.strum;

        var bitmap = BitmapData.loadFromFile(parentURL + "notes/shitno.png?raw=true");
        bitmap.onComplete(function(bitmap) {
            strum.loadGraphic(bitmap, true, 17, 17);
            strum.antialiasing = false;
        });

        strum.animation.add("static", [event.strumID]);
        strum.animation.add("pressed", [4 + event.strumID, 8 + event.strumID], 12, false);
        strum.animation.add("confirm", [12 + event.strumID, 16 + event.strumID], 24, false);

        strum.scale.set(6, 6);
        strum.updateHitbox();
    }
}