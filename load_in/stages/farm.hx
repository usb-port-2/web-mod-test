function postCreate() {
    defaultCamZoom = camGame.zoom = 0.6;
    for(a in [
        // [graphic, x, y, scrollx, scrolly, scale]
        ["sky", -900, -200, 0.85, 0.7, 1.6],
        ["field_back", -410, 185, 0.75, 0.75, 1],
        ["field_fore", -522, 290, 0.8, 0.8, 1],
        ["farm", -5, 123, 0.85, 0.85, 1],
        ["fore", -1000, 0, 1, 1, 1.1]
    ]) {
        var sprite = new FunkinSprite(a[1], a[2]);
        trace( "stages/" + curStage + "/" + a[0]);
        getImageFromGithub(sprite, "stages/" + SONG.stage + "/" + a[0]);
        sprite.scrollFactor.set(a[3], a[4]);
        sprite.scale.x = sprite.scale.y = a[5];
        add(sprite);
    }
    strumLines.members[0].characters[0].setPosition(315, 218);
    strumLines.members[1].characters[0].setPosition(920, 525);
}