package;

import flixel.FlxG;

class Highscore
{
	#if (haxe >= "4.0.0")
	public static var songScores:Map<String, Int> = new Map();
	#else
	public static var songScores:Map<String, Int> = new Map<String, Int>();
	#end


	public static function saveScore(song:String, score:Int = 0):Void
	{
		#if !switch
		NGio.postScore(score, song);
		#end


		if (songScores.exists(song))
		{
			if (songScores.get(song) < score)
				setScore(song, score);
		}
		else
			setScore(song, score);
	}

	public static function saveWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 1):Void
	{

		#if !switch
		NGio.postScore(score, "Week " + week);
		#end


		var daWeek:String = 'week' + week;

		if (songScores.exists(daWeek))
		{
			if (songScores.get(daWeek) < score)
				setScore(daWeek, score);
		}
		else
			setScore(daWeek, score);
	}

	/**
	 * YOU SHOULD FORMAT SONG WITH formatSong() BEFORE TOSSING IN SONG VARIABLE
	 */
	static function setScore(song:String, score:Int):Void
	{
		// Reminder that I don't need to format this song, it should come formatted!
		songScores.set(song, score);
		FlxG.save.data.songScores = songScores;
		FlxG.save.flush();
	}

	public static function getScore(song:String):Int
	{
		if (!songScores.exists(song))
			setScore(song, 0);

		return songScores.get(song);
	}

	public static function getWeekScore(week:Int):Int
	{
		if (!songScores.exists('week' + week))
			setScore('week' + week, 0);

		return songScores.get('week' + week);
	}

	public static function load():Void
	{
		if (FlxG.save.data.songScores != null)
		{
			songScores = FlxG.save.data.songScores;
		}
	}
}
