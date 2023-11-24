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
        fit: BoxFit.fill,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s2.png',
        fit: BoxFit.fill,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s3.png',
        fit: BoxFit.fill,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerComponent(),
      appBar: AppBar(
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        leadingWidth: 150.0,
        foregroundColor: Color(0XFFFF0000),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: MediaQuery.of(context).size.width < 650
                ? Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    );
                  })
                : const Row(
                    children: [
                      ListSpace(textList: 'Home'),
                      ListSpace(textList: 'Sobre nós'),
                      ListSpace(textList: 'Como funciona'),
                      ListSpace(textList: 'Custos'),
                      ListSpace(textList: 'Escolas'),
                    ],
                  ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayCurve: Curves.easeInOutSine,
                viewportFraction: 1.0,
                height: 450,
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
