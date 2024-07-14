import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RTSPStreamPage(),
    );
  }
}

class RTSPStreamPage extends StatefulWidget {
  @override
  _RTSPStreamPageState createState() => _RTSPStreamPageState();
}

class _RTSPStreamPageState extends State<RTSPStreamPage> {
  late VlcPlayerController _vlcViewController;
  final String _rtspUrl = "rtsp://admin:cethline04@192.168.0.120/onvif1"; // Thay thế bằng URL RTSP của bạn

  @override
  void initState() {
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      _rtspUrl,
      hwAcc: HwAcc.full,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RTSP Stream"),
      ),
      body: Center(
        child: VlcPlayer(
          controller: _vlcViewController,
          aspectRatio: 16 / 9,
          placeholder: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}