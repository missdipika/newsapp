import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/Api/apicall.dart';
import 'package:newsapi/cubit/cubit/api_data_cubit.dart';
import 'package:newsapi/model/response%20model.dart';
import 'package:newsapi/screens/my_card_widget.dart';

import 'detailsScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstScreen> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _textController = TextEditingController();
  late ResponseModel responseData;
  bool isLoading = true;
  bool isMoreLoading = false;
  bool isNoMoreData = false;
  final String newsName = "apple";
  int pages = 50;

  List<Articles> articles = [];
  List<Articles> searchArticles = [];
  Timer? _debounce;
  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 10), () {
      ApiProvider.getAllData(pages, query).then((value) {
        print("IM done running");
        setState(() {
          pages = value.page!;
          responseData = value;
          articles.addAll(value.articles!);
        });
      });
      // do something with query
      log("checking");
    });
  }

  @override
  void initState() {
    BlocProvider.of<ApiDataCubit>(context).getdata(pages, newsName);
    // ApiProvider.getAllData(pages, newsName).then((value) {
    //   setState(() {
    //     pages = value.page!;
    //     responseData = value;
    //     articles.addAll(value.articles!);
    //   });
    // }).whenComplete(() {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
    // super.initState();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels >=
    //       _scrollController.position.maxScrollExtent) {
    //     pages++;
    //     if (responseData.totalPages! >= pages) {
    //       print("new data $pages");
    //       // setState(() {
    //       //   isMoreLoading = true;
    //       // });
    //       // setState(() {
    //       ApiProvider.getAllData(pages, newsName).then((value) {
    //         setState(() {
    //           pages = value.page!;
    //           responseData = value;

    //           articles.addAll(value.articles!);
    //         });
    //       }).whenComplete(() {
    //         setState(() {
    //           isMoreLoading = false;
    //           isLoading = false;
    //         });
    //       });
    //     } else {
    //       setState(() {
    //         isNoMoreData = true;
    //       });
    //     }
    //     // });
    //   }
    // }
    // );
  }

  void dispose() {
    super.dispose();
    _debounce!.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _textController,
                        cursorColor: Colors.black,
                        onChanged: (String value) {
                         BlocProvider.of<ApiDataCubit>(context).getdata(pages, _textController.text);
                        },
                        // onChanged: (val) {
                        //         }
                        //   Future.delayed(Duration(seconds: 3), () {
                        //     log("IM done running");
                        //   });

                        // },
                        decoration: InputDecoration(
                            // contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'search news',
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                BlocProvider.of<ApiDataCubit>(context).getdata(pages, _textController.text);
                              },
                            ))),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                  ),
                  Text(articles.length.toString()),
                ],
              ),
            ),
            BlocBuilder<ApiDataCubit, ApiDataState>(builder: (context, state) {
              if (state is ApiDataLoading) {
                return CircularProgressIndicator();
              }
              else if(state is ApiDataLoaded){
                return Expanded(
                  child: ListView.builder(
                 
                              controller: _scrollController,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              // shrinkWrap: true,
                              itemCount: state.responseModel.articles!.length,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                
                                // var articleData = articles[index];
                
                                // print(articles[index].media.toString());
                                // if (articles.length == index + 1) {
                                //   print("at the end");
                                //   if (isMoreLoading) {
                                //     return Center(
                                //         child: CircularProgressIndicator());
                                //   }
                                //   if (isNoMoreData) {
                                //     return Center(
                                //         child: Text("No More Data to Show"));
                                //   }
                                // }
                                return MyCardWidget(articleData: state.responseModel.articles![index]);
                              },
                            ),
                );
              }
               else {
                return Container();
              }
            })
            // isLoading
            //     ? Center(child: CircularProgressIndicator())
            //     : Expanded(
            //         child: searchArticles.isEmpty
            //             ? ListView.builder(
            //                 controller: _scrollController,
            //                 keyboardDismissBehavior:
            //                     ScrollViewKeyboardDismissBehavior.onDrag,
            //                 padding: EdgeInsets.symmetric(horizontal: 16),
            //                 // shrinkWrap: true,
            //                 itemCount: articles.length,
            //                 // physics: NeverScrollableScrollPhysics(),
            //                 itemBuilder: (context, index) {
            //                   var articleData = articles[index];

            //                   // print(articles[index].media.toString());
            //                   if (articles.length == index + 1) {
            //                     print("at the end");
            //                     if (isMoreLoading) {
            //                       return Center(
            //                           child: CircularProgressIndicator());
            //                     }
            //                     if (isNoMoreData) {
            //                       return Center(
            //                           child: Text("No More Data to Show"));
            //                     }
            //                   }
            //                   return MyCardWidget(articleData: articleData);
            //                 },
            //               )
            //             : ListView.builder(
            //                 controller: _scrollController,
            //                 keyboardDismissBehavior:
            //                     ScrollViewKeyboardDismissBehavior.onDrag,
            //                 padding: EdgeInsets.symmetric(horizontal: 16),
            //                 itemCount: searchArticles.length,
            //                 itemBuilder: (context, index) {
            //                   var articleData = searchArticles[index];

            //                   return MyCardWidget(articleData: articleData);
            //                 },
            //               ),
            //       ),
            // if (isNoMoreData)
            //   const Padding(
            //     padding: EdgeInsets.all(30.0),
            //     child: Text("No More Data to Show"),
            //   ),
          ],
        ),
      ),
    );
  }
}
