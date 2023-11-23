import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            actions: [
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text('Home'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            ],
            floating: false,
            pinned: false,
            snap: false,
            leading: FlutterLogo(
              size: 40,
            ),
          ),
        ],
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (context, index, realIndex) {
                    return Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Container(
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              'Item${index++}',
                              style: GoogleFonts.montserrat(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 5,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
