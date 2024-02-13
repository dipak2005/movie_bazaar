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
    return Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.transparent,
          title: Text(
            "Like Page",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: Hero(
            tag: "movie",
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Consumer<MovieProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return (value.likeList.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 150,
                          ),
                        ),
                      ),
                      Text("Not Like Movies !!! ",style: TextStyle(color: Colors.white),),
                      Hero(
                        tag: "like",
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {
                            Navigator.pushNamed(context, "Home");
                          },
                          child: Text(
                            "Like Movies",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                : GridView.builder(
                    clipBehavior: Clip.antiAlias,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          duration: Duration(milliseconds: 200),
                                          content: Center(
                                            child: Text(
                                              "Remove From Like Page",
                                              style: TextStyle(
                                                  color: Colors.white),
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
