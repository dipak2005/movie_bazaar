// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/idmodel.dart';
import 'package:movie_app/model/movie_helper.dart';

import '../model/search_model.dart';

class ViewMore extends StatefulWidget {
  final String? id;

  const ViewMore({super.key, this.id});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: MovieHelper().iSearch(widget.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            IdModel? data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width / 1.7,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: Colors.black,
                          offset: Offset(0.9, 0.9),
                        )
                      ], borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                        "${data?.poster}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 26,
                  ),
                  Divider(
                    color: Colors.black,endIndent: 20,indent: 20,
                  ),
                  Text(
                    " Name : ${data?.title}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    color: Colors.black,endIndent: 20,indent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " Releasing : ${data?.released}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " Year : ${data?.year}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment(-0.85, 0),
                    child: Text(" Duration : ${data?.runtime}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )),
                  ),
                  Align(
                      alignment: Alignment(-0.53, 0),
                      child: Text(
                        " Casting type : ${data?.genre}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                    alignment: Alignment(-0.86, 0),
                    child: Text(
                      " Type : ${data?.type}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.76, 0),
                    child: Text(
                      "${data?.director}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.7, 0),
                    child: Text(
                      " Weiters : ${data?.writer}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        " Actors : ${data?.actors}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(
                      " Language : ${data?.language}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(
                      " Country : ${data?.country}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        "Awards : ${data?.awards}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " Description : ${data?.plot}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  // Align(
                  //     alignment: Alignment(-0.7, 0),
                  //     child: Text(
                  //       " Source : ${data?.ratings?[0].source}",
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.w700),
                  //     )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        initialRating:
                            double.parse("  ${data?.imdbRating}"),
                        minRating: 1,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        " Rating : ${data?.imdbRating}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        " Boxoffice : ${data?.boxOffice}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        initialRating: double.parse("  ${data?.imdbRating}"),
                        minRating: 1,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        " IMDB Rating : ${data?.imdbRating}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " MetaScore : ${data?.metascore}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " Production : ${data?.production}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        " Website : ${data?.website}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
                backgroundColor: Colors.purpleAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
