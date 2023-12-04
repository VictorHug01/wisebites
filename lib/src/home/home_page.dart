import 'package:carousel_slider/carousel_slider.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zerowate/src/home/avaliacao_component/avaliacao_component.dart';
import 'package:zerowate/src/home/formulario/formulario_component.dart';
import 'package:zerowate/src/theme/theme_class.dart';
import 'package:flutter_anchorlable/flutter_anchorlable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final anchorlableBodyController = AnchorlableController();
  final homeKey = GlobalObjectKey('homeKey');
  final introKey = GlobalObjectKey('introKey');
  final worksKey = GlobalObjectKey('worksKey');
  final contactKey = GlobalObjectKey('contactKey');
  int screenWidth = 0;

  void Visu() {
    screenWidth = MediaQuery.of(context).size.width < 650 ? 1 : 2;
  }

  List<Widget> imagens = [
    _buildImageContainer(
        'assets/s1.png', 'Um passo necessário rumo à sustentabilidade!'),
    _buildImageContainer('assets/s2.png', 'A iniciativa feita para sua ESCOLA'),
    _buildImageContainer('assets/s3.png',
        'Ajude a combater o desperdício de alimentos! Entenda como nossa iniciativa ajuda escolas a diminuir o desperdício.'),
  ];

  static Widget _buildImageContainer(String assetPath, String text) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) => Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: ColorThemeClass.colorSecondary,
                fontSize: MediaQuery.of(context).size.width < 750 ? 30 : 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  CoolAlert.show(
                    context: context,
                    width: MediaQuery.of(context).size.width / 3,
                    type: CoolAlertType.warning,
                    title: 'Atenção!',
                    text: 'Você será direcionado para o protótipo de teste.',
                    loopAnimation: false,
                    backgroundColor: ColorThemeClass.colorSecondary,
                    cancelBtnText: 'Cancelar',
                    borderRadius: 6.0,
                    confirmBtnText: 'Confirmar',
                    confirmBtnColor: ColorThemeClass.colorPrimary,
                    showCancelBtn: true,
                    closeOnConfirmBtnTap: true,
                    autoCloseDuration: Duration(seconds: 15),
                    onConfirmBtnTap: () {
                      launchUrl(
                        Uri.parse(
                          'https://www.figma.com/proto/5im7tLyEJkUUEJR8mf5CWF/WiseBites?type=design&node-id=2-25&t=byzTN2gBN0eX9jKF-0&scaling=scale-down&page-id=0%3A1&starting-point-node-id=2%3A25',
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Quero saber mais!',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResponsiveLayout(List<Widget> children) {
    return MediaQuery.of(context).size.width > 650
        ? SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,
            ),
          )
        : SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: ColorThemeClass.colorSecondary,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        animateJumpButton('Home', homeKey),
                        animateJumpButton('Sobre', worksKey),
                        animateJumpButton('Avaliação', introKey),
                        animateJumpButton('Contato', contactKey),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/favicon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80.0,
        leadingWidth: 150.0,
        foregroundColor: ColorThemeClass.colorPrimary,
        surfaceTintColor: Color(0xffe63946),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
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
                      animateJumpButton('Home', homeKey),
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
                key: homeKey,
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInOutSine,
                  viewportFraction: 1.0,
                  height: MediaQuery.of(context).size.height / 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: imagens.map((Image) => Image).toList(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              key: worksKey,
              child: buildResponsiveLayout([
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: MediaQuery.of(context).size.width < 650
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sobre nós',
                          softWrap: true,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width / 15.0
                                : MediaQuery.of(context).size.width / 25.0,
                            color: ColorThemeClass.colorPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'DESCULBRA OS BENEFÍCIOS DA NOSSA\nINICIATIVA.',
                          softWrap: false,
                          textAlign: MediaQuery.of(context).size.width < 650
                              ? TextAlign.center
                              : TextAlign.left,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width / 23.0
                                : MediaQuery.of(context).size.width / 45.0,
                            color: ColorThemeClass.colorPrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'https://www.figma.com/proto/5im7tLyEJkUUEJR8mf5CWF/WiseBites?type=design&node-id=18-129&t=byzTN2gBN0eX9jKF-0&scaling=scale-down&page-id=0%3A1&starting-point-node-id=2%3A25'));
                      },
                      child: Image.asset(
                        'assets/frame1.png',
                        width: MediaQuery.of(context).size.width >= 750
                            ? 200
                            : 200,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            AvaliacaoComponent(
              key: introKey,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.0,
                child: FormularioComponent(key: contactKey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget animateJumpButton(
    final String textList,
    GlobalKey anchor,
  ) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Builder(
            builder: (context) {
              return InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () async {
                  if (Scaffold.of(context).isEndDrawerOpen == true) {
                    Scaffold.of(context).closeEndDrawer();
                    await anchorlableBodyController.animateToAnchor(
                      anchor,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  } else {
                    await anchorlableBodyController.animateToAnchor(
                      anchor,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  textList,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              );
            },
          ),
        ),
      );
}
