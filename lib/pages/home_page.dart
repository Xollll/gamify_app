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
      body: Stack(children: <Widget>[_featuredGamesWidget()
      ],) ,
    );
  }
  Widget _featuredGamesWidget(){
    return SizedBox(
    height: _deviceHeight * 0.30 , 
    width: _deviceWidth , 
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(featuredGames[0].coverImage.url), 

          fit: BoxFit.cover,
        ),
      ),
    ) ,); //this part is used for dynamically scale to a different screen size and adjust to different screen size
  }
}
