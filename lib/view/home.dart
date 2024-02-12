// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie_provider.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/model/movie_helper.dart';
import 'package:movie_app/model/search_model.dart';
import 'package:movie_app/view/detailpage.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String sModel = "animal";
  String value1 = "";

  @override
  void initState() {
    SearchProvider sp = Provider.of<SearchProvider>(context, listen: false);
    sp.sMovie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/box.png"),
        ),
        title: Text(
          "Movie Box",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "LikePage");
            },
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<SearchProvider>(
            builder: (context, value, child) => FutureBuilder(
              future: MovieHelper()
                  .searchApi(value.sMovie.isEmpty ? sModel : value.sMovie),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Image.asset("assets/retry.png")),
                      Text(
                        "Not Found",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${snapshot.error.runtimeType}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  SearchModel? data = snapshot.data;
                  // Search? title = data?.search![0];
                  return Consumer2<MovieProvider, SearchProvider>(
                    builder: (context, value, value2, child) {
                      return Expanded(
                        child: Column(
                          children: [
                            value.isShow
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        value2.searchApi(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        hintText: "Search Movies or Title",
                                        enabled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        focusColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        suffixIconColor: Colors.white,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            value.hide();
                                          },
                                          icon: Icon(Icons.cancel),
                                        ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            value.show();
                                          },
                                          child: Text(
                                            "Search Movie or Title",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          )),
                                      // value.isPage
                                      //     ? SizedBox(
                                      //         width: MediaQuery.sizeOf(context)
                                      //                 .width /
                                      //             1.8,
                                      //         child: Padding(
                                      //           padding:
                                      //               const EdgeInsets.symmetric(
                                      //                   horizontal: 38.0),
                                      //           child: TextFormField(
                                      //             onFieldSubmitted: (value) {
                                      //               value2.searchPage(value1,value);
                                      //             },
                                      //             decoration: InputDecoration(
                                      //                 border: OutlineInputBorder(
                                      //                     borderRadius:
                                      //                     BorderRadius.circular(20),
                                      //                     borderSide: BorderSide(
                                      //                         color: Colors.black12)),
                                      //                 hintText: "Search page",
                                      //                 enabled: true,
                                      //                 focusColor: Colors.blue,
                                      //                 focusedBorder: OutlineInputBorder(
                                      //                     borderSide: BorderSide(
                                      //                       color: Colors.black,
                                      //                     ),
                                      //                     borderRadius:
                                      //                     BorderRadius.circular(20)),
                                      //                 suffixIconColor: Colors.black,
                                      //                 suffixIcon: IconButton(
                                      //                   onPressed: () {
                                      //                     value.pPage();
                                      //                   },
                                      //                   icon: Icon(Icons.cancel),
                                      //                 )),
                                      //           ),
                                      //         ),
                                      //       )
                                      //     : TextButton(
                                      //         onPressed: () {
                                      //           value.nPage();
                                      //         },
                                      //         child: Text(
                                      //           "Search Movie or Title",
                                      //           style: TextStyle(
                                      //               color: Colors.black,
                                      //               fontSize: 25),
                                      //         )),
                                      IconButton(
                                        onPressed: () {
                                          value.show();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.search,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                            SizedBox(
                              height: MediaQuery.sizeOf(context).height / 30,
                            ),
                            // Align(
                            //   alignment: Alignment(-0.9, 0),
                            //   child: Text(
                            //     "${title?.type}",
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.w700),
                            //   ),
                            // ),
                            (snapshot.hasData)
                                ? Expanded(
                                    child: GridView.builder(
                                      clipBehavior: Clip.antiAlias,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: data?.search?.length,
                                      itemBuilder: (context, index) {
                                        var sData = data?.search![index];
                                        var dat = sData?.poster;
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPage(
                                                          index: value.index,
                                                          search: sData),
                                                ));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.all(10),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Image.network(
                                                    "${sData?.poster}",
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                    width: 200,
                                                  )),
                                              Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        value.likeMovie(dat);

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                    content:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Like Your Movie Successfully",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    )));
                                                        value.likeIndex(index);
                                                      },
                                                      icon: Icon(
                                                        (index == value.index)
                                                            ? CupertinoIcons
                                                                .heart_fill
                                                            : CupertinoIcons
                                                                .heart,
                                                        color: Colors.red,
                                                      )))
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.purpleAccent,
                                        backgroundColor: Colors.purple),
                                  ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        color: Colors.purpleAccent,
                        backgroundColor: Colors.purple),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
