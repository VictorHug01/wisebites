import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zerowate/src/home/avaliacao_component/avaliacao_component.dart';
import 'package:zerowate/src/home/drawerComponent/drawer_component.dart';
import 'package:zerowate/src/home/formulario/formulario_component.dart';
import 'package:zerowate/src/theme/theme_class.dart';
import 'package:flutter_anchorlable/flutter_anchorlable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int screenWidth = 0;

  Visu() {
    if (MediaQuery.of(context).size.width < 650) {
      return screenWidth = 1;
    } else {
      return screenWidth = 2;
    }
  }

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
  final anchorlableBodyController = AnchorlableController();
  final introKey = GlobalObjectKey('introKey');
  final worksKey = GlobalObjectKey('worksKey');
  final contactKey = GlobalObjectKey('contactKey');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerComponent(),
      appBar: AppBar(
        toolbarHeight: 80.0,
        leadingWidth: 150.0,
        foregroundColor: ColorThemeClass.colorPrimary,
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
                : Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () async {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => MyHomePage()),
                            );
                          },
                          child: Text(
                            'Home',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      animateJumpButton('Sobre', worksKey),
                      animateJumpButton('Avaliação', introKey),
                      animateJumpButton('Contato', contactKey),
                    ],
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: anchorlableBodyController,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInOutSine,
                  viewportFraction: 1.0,
                  height:
                      MediaQuery.of(context).size.width < 650 ? 200.0 : 300.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: imagens.map((Image) => Image).toList(),
              ),
            ),
            GridView.count(
              key: worksKey,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              crossAxisCount: Visu(),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio:
                  MediaQuery.of(context).size.width >= 650 ? 16 / 15 : 14 / 9,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sobre nós',
                          softWrap: true,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width / 20.0,
                            color: ColorThemeClass.colorPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'DESCULBRA OS BENEFÍCIOS DA NOSSA \n INICIATIVA.',
                          softWrap: false,
                          textAlign: MediaQuery.of(context).size.width < 650
                              ? TextAlign.center
                              : TextAlign.left,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width / 30.0
                                : MediaQuery.of(context).size.width / 45.0,
                            color: ColorThemeClass.colorPrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: MediaQuery.of(context).size.width < 650
                      ? Alignment.center
                      : Alignment.center,
                  child: Image.asset(
                    'assets/frame1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            AvaliacaoComponent(
              key: introKey,
            ),
            FormularioComponent(key: contactKey),
          ],
        ),
      ),
    );
  }

  Widget animateJumpButton(final String textList, GlobalKey anchor) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () async {
              await anchorlableBodyController.animateToAnchor(anchor,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            child: Text(
              textList,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      );
}
