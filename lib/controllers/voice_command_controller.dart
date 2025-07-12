import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceCommandController {
  final SpeechToText _speech = SpeechToText();
  bool isListening = false;

  Future<void> initialize() async {
    await _speech.initialize();
  }

  void listen(
    BuildContext context,
    Function(String) onResult, {
    required Function(bool) onListeningChanged,
  }) async {
    if (!isListening) {
      isListening = true;
      onListeningChanged(true);

      _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            stop(onListeningChanged);
            onResult(result.recognizedWords.toLowerCase());
          }
        },
      );
    } else {
      stop(onListeningChanged);
    }
  }

  void stop(Function(bool) onListeningChanged) {
    _speech.stop();
    isListening = false;
    onListeningChanged(false);
  }
}
