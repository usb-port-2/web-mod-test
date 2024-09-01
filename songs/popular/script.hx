var idk:Int = 0;
var guh:Float = 0;

function postCreate() {
    iconP1.setIcon("tomoko");
    healthBar.createFilledBar(strumLines.members[0].characters[0].iconColor, strumLines.members[0].characters[0].iconColor);
    iconP2.visible = false;
    healthBar.percent = health;
}

function update(elapsed) {
	for (a in strumLines.members[0])
		strum.y = idk + Math.sin((Conductor.songPosition / 500) + (strum.ID * 2) * 50) * guh;

	guh = FlxMath.lerp(guh, 12.5, 0.0025);
}

function onStrumCreation(e) idk = e.startingPos.y;