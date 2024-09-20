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
    insert(0, tomo);
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
        case 1568:
            camGame.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
            strumLines.members[0].characters[0].visible = bg.visible = fg.visible = false;
            tomo.screenCenter(FlxAxes.Y);
            tomo.x = FlxG.width / 3 - tomo.width / 2;
            tomo.visible = true;
            tomo.animation.addByPrefix("a", "a", 24, true);
            tomo.animation.play("a");

            for(num => a in strumLines.members[0].members)
                FlxTween.tween(a, {x: ((FlxG.width * 0.75) + (Note.swagWidth * (num - 2)))}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.circInOut});
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
