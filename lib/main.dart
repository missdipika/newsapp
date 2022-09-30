import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/cubit/cubit/api_data_cubit.dart';
import 'package:newsapi/screens/Newslistscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiDataCubit>(
      create: (context) => ApiDataCubit(),
      child:const  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}

// class FirstScreen extends StatefulWidget {
//   const FirstScreen({Key? key}) : super(key: key);

//   @override
//   State<FirstScreen> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   leading: TextFormField(
//       //       decoration: InputDecoration(
//       //           border: OutlineInputBorder(
//       //             borderRadius: BorderRadius.circular(18),
//       //           ),
//       //           hintText: 'searech news',
//       //           filled: true,
//       //           fillColor: Colors.grey,
//       //           suffixIcon: Icon(Icons.search))),
//       //   leadingWidth: 200,
//       //   actions: [
//       //     Icon(Icons.menu),
//       //   ],
//       //   actionsIconTheme:
//       //       IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
//       // ),
//       body: SafeArea(
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: TextFormField(
//                     decoration: InputDecoration(
//                         // contentPadding: EdgeInsets.all(20),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         hintText: 'search news',
//                         filled: true,
//                         fillColor: Colors.grey,
//                         suffixIcon: Icon(Icons.search))),
//               ),
//               Icon(Icons.menu),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//                 padding: EdgeInsets.all(15),
//                 // shrinkWrap: true,
//                 itemCount: 10,
//                 // physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   {
//                     return Container(
//                       margin: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(18),
//                         color: Color(0xFFD9D2D2),
//                       ),
//                       padding: const EdgeInsets.all(14.0),
//                       child: Row(
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             height: MediaQuery.of(context).size.height * 0.15,
//                             width: MediaQuery.of(context).size.width * 0.28,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.yellow,
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: Column(
//                               // mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "How income tax rule applies on your cryptocurrency gains - Explained",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                                 SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text("15 mins read"),
//                                     Text("day"),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );

//                     // return Container();
//                     // child:
//                     // ListTile(
//                     //   contentPadding: EdgeInsets.zero,
//                     //   minLeadingWidth: ,

//                     //   leading: Container(
//                     //     // alignment: Alignment.center,
//                     //     width: 100,
//                     //     // height: MediaQuery.of(context).size.height * 0.3,
//                     //     // padding: EdgeInsets.all(10),
//                     //     decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(15),
//                     //         color: Colors.red.withOpacity(0.5),
//                     //         image: DecorationImage(
//                     //             image: AssetImage("images/profile.png"),
//                     //             fit: BoxFit.cover)),
//                     //     // child: Image(

//                     //     //   image: AssetImage(
//                     //     //     "images/profile.png",
//                     //     //   ),
//                     //     // ),
//                     //   ),
//                     //   //Text(snapshot.data![index].id.toString()),
//                     //   title: Text(" Title"),
//                     //   subtitle: Text("time"),
//                     // ));
//                   }
//                 }),
//           )
//         ]),
//       ),
//     );
//   }
// }
