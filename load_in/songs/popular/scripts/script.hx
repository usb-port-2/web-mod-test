import flixel.graphics.frames.FlxAtlasFrames;
import haxe.xml.Access;

var idk:Int = 0;
var guh:Float = 0;
var floatAmount:Float = 25;

var bg = new FunkinSprite();
var fg = new FunkinSprite();
var tomo = new FunkinSprite();

function postCreate() {
    iconP1.setIcon("tomoko");
    healthBar.createFilledBar(strumLines.members[0].characters[0].iconColor, strumLines.members[0].characters[0].iconColor);
    iconP2.visible = false;
    healthBar.percent = health;
    strumLines.members[0].characters[0].x += 350;

    getImageFromGithub(bg, "stages/watamote/bg");
    insert(0, bg.screenCenter());
    bg.x += 275;
    bg.y += 50;

    getImageFromGithub(fg, "stages/watamote/fg");
    add(fg.screenCenter());

    getSpritesheetFromGithub(tomo, "stages/watamote/tomo", "a");
    add(tomo.screenCenter());
    tomo.camera = camHUD;

    strumLines.members[0].characters[0].scale.set(0.65, 0.65);
    strumLines.members[0].characters[0].y += 285;
    strumLines.members[0].characters[0].x += 40;
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 0:
            FlxTween.num(25, 12.5, (Conductor.stepCrochet / 1000) * 256, {}, function(a) floatAmount = a);
        case 504:
            floatAmount = 0;
    }
}

function update(elapsed) {
	for (a in strumLines.members[0])
		a.y = idk + Math.sin((Conductor.songPosition / 500) + (a.ID * 2) * 50) * guh;

	guh = FlxMath.lerp(guh, floatAmount, 0.0025);
}

function onStrumCreation(e) idk = strumLines.members[e.player].startingPos.y;
function onCameraMove(e) {
    e.position.x = bg.getMidpoint().x;
    e.position.y = bg.getMidpoint().y;
}
