var idk:Int = 0;
var guh:Float = 0;

function postCreate() {
    iconP1.setIcon("tomoko");
    healthBar.createFilledBar(strumLines.members[0].characters[0].iconColor, strumLines.members[0].characters[0].iconColor);
    iconP2.visible = false;
    healthBar.percent = health;
    strumLines.members[0].characters[0].x += 350;
}

function update(elapsed) {
    iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 100, 0, 1, 0)) - 75);

	for (a in strumLines.members[0])
		a.y = idk + Math.sin((Conductor.songPosition / 500) + (a.ID * 2) * 50) * guh;

	guh = FlxMath.lerp(guh, 12.5, 0.0025);
}

function onStrumCreation(e) idk = strumLines.members[e.player].startingPos.y;
function onCameraMove(e) e.position = strumLines.members[0].characters[0].getMidpoint();