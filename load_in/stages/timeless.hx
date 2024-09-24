import flixel.addons.display.FlxBackdrop;

var osaker:FlxBackdrop = new FlxBackdrop();
var osak:FlxSprite = new FlxSprite();

function postCreate() {
    camGame.addShader(carp = new FunkinShader("#pragma header
    uniform float MAX_POWER;
    void main(){
        vec2 p = getCamPos((openfl_TextureCoordv * openfl_TextureSize.xy) / openfl_TextureSize.x);
        float prop = openfl_TextureSize.x / openfl_TextureSize.y;
        vec2 m = vec2(0.5, 0.5 / prop);
        vec2 d = p - m;
        float r = sqrt(dot(d, d));
        float power = MAX_POWER * -1.3;
        float bind;
        if (power > 0.0) 
            bind = sqrt(dot(m, m));
        else {if (prop < 1.0) 
            bind = m.x; 
        else 
            bind = m.y;}
        vec2 uv;
        if (power > 0.0)
            uv = m + normalize(d) * tan(r * power) * bind / tan( bind * power);
        else if (power < 0.0)
            uv = m + normalize(d) * atan(r * -power * 10.0) * bind / atan(-power * bind * 10.0);
        else uv = p;
        uv.y *= prop;
        vec4 col = textureCam(bitmap, uv);
        gl_FragColor = col;
    }"));
    carp.MAX_POWER = 0.15;

    healthBar.createFilledBar(0xffd58390, 0xffd58390);
    healthBar.percent = health;

    for(a in 0...2)
        [iconP2, iconP1][a].setIcon("osaka" + (a + 1));
    iconP1.flipX = camZooming = true;

    for(a in [osaker, osak]){
        getSpritesheetFromGithub(a, "stages/osaker", "idle");
		insert(0, a);
	}
    osak.animation.addByPrefix("idle", "idle0", 24, true);
    osak.animation.play("idle", true);
    osaker.velocity.y = 120;
    osaker.scale.x = osaker.scale.y = 3;

    camGame.flash(FlxColor.BLACK, 0, true);
}

function postUpdate() {
    for(a in 0...2)
        [iconP2, iconP1][a].x += (a * 52) - 75/2;

    camFollow.x = strumLines.members[0].characters[0].getMidpoint().x;
    camFollow.y = strumLines.members[0].characters[0].getMidpoint().y;
}

function update() {
    osaker.animation.addByPrefix("b", osak.animation.frameName, 24, true);
    osaker.animation.play("b", true);
    osaker.x += Math.sin(Conductor.songPosition / 1000);
}