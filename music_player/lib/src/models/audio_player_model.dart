import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _currentDuration = new Duration(milliseconds: 0);

  AnimationController _controller;

  bool get isPlaying => this._isPlaying;
  Duration get songDuration => this._songDuration;
  Duration get currentDuration => this._currentDuration;
  AnimationController get controller => this._controller;

  double get percentage => this._songDuration.inSeconds > 0 ? this._currentDuration.inSeconds / this._songDuration.inSeconds : 0;
  String get songDurationString => this.getDurationString(this._songDuration);
  String get currentDurationString => this.getDurationString(this._currentDuration);

  set isPlaying(bool value) {
      this._isPlaying = value;

      notifyListeners();
  }

  set songDuration(Duration value) {
    this._songDuration = value;

    notifyListeners();
  }

  set currentDuration(Duration value) {
    this._currentDuration = value;

    notifyListeners();
  }

  set controller(AnimationController value) {
    this._controller = value;
  }

  String getDurationString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) {
        return '$n';
      }

      return '0$n';
    }

    return '${ twoDigits(duration.inMinutes.remainder(60)) } : ${ twoDigits(duration.inSeconds.remainder(60)) }';
  }
}