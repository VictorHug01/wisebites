import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zerowate/src/home/drawerComponent/drawer_component.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> imagens = [
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s1.png',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s2.png',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s3.png',
        fit: BoxFit.cover,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerComponent(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          MediaQuery.of(context).size.width < 650
              ? Builder(
                builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    );
                }
              )
              : const Row(
                  children: [
                    ListSpace(textList: 'Home'),
                    ListSpace(textList: 'Sobre nós'),
                    ListSpace(textList: 'Como funciona'),
                    ListSpace(textList: 'Custos'),
                    ListSpace(textList: 'Escolas'),
                  ],
                ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayCurve: Curves.easeInOutSine,
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
                height: 350,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imagens.map((Image) => Image).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ListSpace extends StatelessWidget {
  final String textList;
  const ListSpace({super.key, required this.textList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Text(textList),
    );
  }
}
