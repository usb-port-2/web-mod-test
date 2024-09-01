import flixel.addons.display.FlxBackdrop;

var backdrop = new FlxBackdrop(null, FlxAxes.X);
var walkDown:Bool = false;

function postCreate() {
    getImageFromGithub(backdrop, "stages/bocchibg");
    insert(0, backdrop);
    backdrop.scrollFactor.x = 0.75;
}

function update(elapsed) backdrop.x += 100 * elapsed;

function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0)  {
            walkDown = !walkDown;
            strumLines.members[1].characters[0].y = (walkDown ? 215 : 235);
            strumLines.members[0].characters[0].y = (walkDown ? 245 : 260);
    }
}

function onCameraMove(e) e.position.y = backdrop.y + backdrop.height/2;