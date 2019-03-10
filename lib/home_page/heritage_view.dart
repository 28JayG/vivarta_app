import 'package:flutter/material.dart';
import 'package:indian_heritage/home_page/carousel_image.dart';
import 'package:indian_heritage/model/heritage_site.dart';

class HeritageView extends StatefulWidget {
  final HeritageSite site;

  const HeritageView({Key key, this.site}) : super(key: key);

  @override
  _HeritageViewState createState() => _HeritageViewState();
}

class _HeritageViewState extends State<HeritageView> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(widget.site.featureImageUri),
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.05, 0.25, 0.35, 0.45, 0.6],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.site.title,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 30),
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.site.details,
                      style: Theme.of(context).textTheme.body1,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 100.0,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: PageView(
                    controller: pageController,
                    children: List.generate(
                        widget.site.carouselImageUris.length, (int i) {
                      return CarouselImage(
                        imageUri: widget.site.carouselImageUris[i],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
