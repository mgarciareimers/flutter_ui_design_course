import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

// Helpers.
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';

// Widgets.
import 'package:music_player/src/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff33333E),
                  Color(0xff201E28),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.center,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),)
            ),
            child: Column(
              children: [
                CustomAppBar(),
                SizedBox(height: 40),
                _DiskDuration(),
                SizedBox(height: 30),
                _TitlePlay(),
                SizedBox(height: 40),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: _Lyrics()),
        ],
      )
    );
  }
}

class _DiskDuration extends StatelessWidget {
  const _DiskDuration({ Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _DiskImage(),
          SizedBox(width: 50),
          Expanded(child: _ProgressBar()),
        ],
      ),
    );
  }
}

class _DiskImage extends StatelessWidget {
  const _DiskImage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: 220,
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              child: Image(image: AssetImage('assets/img/aurora.jpg')),
              duration: Duration(milliseconds: 9000),
              infinite: true,
              controller: (animationController) => audioPlayerModel.controller = animationController,
              manualTrigger: true,
              animate: false,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff1C1C25),
              ),
            ),
          ]
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ]
        )
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final double percentage = audioPlayerModel.percentage;

    return Container(
      child: Column(
        children: [
          Text('${ audioPlayerModel.songDurationString }', style: TextStyle(color: Colors.white.withOpacity(0.4))),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(width: 3, height: 180, color: Colors.white.withOpacity(0.1)),
              Positioned(bottom: 0, child: Container(width: 3, height: 180 * percentage, color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Text('${ audioPlayerModel.currentDurationString }', style: TextStyle(color: Colors.white.withOpacity(0.4))),
        ],
      ),
    );
  }
}

class _TitlePlay extends StatefulWidget {
  @override
  __TitlePlayState createState() => __TitlePlayState();
}

class __TitlePlayState extends State<_TitlePlay> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  AnimationController playAnimationController;
  
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    this.playAnimationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    this.playAnimationController.dispose();
    super.dispose();
  }
  
  void open() {
    final AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
    
    this.assetsAudioPlayer.open(Audio('assets/music/Breaking-Benjamin-Far-Away.mp3'));
    
    this.assetsAudioPlayer.currentPosition.listen((Duration duration) {
      audioPlayerModel.currentDuration = duration;
    });

    this.assetsAudioPlayer.current.listen((Playing playing) {
      audioPlayerModel.songDuration = playing.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text('-Breaking Benjamin-', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5))),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: this.playAnimationController),
            onPressed: () => this._onPlayButtonClicked(),
          )
        ],
      ),
    );
  }

  // Method that is called when the user clicks the play button.
  void _onPlayButtonClicked() {
    final AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
    this.isPlaying = !this.isPlaying;

    if (this.isPlaying) {
      this.playAnimationController.forward();
      audioPlayerModel.controller.repeat();
    } else {
      audioPlayerModel.controller.stop();
      this.playAnimationController.reverse();
    }

    if (this.firstTime) {
      this.open();
      this.firstTime = false;
    } else {
      this.assetsAudioPlayer.playOrPause();
    }
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> lyrics = getLyrics();

    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics.map((String lyric) => Text(lyric, style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6)))).toList(),
      ),
    );
  }
}



