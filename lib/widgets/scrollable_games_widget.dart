import 'package:flutter/material.dart';
import '../data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double _height;
  final double _width;
  final bool showTitle;

  final List<Game> _gamesData;

  ScrollableGamesWidget(
    this._height,
    this._width,
    this.showTitle,
    this._gamesData,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            _gamesData.map((_game) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: _height * 0.80,
                      width: _width * 0.30,
                      decoration: BoxDecoration(
                      image:DecorationImage(
                        image: NetworkImage(_game.coverImage.url),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
