import 'package:flutter/material.dart'; //give us alot useful material and functionality || most important class in flutter

import '../data.dart'; //importing data.dart file

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;

  @override
  void initState() { //might hang app if get asynchronous (async) data in this
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height; //get the height of the device
    _deviceWidth = MediaQuery.of(context).size.width; //get the width of the device
    return Scaffold(
      body: Stack(children: <Widget>[
        _featuredGamesWidget(), //this is function part
        _gradientBoxWidget(),
      ],) ,
    );
  }

  //this is the featured games widget part
  Widget _featuredGamesWidget(){
    return SizedBox( //this part is used for dynamically scale to a different screen size and adjust to different screen size
    height: _deviceHeight * 0.50 , 
    width: _deviceWidth , 
    child: PageView(
      scrollDirection: Axis.horizontal, //scrolling horizontally
      children: featuredGames.map((game){
        return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(game.coverImage.url), //NetworkImage
          fit: BoxFit.cover,
        ), //DecorationImage
      ), // BoxDecoration
    ); //container
    }).toList(),
    )); //listview // SizedBox
  }

//this is the gradient box widget part
  Widget _gradientBoxWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
      height: _deviceHeight * 0.80,
      width: _deviceWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Color.fromRGBO(35, 45, 59, 1.0),
          Colors.transparent,
          ],
          stops: [0.65, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
