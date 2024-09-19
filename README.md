# WHAT THIS IS
Basically, I wanted to make a way to update Codename Engine mods without redownloading the modpack, so this is the repo I use to store the files the updater reads and downloads into your mods folder

### THIS IS CURRENTLY HEAVILY WIP

## Optimizing:
In order for the web mod loader to be used efficiently, some optimization is needed.<br>
Here are some tips;
### RECOMMENDED PROGRAMS/SERVICES TO USE:
[Funkin' Packer](https://niirou.se/wip/funkin-packer/):<br>
    Funkin' Packer reduces spritesheet file size by rearranging and trimming the frames on the spritesheet.<br>
    It can greatly speed up loading times and reduces RAM take up!
    
[pngOptimizer](https://psydk.org/pngoptimizer):<br>
    pngOptimizer removes unnecessary data from a png, making the file size smaller, while keeping the image quality intact.<br>
    (I've personally used this on my mods and other projects, file decrease ranges anywhere from a few bytes to 4000000 bytes)<br>
    (Btw use this on sprite sheets after using funkin packer on them)

[optiVorbis](https://optivorbis.github.io/OptiVorbis/):<br>
    (I actually don't know (It takes a few bytes off of an ogg))

[JSON Formatter](https://www.text-utils.com/json-formatter/):<br>
    Removes the pretty print indents and spaces in jsons, can reduce file size by other half!

## Other tips:
* Instead of doing `sprite.scale.set(0.5, 0.5)`, resize the graphic itself to that size (I personally use [pixlr]() for this)
* * Funkin' Packer has a `scale` property on the right-hand side you can use on sprite sheets!