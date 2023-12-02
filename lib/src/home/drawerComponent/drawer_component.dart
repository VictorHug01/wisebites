import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zerowate/src/theme/theme_class.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListDrawer(textList: "Sobre nós"),
                      ListDrawer(textList: "Como Funciona"),
                      ListDrawer(textList: "Custos"),
                      ListDrawer(textList: "Escolas"),
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
    );
  }
}

class ListDrawer extends StatelessWidget {
  final String textList;
  const ListDrawer({super.key, required this.textList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          textList,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: ColorThemeClass.colorPrimary,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
