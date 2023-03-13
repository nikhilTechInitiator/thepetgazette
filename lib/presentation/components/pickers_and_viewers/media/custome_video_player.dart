import 'dart:async';
import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String url;
  final Duration startDuration;
  final String? videoId;

  final StreamController<String> videoControllerStream;

  const CustomVideoPlayer(
      {super.key,
      required this.url,
      this.startDuration = Duration.zero,
      this.videoId,
      required this.videoControllerStream});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  BetterPlayerController? _betterPlayerController;

  bool isFinished = false;

  bool isInViewPort = true;
  String previousVideoId = 'video_id';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.videoControllerStream.stream.asBroadcastStream().listen((event) {
      debugPrint('videoControllerStream listen $event');
      if (event == 'pause') {
        if (_betterPlayerController!.isPlaying()!) {
          _betterPlayerController!.pause();
        }
      }
      if (event == 'stop') {
        if (_betterPlayerController!.isPlaying()!) {
          if (widget.videoId != null) {
            // addToRecentlyWatched(widget.videoId);
          }
        }
      }
    });
  }

  init() {
    previousVideoId = widget.videoId ?? 'video_id';
    debugPrint(widget.startDuration.toString());
    BetterPlayerDataSource betterPlayerDataSource;


      // var encodedUrl = widget.url!.replaceAll(' ', '%20');
      // var encodedUrl ='https://iwnwrestling.s3.us-east-1.amazonaws.com/videos/MEW%20Underground%20Season1%20Episode%201.mp4'.replaceAll(' ', '%20');
      var encodedUrl ='https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'.replaceAll(' ', '%20');

      debugPrint('better player  ${widget.url}');
      debugPrint('better player  $encodedUrl');


      betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        encodedUrl,
        useAsmsAudioTracks: true,
        useAsmsTracks: true,
        bufferingConfiguration: const BetterPlayerBufferingConfiguration(
          minBufferMs: 50000,
          maxBufferMs: 100000,
          bufferForPlaybackMs: 5000,
          bufferForPlaybackAfterRebufferMs: 5000,
        ),
      );


    debugPrint("betterPlayerDataSource ${betterPlayerDataSource.url}");
    BetterPlayerConfiguration configuration = BetterPlayerConfiguration(
      autoDispose: true,
      fit: BoxFit.contain,
      // autoPlay: widget.videoId != null,
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        enablePip: true,
      ),
      autoDetectFullscreenDeviceOrientation: true,

      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      playerVisibilityChangedBehavior: (double visibleFraction) {
        if (visibleFraction < 0.5) {
          isInViewPort = false;
        } else {
          isInViewPort = true;
        }
      },

      looping: true,
      // playerVisibilityChangedBehavior: ,
      // startAt: widget.startDuration??null,
      handleLifecycle: true,
    );
    _betterPlayerController = BetterPlayerController(configuration,
        betterPlayerDataSource: betterPlayerDataSource);

    _betterPlayerController!.setMixWithOthers(false);
    _betterPlayerController!.addEventsListener((BetterPlayerEvent event) async {
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        // _betterPlayerController!.setOverriddenAspectRatio(
        //     _betterPlayerController!.videoPlayerController!.value.aspectRatio);
        _betterPlayerController!.seekTo(widget.startDuration);
        await Future.delayed(const Duration(milliseconds: 100));
        _betterPlayerController!.play();
      }
      if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
        isFinished = true;
      }

      if (!isInViewPort) {
        _betterPlayerController!.pause();
      }
    });
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    debugPrint('better player dispose ${widget.videoId}');

    // if (widget.videoId != null) {
    //   addToRecentlyWatched(widget.videoId);
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (previousVideoId != widget.videoId) {
      init();
    }
    return BetterPlayer(
      controller: _betterPlayerController!,
    );
  }

// addToRecentlyWatched(String videoId) async {
//   if (_betterPlayerController != null) {
//     if (_betterPlayerController.hasCurrentDataSourceStarted) {
//       Duration pauseDuration =
//       await _betterPlayerController.videoPlayerController.position;
//       int pausePosition = pauseDuration.inSeconds;
//
//       await Provider.of<RecentlyWatchedProvider>(
//           MyApp.navigatorKey.currentContext,
//           listen: false)
//           .addToRecentlyWatchList(
//           videoId, isFinished ? 'yes' : 'no', pausePosition);
//     }
//     _betterPlayerController.dispose(forceDispose: true);
//   }
// }
}
