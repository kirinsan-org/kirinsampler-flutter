import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sampler.dart';
import 'sampler_page.dart';

void main() async {
  final sampler = await Sampler.getInstance();

  runApp(Provider<Sampler>.value(
    value: sampler,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kirinsampler',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        splashFactory: InkRipple.splashFactory,
      ),
      home: SamplerPage(),
    );
  }
}
