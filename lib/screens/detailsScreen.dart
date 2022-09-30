import 'package:flutter/material.dart';
import 'package:newsapi/constants/container.dart';
import 'package:newsapi/model/response%20model.dart';

class DetailsScreen extends StatefulWidget {
  final Articles articles;
  DetailsScreen({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage("${widget.articles.media}"),
          fit: BoxFit.cover,
        )),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color.fromARGB(255, 0, 0, 0)]),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Container(
                  height: 38,
                  width: 38,
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);  
                    }),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 350,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Common(text: "Trendy"),
                    SizedBox(
                      width: 10,
                    ),
                    Common(text: "Crypto"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${widget.articles.title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.pink),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EconomicTimes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${widget.articles.publishedDate.toString().substring(10, 19)}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.bookmark,
                          ),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  width: double.infinity,
                  color: Colors.white,
                ),
                Text(
                  "${widget.articles.summary}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
