import 'dart:math';
import 'package:flutter/material.dart';

void main () => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamusterGachaState();
}  

class _HamusterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🛍️', '🍔', '👥', '🎤'];
  final images = [
    'assets/images/IMG_0006jpg',
    'assets/images/IMG_0228.jpg',
    'assets/images/IMG_0733.jpg',
    'assets/images/IMG_0743.jpg',
    'assets/images/IMG_0976.jpg',
    'assets/images/IMG_1445.jpg',
    'assets/images/IMG_3824.jpg',
    'assets/images/IMG_6594.jpg',
    'assets/images/IMG_9752.jpg',
  ];

  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Hangout Friend Gacha')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
              ? Center(
                child: Text(
                  emojis[e],
                  style: const TextStyle(fontSize: 100),
                ),
              )
              : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🎰', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}