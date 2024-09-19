import hxvlc.flixel.FlxVideoSprite;

function create(e) {
    e.cancel();

    camera = dieCam = new FlxCamera();
    dieCam.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(dieCam, false);

    var bitmap = BitmapData.loadFromFile([
        "popular" => "https://static.wikia.nocookie.net/fridaynightfunking/images/5/5f/Tomokover.mp4/"
        "perfect girl" => "https://static.wikia.nocookie.net/fridaynightfunking/images/1/1e/Bocchi_gameover.mp4/"
    ][PlayState.SONG.meta.name]);
    bitmap.onComplete(function(bitmap) {
        add(vid = new FlxVideoSprite());
        vid.load(bitmap);
        vid.bitmap.onEndReached.add(function() FlxG.switchState(new PlayState()));
        vid.play();
        vid.scale.x = vid.scale.y *= 2;
        vid.x += 270;
        vid.y += 250;
    
    });
}