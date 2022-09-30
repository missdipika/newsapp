import 'package:flutter/material.dart';
import 'package:newsapi/model/response%20model.dart';
import 'package:newsapi/screens/detailsScreen.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({Key? key, required this.articleData}) : super(key: key);
  final Articles articleData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    articles: articleData,
                  )),
        );
      }),
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.black.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(14.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                    articleData.media.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    articleData.title!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(articleData.publishedDate
                          .toString()
                          .substring(0, 10)),
                      Text(articleData.publishedDate
                          .toString()
                          .substring(10, 19)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}