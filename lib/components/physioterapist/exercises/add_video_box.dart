import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AddVideoBox extends StatefulWidget {
  const AddVideoBox({super.key});

  @override
  State<AddVideoBox> createState() => _AddVideoBoxState();
}

class _AddVideoBoxState extends State<AddVideoBox> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('' /* URL do backet que armazenará os videos*/),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
