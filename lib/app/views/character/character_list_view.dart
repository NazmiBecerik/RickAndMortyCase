import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vatan_soft_case/app/views/character/character_detail_view.dart';
import 'package:vatan_soft_case/app/views/character/character_controller.dart';
import 'package:vatan_soft_case/app/views/character/character_widgets.dart';
import 'package:vatan_soft_case/core/constants/color_constants.dart';
import 'package:vatan_soft_case/core/constants/font_constants.dart';
import 'package:vatan_soft_case/core/services/network_service.dart';
import 'package:vatan_soft_case/core/utils/lang/translation_keys.dart' as translation;

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  CharacterController characterController = Get.find();
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetchData();
      }
    });
    getFirstData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.portalColor,
        body: Column(
          children: [
            buildFilter(),
            buildCharacterList(),
          ],
        ));
  }

  Widget buildFilter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        style: FontConstants.kollektifMainRegular(color: ColorConstants.grey),
        onChanged: (value) {
          print(value);
          characterController.filterName = value;
          if (value == "") {
            characterController.characterList.clear();
            getFirstData();
          }
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              Icons.filter_alt_rounded,
              size: 25,
              color: ColorConstants.grey,
            ),
            onPressed: () {
              buildFilterDialog();
            },
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
              color: ColorConstants.grey,
            ),
            onPressed: () async {
              setFilter();
            },
          ),
          fillColor: ColorConstants.portalColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.deadColor),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    scrollController.dispose();
    characterController.dispose();
    super.dispose();
  }

  Future<dynamic> buildFilterDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(translation.filterSettings.tr),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        translation.species.tr,
                        style: FontConstants.kollektifMainRegular(
                            color: ColorConstants.black),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: TextField(
                        style: FontConstants.kollektifMainRegular(
                            color: ColorConstants.black),
                        onChanged: (value) {
                          characterController.filterSpecies = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstants.deadColor),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        translation.type.tr,
                        style: FontConstants.kollektifMainRegular(
                            color: ColorConstants.black),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: TextField(
                        style: FontConstants.kollektifMainRegular(
                            color: ColorConstants.black),
                        onChanged: (value) {
                          characterController.filterType = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstants.deadColor),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              customDropdown(translation.gender.tr,characterController.genderList,characterController.filterGender),
              SizedBox(
                height: 8,
              ),
              customDropdown(translation.status.tr,characterController.statusList,characterController.filterStatus),
              Row(
                children: [
                  Expanded(
                    child: SwitchWidget(
                        isAlive: characterController.isAlive),
                  )
                ],
              ),

            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.red,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(translation.cancel.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.green,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child:Text(translation.ok.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildCharacterList() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
        },
        child: ListView.builder(
          controller: scrollController,
          itemCount: characterController.characterList == null
              ? 0
              : characterController.characterList.length.obs() + 1,
          itemBuilder: (BuildContext context, int index) {
            return index < characterController.characterList.length
                ? Container(
              height: 150,
              margin:
              EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterDetailScreen(
                        character:
                        characterController.characterList[index],
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      margin: EdgeInsets.only(left: 46.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Container(
                        margin:
                        EdgeInsets.fromLTRB(105.0, 16.0, 16.0, 16.0),
                        constraints: BoxConstraints.expand(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                characterController
                                    .characterList[index].name ??
                                    "-",
                                overflow: TextOverflow.ellipsis,
                                style: FontConstants.kollektifMainBold(
                                    color: ColorConstants.white)),
                            Row(
                              children: <Widget>[
                                characterController
                                    .characterList[index].status!
                                    .toLowerCase() ==
                                    "alive"
                                    ? Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                )
                                    : Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "${characterController.characterList[index].status} - ${characterController.characterList[index].species}",
                                    style: FontConstants
                                        .kollektifMainRegular(
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                "Origin : ${characterController.characterList[index].origin!.name}",
                                style: FontConstants.kollektifMainRegular(
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: FractionalOffset.centerLeft,
                      child: Hero(
                        tag: characterController
                            .characterList[index].image ??
                            "",
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            characterController
                                .characterList[index].image ??
                                "",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
                : const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  fetchData() async {
    try {
      if (characterController.filterQuery.contains("page")) {
        int index = characterController.filterQuery.indexOf("page=");
        String oncekiKisim = characterController.filterQuery
            .substring(0, index + "page=".length);
        String sonrakiKisim = characterController.filterQuery
            .substring(index + "page=".length + 1);
        characterController.filterQuery = oncekiKisim +
            characterController.currentPage.toString() +
            sonrakiKisim;
      } else {
        if (characterController.filterQuery.length > 0)
          characterController.filterQuery +=
          "&page=${characterController.currentPage}";
        else
          characterController.filterQuery +=
          "?page=${characterController.currentPage}";
      }
      if (characterController.info!.next != "") {
        var result = await NetworkService()
            .getCharacters(characterController.filterQuery);
        characterController.increaseCurrentPage();
        characterController.characterList.addAll(result.data!.results!);
        characterController.info = result.data!.info;
      }

      setState(() {});
    } catch (error) {}
  }

  getFirstData() async {
    characterController.filterQuery = "";
    var result =
    await NetworkService().getCharacters(characterController.filterQuery);
    characterController.characterList.addAll(result.data?.results ?? []);
    characterController.info = result.data?.info;
    characterController.increaseCurrentPage();
    setState(() {});
  }

  setFilter() async {
    if (characterController.filterName.length > 0)
      characterController.filterQuery +=
      "?name=${characterController.filterName}";

    if (characterController.filterGender.length > 0)
      characterController.filterQuery +=
      characterController.filterQuery.contains("name")
          ? "&gender=${characterController.filterGender}"
          : "?gender=${characterController.filterGender}";

    if (characterController.filterSpecies.length > 0) if (characterController
        .filterQuery
        .contains("name") ||
        characterController.filterQuery.contains("gender"))
      characterController.filterQuery +=
      "&species=${characterController.filterSpecies}";
    else
      characterController.filterQuery +=
      "?species=${characterController.filterSpecies}";

    if (characterController.filterStatus.length > 0) if (characterController
        .filterQuery
        .contains("name") ||
        characterController.filterQuery.contains("gender") ||
        characterController.filterQuery.contains("species"))
      characterController.filterQuery +=
      "&status=${characterController.filterStatus}";
    else
      characterController.filterQuery +=
      "?status=${characterController.filterStatus}";

    if (characterController.filterType.length > 0) if (characterController
        .filterQuery
        .contains("name") ||
        characterController.filterQuery.contains("gender") ||
        characterController.filterQuery.contains("species") ||
        characterController.filterQuery.contains("status"))
      characterController.filterQuery +=
      "&type=${characterController.filterType}";
    else
      characterController.filterQuery +=
      "?type=${characterController.filterType}";

    var result =
    await NetworkService().getCharacters(characterController.filterQuery);
    characterController.characterList.clear();
    characterController.characterList = result.data?.results ?? [];
    setState(() {});
  }

}
