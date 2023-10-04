import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/cupertino.dart';

// this api is responsible for taking the speech and save it to the app

class SpeechApi {
  static final _speech = SpeechToText();
  String text = 'Olá! Como você está?';

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
  }) async {
    final isAvailable = await _speech.initialize();

    if (isAvailable) {
      _speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    return isAvailable;
  }
}
