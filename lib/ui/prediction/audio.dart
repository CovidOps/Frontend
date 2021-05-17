import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/model/prediction_response.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

typedef _Fn = void Function();

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String _mPath = '${Helper.getId()}.wav';

  @override
  void initState() {
    _mPlayer!.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mPlayer!.closeAudioSession();
    _mPlayer = null;

    _mRecorder!.closeAudioSession();
    _mRecorder = null;
    super.dispose();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openAudioSession();
    _mRecorderIsInited = true;
  }

  // ----------------------  Here is the code for recording and playback -------

  void record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _mplaybackReady = true;
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
        fromURI: _mPath,
        //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
        whenFinished: () {
          setState(() {});
        })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }
//-----------------------------API----------------------------------------------
  void predictAudio() async{
    var tempDir = await getTemporaryDirectory();
    var fout = File('${tempDir.path}/${Helper.getId()}.wav');
    var len = await fout.length();
    print(len);

    Uri uri = Uri.https(Helper.MODEL_BASE_URL, "audio");
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath(
          'file', fout.path, filename: "${Helper.getId()}.wav"));

    http.Response response = await http.Response.fromStream(await request.send());
    print("response code ${response.statusCode}");
    try{
      print(response.body);
      PredictionResponse res = PredictionResponse.fromJson(jsonDecode(response.body));
      print('your prediction is ${res.prediction}');
    }catch(Exception){

    }
  }
// ----------------------------- UI --------------------------------------------

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    return _mRecorder!.isStopped ? record : stopRecorder;
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
  }

  _Fn? submitFn(){
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped || !_mPlayer!.isStopped) {
      return null;
    }

    return (_mRecorder!.isStopped && _mPlayer!.isStopped)? predictAudio : () => {};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
          height: 80,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFAF0E6),
            border: Border.all(
              color: Colors.indigo,
              width: 3,
            ),
          ),
          child: Row(children: [
            ElevatedButton(
              onPressed: getRecorderFn(),
              //color: Colors.white,
              //disabledColor: Colors.grey,
              child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(_mRecorder!.isRecording
                ? 'Recording in progress'
                : 'Recorder is stopped'),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
          height: 80,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFAF0E6),
            border: Border.all(
              color: Colors.indigo,
              width: 3,
            ),
          ),
          child: Row(children: [
            ElevatedButton(
              onPressed: getPlaybackFn(),
              //color: Colors.white,
              //disabledColor: Colors.grey,
              child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(_mPlayer!.isPlaying
                ? 'Playback in progress'
                : 'Player is stopped'),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
          height: 80,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFAF0E6),
            border: Border.all(
              color: Colors.indigo,
              width: 3,
            ),
          ),
          child: Row(children: [
            ElevatedButton(
              onPressed: submitFn(),
              //color: Colors.white,
              //disabledColor: Colors.grey,
              child: Text(_mPlayer!.isPlaying ? 'Wait' : 'Submit'),
            ),
            /*SizedBox(
              width: 20,
            ),
            Text(_mPlayer!.isPlaying
                ? 'Playback in progress'
                : 'Player is stopped'),*/
          ]),
        ),
      ],
    );
  }
}
