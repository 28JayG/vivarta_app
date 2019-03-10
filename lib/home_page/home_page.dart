import 'package:flutter/material.dart';
import 'package:indian_heritage/home_page/heritage_view.dart';
import 'package:indian_heritage/model/heritage_site.dart';

class HomePage extends StatefulWidget {
  final List<HeritageSite> sites;

  const HomePage({Key key, this.sites}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Heritage Sites',
          style: Theme.of(context).textTheme.display4.copyWith(fontSize: 36),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: GridView(
            children: List.generate(
              widget.sites.length,
              (int i) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return HeritageView(
                            site: widget.sites[i],
                          );
                        }),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(widget.sites[i].featureImageUri),
                            radius: _screenWidth * 0.3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                gradient: LinearGradient(
                                  colors: [Colors.white70, Colors.transparent],
                                  stops: [0.15, 0.6],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              widget.sites[i].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 17),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ),
      ),
    );
  }
}
