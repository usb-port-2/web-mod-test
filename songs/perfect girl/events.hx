import flixel.addons.display.FlxBackdrop;

var idk = new FlxBackdrop(null, FlxAxes.X);
var walkDown:Bool = false;

function postCreate() {
    getImageFromGithub(idk, "stages/bocchibg");
    insert(0, idk);
    idk.scrollFactor.x = idk.scrollFactor.y = 0.5;
    idk.scale.set(0.5, 0.5);
    idk.y -= 300;
}

function update(elapsed) {
    idk.x += 60 * elapsed;
}

function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0)  {
            walkDown = !walkDown;
            strumLines.members[1].characters[0].y = (walkDown ? 165 : 185);
            strumLines.members[0].characters[0].y = (walkDown ? 135 : 150);
    }
}