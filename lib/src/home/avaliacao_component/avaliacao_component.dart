import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zerowate/src/theme/theme_class.dart';

class AvaliacaoComponent extends StatefulWidget {
  const AvaliacaoComponent({super.key});

  @override
  State<AvaliacaoComponent> createState() => _AvaliacaoComponentState();
}

class _AvaliacaoComponentState extends State<AvaliacaoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget buildResponsiveLayout(List<Widget> children) {
      return MediaQuery.of(context).size.width > 1200
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

    return buildResponsiveLayout([
      Expanded(
        flex: MediaQuery.of(context).size.width > 1200 ? 2 : 0,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: MediaQuery.of(context).size.width < 650
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  'O que os outros dizem?',
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width < 650
                        ? MediaQuery.of(context).size.width / 15.0
                        : MediaQuery.of(context).size.width / 25.0,
                    color: ColorThemeClass.colorPrimary,
                  ),
                ),
                Text(
                  'Leia depoimentos de outras escolas.',
                  softWrap: false,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width < 650
                        ? MediaQuery.of(context).size.width / 30.0
                        : MediaQuery.of(context).size.width / 45.0,
                    color: ColorThemeClass.colorPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      CardAvaliacao(
        textTitle: "Escola A",
        textSubTitle:
            "Nossa, o app é incrível! Na escola, agora evitamos o desperdício de comida de maneira fácil e divertida. Todos estão adorando contribuir para um ambiente mais sustentável.",
        imagePeople: 'assets/people1.jpg',
      ),
      CardAvaliacao(
        textTitle: "Escola B",
        textSubTitle:
            "Incrível! O aplicativo transformou nossa escola, tornando a redução do desperdício de comida algo fácil e divertido. Todos estão entusiasmados em contribuir para um ambiente mais sustentável. É pura alegria fazer parte disso!",
        imagePeople: 'assets/people2.jpg',
      ),
    ]);
  }
}

class CardAvaliacao extends StatefulWidget {
  final String textTitle;
  final String textSubTitle;
  final String imagePeople;
  const CardAvaliacao(
      {super.key,
      required this.textSubTitle,
      required this.textTitle,
      required this.imagePeople});

  @override
  State<CardAvaliacao> createState() => _CardAvaliacaoState();
}

class _CardAvaliacaoState extends State<CardAvaliacao> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: MediaQuery.of(context).size.width > 1200 ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffe63946),
                    borderRadius: BorderRadius.circular(6.0)),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width >= 650 &&  MediaQuery.of(context).size.width <= 1200
                ? 200
                :300,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(widget.imagePeople),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          widget.textTitle,
                          style: GoogleFonts.montserrat(
                              color: ColorThemeClass.colorSecondary,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        titleAlignment: ListTileTitleAlignment.center,
                        trailing: Builder(
                          builder: (context) {
                            return RatingBar.builder(
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: 15,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.5),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.textSubTitle,
                        style: GoogleFonts.montserrat(
                          color: ColorThemeClass.colorSecondary,
                          fontSize:
                              MediaQuery.of(context).size.width < 650 ? 11 : 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
