import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatan_soft_case/app/views/character/character_widgets.dart';
import 'package:vatan_soft_case/core/constants/color_constants.dart';
import 'package:vatan_soft_case/core/constants/font_constants.dart';
import 'package:vatan_soft_case/core/models/character_model.dart';
import 'package:vatan_soft_case/core/utils/lang/translation_keys.dart' as translation;


class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.portalColor,
          leading: const BackButton(
            color:ColorConstants.grey,
          ),
        ),
        backgroundColor: Color(0xFF202428),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double maxHeight = constraints.maxHeight;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CharacterImage(
                    character: character,
                    size: maxHeight * 0.3,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    character.name ?? "".toUpperCase(),
                    style: FontConstants.kollektifHeadline2(color : ColorConstants.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CharacterStatusCircle(status: character.status ?? translation.dead.tr),
                      const SizedBox(width: 8),
                      Text(
                        '${character.status} - ${character.species}',
                        style: FontConstants.kollektifMainRegular(color:ColorConstants.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: maxHeight * 0.5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InformationRow(
                            label: translation.gender.tr,
                            value: character.gender ?? "",
                          ),
                          InformationRow(
                            label: translation.origin.tr,
                            value: character.origin?.name ?? "",
                          ),
                          InformationRow(
                            label: translation.lastKnownLocation.tr,
                            value: character.location?.name ?? "",
                          ),
                          InformationRow(
                            label: translation.numberOfEpisodes.tr,
                            value: character.episode?.length.toString() ?? "",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class InformationRow extends StatelessWidget {
  const InformationRow({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: FontConstants.kollektifMainRegular(color:ColorConstants.grey),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: FontConstants.kollektifMainRegular(color:ColorConstants.grey),
          ),
        ),
      ],
    );
  }
}