import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

import 'third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            "images/logowhite.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Scrollbar(
      child: ListView(
        children: List.generate(9, (int i) {
          int game = i + 1;
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  debugPrint('Loading co-ordinates for game  $game');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                  SwipeDetector(
                    onSwipeRight: () {
                      Navigator.pop(context);
                    },
                    onSwipeLeft: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdPage()),
                      );
                    },
                    child: null,
                  );
                },
                child: new Image.asset(
                  "images/img$i.jpg",
                  fit: BoxFit.fitWidth,
                  // width: 400.0,
                  // height: 180.0,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
