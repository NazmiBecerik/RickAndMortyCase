// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vatan_soft_case/app/views/episode/episode_controller.dart';
//
// class EpisodeList extends StatefulWidget {
//   @override
//   _CharacterListState createState() => _CharacterListState();
// }
//
// class _CharacterListState extends State<EpisodeList> {
//   EpisodeController episodeController = Get.find();
//   final scrollController = ScrollController();
//   @override
//   void initState() {
//     scrollController.addListener(() {
//       if(scrollController.position.maxScrollExtent == scrollController.offset){
//         fetchData();
//       }
//     });
//     getFirstData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return buildCharacterList();
//   }
//
//   Widget buildCharacterList(){
//     return RefreshIndicator(
//       onRefresh: () async {
//         await Future.delayed(Duration(seconds: 2)); },
//       child: ListView.builder(
//         controller: scrollController,
//         itemCount:
//         episodeController.episodeList == null ? 0 : episodeController.episodeList.length.obs() + 1,
//         itemBuilder: (BuildContext context, int index) {
//           return index < episodeController.episodeList.length ?
//           Container(
//             height: 150,
//             margin:
//             EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CharacterDetailScreen(
//                       character:characterController.characterList[index],
//                     ),
//                   ),
//                 );
//               },
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     height: 150.0,
//                     margin: EdgeInsets.only(left: 46.0),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF3B3F43),
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(8.0),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10.0,
//                           offset: Offset(0.0, 10.0),
//                         ),
//                       ],
//                     ),
//                     child: Container(
//                       margin:
//                       EdgeInsets.fromLTRB(105.0, 16.0, 16.0, 16.0),
//                       constraints: BoxConstraints.expand(),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             characterController.characterList[index].name ?? "-",
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontFamily: "Product-Sans",
//                               fontSize: 25.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(height: 8.0),
//                           Row(
//                             children: <Widget>[
//                               characterController.characterList[index].status!.toLowerCase() == "alive"
//                                   ? Container(
//                                 height: 12,
//                                 width: 12,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.green,
//                                 ),
//                               )
//                                   : Container(
//                                 height: 12,
//                                 width: 12,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 child: Text(
//                                   "${characterController.characterList[index].status} - ${characterController.characterList[index].species}", style: FontConstants.kollektifMainRegular(color:Colors.grey),overflow: TextOverflow.ellipsis,),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8.0,
//                           ),
//                           Expanded(
//                             child: Text( "Origin : ${characterController.characterList[index].origin!.name}",style: FontConstants.kollektifMainRegular(color:Colors.grey),),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     alignment: FractionalOffset.centerLeft,
//                     child: Hero(
//                       tag: characterController.characterList[index].image ?? "",
//                       child: CircleAvatar(
//                         radius: 60,
//                         backgroundImage: NetworkImage(
//                           characterController.characterList[index].image ?? "",
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ): const Padding(padding: EdgeInsets.symmetric(vertical: 32), child: Center(child: CircularProgressIndicator(),),);
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     characterController.dispose();
//     super.dispose();
//   }
//
//   fetchData() async {
//     try {
//       var result = await NetworkService().getCharacters("${characterController.currentPage.obs}");
//       characterController.increaseCurrentPage();
//       characterController.characterList.addAll(result.data!.results!);
//       setState(() {
//       });
//     }
//     catch (error) {
//
//     }
//   }
//
//   getFirstData() async {
//     var result = await NetworkService().getCharacters("${characterController.currentPage}");
//     characterController.characterList.addAll(result.data?.results ?? []);
//     characterController.info = result.data?.info;
//     characterController.increaseCurrentPage();
//   }
// }