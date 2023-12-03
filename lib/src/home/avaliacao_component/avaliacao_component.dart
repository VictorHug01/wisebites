import 'package:flutter/material.dart';

class AvaliacaoComponent extends StatefulWidget {
  const AvaliacaoComponent({super.key});

  @override
  State<AvaliacaoComponent> createState() => _AvaliacaoComponentState();
}

class _AvaliacaoComponentState extends State<AvaliacaoComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: double.infinity,
      color: Colors.green,
    );
  }
}