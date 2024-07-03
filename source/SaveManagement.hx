import flixel.FlxG;

using StringTools;

class SaveManagement {
    public static function init() {
        // Songs
        if (FlxG.save.data.unlockedSongs == null) // shhhhhhh
			FlxG.save.data.unlockedSongs = [];

        // Sound
		if(FlxG.save.data.volume != null)
			FlxG.sound.volume = FlxG.save.data.volume;
		
		if (FlxG.save.data.mute != null)
			FlxG.sound.muted = FlxG.save.data.mute;

        // Options
        if (FlxG.save.data.options == null)
            defaultOptions();

        // Shit that happened
        if (FlxG.save.data.unlockedFreeplay == null)
            FlxG.save.data.unlockedFreeplay = false;

        if (FlxG.save.data.frostedonespotted == null)
            FlxG.save.data.frostedonespotted = false;
    }

    public static function unlockSong(song:String) {
        trace(song.toLowerCase().trim());
        trace(FlxG.save.data.unlockedSongs.contains(song.toLowerCase().trim()));
        if (FlxG.save.data.unlockedSongs != null) {
            if (!FlxG.save.data.unlockedSongs.contains(song.toLowerCase().trim())) FlxG.save.data.unlockedSongs.push(song.toLowerCase().trim());
            FlxG.save.flush();
        }
    }

    public static function resetSaveData() {
        FlxG.save.data.unlockedSongs = [];
        FlxG.save.data.newInput = true;
        FlxG.save.data.freaky = false;
        FlxG.save.data.dfjk = false;
        FlxG.save.data.downscroll = false;

        FlxG.save.data.unlockedFreeplay = false;

        defaultOptions();
    }

    public static function defaultOptions() {
        FlxG.save.data.options = new Map<String, Dynamic>();

        FlxG.save.data.options.set("Keybinds", "DFJK");
        FlxG.save.data.options.set("Input System", "New");
        FlxG.save.data.options.set("Scroll Direction", "Up");
        FlxG.save.data.options.set("Hitsounds", "Off");
    }

    public static function setOption(option:String, value:Dynamic):Void {
        FlxG.save.data.options.set(option, value);
    }

    public static function getOption(option:String):Dynamic {
        return FlxG.save.data.options.get(option);
    }
}