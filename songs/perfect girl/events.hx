import flixel.addons.display.FlxBackdrop;

var idk = new FlxBackdrop(null, FlxAxes.X);
var walkDown:Bool = false;

function postCreate() {
    getImageFromGithub(idk, "stages/bocchibg");
    insert(0, idk);
    idk.scrollFactor.x = 0.75;
}

function update(elapsed) idk.x += 100 * elapsed;

function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0)  {
            walkDown = !walkDown;
            strumLines.members[1].characters[0].y = (walkDown ? 215 : 235);
            strumLines.members[0].characters[0].y = (walkDown ? -15 : -30);
    }
}

function onCameraMove(e) e.position.y = idk.y + idk.height/2;