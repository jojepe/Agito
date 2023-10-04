import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:agito/api/speech_api.dart';

class Home {
  String text = 'Olá! Como você está?';

  void main() {
    runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("Agito.com"),
            ),
          ),
          body: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.mic_none, size: 36), onPressed: toggleRecording),
        ),
        
        Future toggleRecording() => SpeechApi.toggleRecording(
              onResult: (text) => setState(() => this.(text) = text),
      ),
    );
  }
}