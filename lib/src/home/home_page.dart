import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        fit: BoxFit.fitWidth,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s2.png',
        fit: BoxFit.fitWidth,
      ),
    ),
    SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/s3.png',
        fit: BoxFit.fitWidth,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerComponent(),
      appBar: AppBar(
        toolbarHeight: 80.0,
        leadingWidth: 150.0,
        foregroundColor: Color(0XFFFF0000),
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
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
            height: 8.0,
          ),
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayCurve: Curves.easeInOutSine,
                viewportFraction: 1.0,
                height: 350,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imagens.map((Image) => Image).toList(),
            ),
          ),
          Container(
            height: 350.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Porque WiseBites?',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 60.0,
                              color: Color(0XFFFF0000),
                            ),
                          ),
                          Text(
                            'DESCULBRA OS BENEFÍCIOS DA NOSSA \n INICIATIVA.',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0XFFFF0000),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
      child: Text(
        textList,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
