var zoomAmt = 0;
var bop:Bool = false;

function stepHit(curStep:Int) {
    switch(curStep) {
        case 0:
            camGame.flash(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 248);
        case 248:
            FlxTween.tween(strumLines.members[0].members[1], {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {onComplete:
                function(twn) FlxTween.tween(strumLines.members[0].members[3], {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {onComplete:
                    function(twn) FlxTween.tween(strumLines.members[0].members[2], {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {onComplete:
                        function(twn) FlxTween.tween(strumLines.members[0].members[0], {alpha: 1}, (Conductor.stepCrochet / 1000) * 8)
                    })
                })
            }); 
        case 512:
            camZoomingInterval = 1;
            iconP1.visible = iconP2.visible = healthBar.visible = healthBarBG.visible = bop = true;
        case 1024:
            bop = false;
            camZoomingInterval = 16;
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * (1296 - 1024));
            FlxTween.num(0, -0.5, (Conductor.stepCrochet / 1000) * (1296 - 1024), {}, function(num) zoomAmt = num);
        case 1296 | 1297 | 1299 | 1300 | 1302 | 1303:
            camGame.zoom += 0.05;
        case 1304:
            bop = true;
            zoomAmt = 0;
            camHUD.alpha = camZoomingInterval = 1;
        case 1816:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 1822:
            FlxTween.tween(strumLines.members[0].characters[0], {alpha: 0}, (Conductor.stepCrochet / 1000) * ((2155 - 1822) / 1.5));
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * (2155 - 1822));
    }
}

function beatHit(curBeat:Int){
	if(bop){
		for(a in [iconP2, iconP1]){
			a.angle = curBeat % 2 == 0 ? 5 : -5;
			FlxTween.cancelTweensOf(a);
			FlxTween.tween(a, {angle: 0}, 0.5, {ease: FlxEase.circOut});
		}
		for(a in strumLines.members[0]){
			a.angle = curBeat % 2 == 0 ? (a.strumID % 2 == 0 ? 5 : -5) : (a.strumID % 2 == 0 ? -5 : 5);
			FlxTween.cancelTweensOf(a);
			FlxTween.tween(a, {angle: 0}, 0.5, {ease: FlxEase.circOut});
		}
	}
}