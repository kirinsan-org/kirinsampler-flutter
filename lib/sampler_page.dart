import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sampler.dart';

class SamplerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              childAspectRatio: 10 / 8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: <Widget>[
                SamplerButton(
                  child: _buildText('きりんさん'),
                  onPressed: () => Provider.of<Sampler>(context).kirinsan(),
                ),
                SamplerButton(
                  child: _buildText('いいよね'),
                  onPressed: () => Provider.of<Sampler>(context).iiyone(),
                ),
                SamplerButton(
                  child: _buildText('40cm'),
                  onPressed: () => Provider.of<Sampler>(context).yonju(),
                ),
                SamplerButton(
                  child: _buildText('ウンヴォア！'),
                  onPressed: () => Provider.of<Sampler>(context).unvoa(),
                ),
                SamplerButton(
                  child: _buildText('Yeah'),
                  onPressed: () => Provider.of<Sampler>(context).yeah(),
                ),
                SamplerButton(
                  child: _buildText('ぜ～'),
                  onPressed: () => Provider.of<Sampler>(context).ze(),
                ),
                SamplerButton(
                  child: _buildText('から～'),
                  onPressed: () => Provider.of<Sampler>(context).kara(),
                ),
                SamplerButton(
                  child: _buildText('ね～'),
                  onPressed: () => Provider.of<Sampler>(context).ne(),
                ),
                SamplerButton(
                  child: _buildText('首が長いの'),
                  onPressed: () =>
                      Provider.of<Sampler>(context).kubiganagaino(),
                ),
                SamplerButton(
                  child: _buildText('長いんだ'),
                  onPressed: () => Provider.of<Sampler>(context).nagainda(),
                ),
                SamplerButton(
                  child: _buildText('ツノもあるの'),
                  onPressed: () => Provider.of<Sampler>(context).tsunomoaruno(),
                ),
                SamplerButton(
                  child: _buildText('おしまい'),
                  onPressed: () => Provider.of<Sampler>(context).oshimai(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildText(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xFF333333),
      ),
    );
  }
}

class SamplerButton extends StatelessWidget {
  const SamplerButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xD8FFFFFF),
            Color(0xD8F1F1F1),
            Color(0xD8F1F1F1),
            Color(0xD8DFDFDF),
            Color(0xD8CCCCCC),
          ],
          stops: [
            0.0,
            0.01,
            0.5,
            0.99,
            1.0,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(128, 0, 0, 0),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
