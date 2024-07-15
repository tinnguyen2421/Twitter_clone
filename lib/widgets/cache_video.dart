import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CacheVideo extends StatefulWidget {
  final String videoPath;
  final BoxFit fit;

  const CacheVideo({
    Key? key,
    required this.videoPath,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  _CacheVideoState createState() => _CacheVideoState();
}

class _CacheVideoState extends State<CacheVideo> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: true, // Lặp lại video khi phát xong
      allowPlaybackSpeedChanging: false,
      autoInitialize: true,
      allowFullScreen: true,
      placeholder: Container(
        color: const Color(0xffeeeeee),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}
