// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie_provider.dart';
import 'package:provider/provider.dart';

import 'detailpage.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MovieProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return GridView.builder(
          clipBehavior: Clip.antiAlias,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: value.likeList.length,
          itemBuilder: (context, index) {
            String sData = value.likeList[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        index: value.index,
                      ),
                    ));
              },
              child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        sData,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      )),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          onPressed: () {
                            value.removeMovie(sData);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(milliseconds: 200),
                                content: Center(
                                  child: Text(
                                    "Remove From Like Page",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                          )))
                ],
              ),
            );
          },
        );
      },
    ));
  }
}
