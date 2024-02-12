// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie_app/model/search_model.dart';
import 'package:movie_app/view/view.dart';

class DetailPage extends StatefulWidget {
  final int? index;
  final Search? search;

  const DetailPage({super.key, this.index, this.search});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "${widget.search?.title}",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width / 1,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.white,
                      offset: Offset(0.9, 0.9),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child:
                    Image.network("${widget.search?.poster}", fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 23,
            ),
            Text(
              " Movie name : ${widget.search?.title}",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
            ),
            Text(
              " Releasing Year : ${widget.search?.year}",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 17, color: Colors.white),
            ),
            Text(
              " Type : ${widget.search?.type}",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(2),
                backgroundColor: MaterialStatePropertyAll(Colors.orange),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewMore(id: widget.search?.imdbId),
                  ),
                );
              },
              child: Text("View More", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
