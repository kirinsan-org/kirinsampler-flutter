import 'dart:math';

import 'package:flutter_resonance_audio/flutter_resonance_audio.dart';

class Sampler {
  const Sampler({
    this.audioEngine,
    this.random,
  });

  static Future<Sampler> getInstance() async {
    await FlutterResonanceAudio().init(
      renderingMode: RenderingMode.STEREO_PANNING,
    );

    // Preload all sounds
    // final files = [
    //   "iiyone1.wav",
    //   "iiyone2.wav",
    //   "kara.wav",
    //   "kirinsan1.wav",
    //   "kirinsan2.wav",
    //   "kirinsan3.wav",
    //   "kirinsan4.wav",
    //   "kubiganagaino.wav",
    //   "nagainda.wav",
    //   "ne1.wav",
    //   "ne2.wav",
    //   "ne3.wav",
    //   "ne4.wav",
    //   "ne5.wav",
    //   "oshimai.wav",
    //   "tsunomoaruno.wav",
    //   "unvoa1.wav",
    //   "unvoa2.wav",
    //   "unvoa3.wav",
    //   "unvoa4.wav",
    //   "unvoa5.wav",
    //   "yeah1.wav",
    //   "yeah2.wav",
    //   "yeah3.wav",
    //   "yeah4.wav",
    //   "yonju1.wav",
    //   "yonju2.wav",
    //   "yonju3.wav",
    //   "yonju4.wav",
    //   "ze1.wav",
    //   "ze2.wav",
    //   "ze3.wav",
    //   "ze4.wav",
    //   "ze5.wav",
    // ];

    // final futures = files.map((file) =>
    //     FlutterResonanceAudio().preloadSoundFile('assets/sounds/$file'));
    // final results = await Future.wait(futures);
    // final allSuccess = results.every((result) => result);

    // if (!allSuccess) {
    //   throw Exception('Failed to preload all sounds');
    // }

    return Sampler(
      audioEngine: FlutterResonanceAudio(),
      random: Random(),
    );
  }

  final FlutterResonanceAudio audioEngine;
  final Random random;

  Future<void> kirinsan() {
    return _playRandom([
      'kirinsan1.wav',
      'kirinsan2.wav',
      'kirinsan3.wav',
      'kirinsan4.wav',
    ]);
  }

  Future<void> iiyone() {
    return _playRandom([
      'iiyone1.wav',
      'iiyone2.wav',
    ]);
  }

  Future<void> yonju() {
    return _playRandom([
      'yonju1.wav',
      'yonju2.wav',
      'yonju3.wav',
      'yonju4.wav',
    ]);
  }

  Future<void> unvoa() {
    return _playRandom([
      'unvoa1.wav',
      'unvoa2.wav',
      'unvoa3.wav',
      'unvoa4.wav',
      'unvoa5.wav',
    ]);
  }

  Future<void> yeah() {
    return _playRandom([
      'yeah1.wav',
      'yeah2.wav',
      'yeah3.wav',
      'yeah4.wav',
    ]);
  }

  Future<void> ze() {
    return _playRandom([
      'ze1.wav',
      'ze2.wav',
      'ze3.wav',
      'ze4.wav',
      'ze5.wav',
    ]);
  }

  Future<void> kara() {
    return _play('kara.wav');
  }

  Future<void> ne() {
    return _playRandom([
      'ne1.wav',
      'ne2.wav',
      'ne3.wav',
      'ne4.wav',
      'ne5.wav',
    ]);
  }

  Future<void> kubiganagaino() {
    return _play('kubiganagaino.wav');
  }

  Future<void> nagainda() {
    return _play('nagainda.wav');
  }

  Future<void> tsunomoaruno() {
    return _play('tsunomoaruno.wav');
  }

  Future<void> oshimai() {
    return _play('oshimai.wav');
  }

  Future<void> _playRandom(List<String> filenames) async {
    final index = random.nextInt(filenames.length);
    return _play(filenames[index]);
  }

  Future<void> _play(String filename) async {
    final sourceId = await audioEngine.createSoundObject(
      'assets/sounds/$filename',
      asset: true,
    );
    await audioEngine.playSound(sourceId);
  }
}
