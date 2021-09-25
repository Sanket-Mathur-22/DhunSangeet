import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List musicList = [
    {
      "title": "Driving Ambition",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-driving-ambition-32.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://pagalee.com/mp3-songs/bollywood-mp3-songs/param-sundari-mimi-128-kbps-sound.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "by Alejandro Magaña",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
    {
      "title": "Sports Highlights",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-sports-highlights-51.mp3",
    },
    {
      "title": "Getting Ready",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-getting-ready-46.mp3",
    },
    {
      "title": "Couture",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/853199/pexels-photo-853199.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "url": "https://assets.mixkit.co/music/preview/mixkit-couture-56.mp3",
    },
    {
      "title": "Hollidays",
      "artist": "by Grigoriy Nuzhny",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-hollidays-690.mp3",
    },
    {
      "title": "Summer's Here",
      "artist": "by Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-summers-here-91.mp3",
    },
  ];

  String currentTitle = "";
  String currentArtist = "";
  String currentCover = "";
  String currentSong = "";
  IconData btnIcon = Icons.play_arrow;

  AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  Duration musicDuration = Duration();
  Duration musicPosition = Duration();

  playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      _audioPlayer.pause();
      int result = await _audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await _audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }

    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        musicDuration = event;
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        musicPosition = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.greenAccent,
              Color(0xff232323),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dhun Sangeet",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/sanket.png"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: musicList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        playMusic(musicList[index]["url"]);
                        setState(() {
                          currentTitle = musicList[index]["title"];
                          currentArtist = musicList[index]["artist"];
                          currentCover = musicList[index]["cover"];
                        });
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            musicList[index]["cover"],
                          ),
                        ),
                        title: Text(
                          musicList[index]["title"],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          musicList[index]["artist"],
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Container(
                          margin: EdgeInsets.all(17.0),
                          child: Icon(
                            Icons.music_note,
                            color: Colors.blueGrey.shade200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(currentCover),
                      ),
                      title: Text(
                        currentTitle,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        currentArtist,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        height: 40.0,
                        width: 40.0,
                        margin: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (isPlaying) {
                              _audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = false;
                              });
                            } else {
                              _audioPlayer.resume();

                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(
                            btnIcon,
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                        right: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${musicPosition.inMinutes}:${musicPosition.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Expanded(
                            child: Slider.adaptive(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              value: musicPosition.inSeconds.toDouble(),
                              max: musicDuration.inSeconds.toDouble(),
                              onChanged: (val) {},
                            ),
                          ),
                          Text(
                            "${musicDuration.inMinutes}:${musicDuration.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
