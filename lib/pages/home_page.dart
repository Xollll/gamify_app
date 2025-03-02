import 'package:flutter/material.dart'; //give us alot useful material and functionality || most important class in flutter
import '../widgets/scrollable_games_widget.dart'; //importing scrollable_games_widget.dart file
import '../data.dart'; //importing data.dart file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;

  var _selectedGame;

  @override
  void initState() {
    //might hang app if get asynchronous (async) data in this
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight =
        MediaQuery.of(context).size.height; //get the height of the device
    _deviceWidth =
        MediaQuery.of(context).size.width; //get the width of the device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGamesWidget(), //this is function part
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  //this is the featured games widget part
  Widget _featuredGamesWidget() {
    return SizedBox(
      //this part is used for dynamically scale to a different screen size and adjust to different screen size
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedGame = index;
          });
        },
        scrollDirection: Axis.horizontal, //scrolling horizontally
        children:
            featuredGames.map((game) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(game.coverImage.url), //NetworkImage
                    fit: BoxFit.cover,
                  ), //DecorationImage
                ), // BoxDecoration
              ); //container
            }).toList(),
      ),
    ); //listview // SizedBox
  }

  //this is the gradient box widget part
  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        width: _deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
            stops: [0.65, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        //using this applied the horizontal axis from both the left and the right side and the same for the vertical axis from both top and bottom
        horizontal: _deviceWidth * 0.05,
        vertical: _deviceHeight * 0.005,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),

          SizedBox(
            height: _deviceHeight * 0.13,
          ), //space between top bar and featured games info
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(
              _deviceHeight * 0.24,
              _deviceWidth,
              false,
              games,
            ), //nama dekat folder widgets
          ),
          _featuredGamesBannerWidget(),
          ScrollableGamesWidget(_deviceHeight * 0.22, _deviceWidth, false, games2),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.menu, color: Colors.white, size: 30),

          Row(
            children: <Widget>[
              Icon(Icons.search, color: Colors.white, size: 30),
              SizedBox(
                width: _deviceWidth * 0.03,
              ), //SizedBox // space between icon

              Icon(Icons.notifications_none, color: Colors.white, size: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: _deviceHeight * 0.030,
            ),
          ),
          SizedBox(height: _deviceHeight * 0.01), //space between text and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,

            children:
                featuredGames.map((_game) {
                  bool _isActive =
                      _game.title == featuredGames[_selectedGame].title;
                  double circleRadius =
                      _deviceHeight * 0.004; //height every image
                  return Container(
                    margin: EdgeInsets.only(
                      right: _deviceWidth * 0.015,
                    ), //space between icon
                    height: circleRadius * 2,
                    width: circleRadius * 2,
                    decoration: BoxDecoration(
                      color: _isActive ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesBannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(featuredGames[3].coverImage.url),
        ),
      ),
    );
  }
}
