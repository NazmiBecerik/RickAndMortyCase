import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vatan_soft_case/core/constants/color_constants.dart';
import 'package:vatan_soft_case/core/constants/font_constants.dart';
import 'package:vatan_soft_case/core/models/character_model.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage(
      {super.key, required this.character, required this.size});

  final Character character;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id ?? 0,
      child: ClipOval(
        child: CachedNetworkImage(
          height: size,
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: ColorConstants.darkBlue,
            ),
          ),
          imageUrl: character.image ?? "",
        ),
      ),
    );
  }
}
class CharacterStatusCircle extends StatelessWidget {
  const CharacterStatusCircle({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.colorStatus(status),
          boxShadow: [
            BoxShadow(
                color: ColorConstants.colorStatus(status),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
    );
  }
}
class SwitchWidget extends StatefulWidget {
  SwitchWidget({super.key, required this.isAlive});
  bool isAlive;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}
class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {

    final MaterialStateProperty<Color?> trackColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.red;
        }
      },
    );
    return Row(
      children: [
        Text("Dead",style: FontConstants.kollektifMainRegular(color:ColorConstants.black),),
        Switch(
          value: widget.isAlive,
          overlayColor: overlayColor,
          trackColor: trackColor,
          thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
          onChanged: (bool value) {
            setState(() {
              widget.isAlive=value;
            });
            if(value==true){
            }
          },
        ),
        Text("Alive",style: FontConstants.kollektifMainRegular(color:ColorConstants.black)),
      ],
    );
  }
}
Widget customDropdown( String labelText , List<String> items , String selectedItem){
  return Row(
    children: [
      Expanded(
          flex: 1,
          child: Text(
            labelText,
            style: FontConstants.kollektifMainRegular(
                color: ColorConstants.black),
          )),
      Expanded(
        flex: 2,
        child: Container(
          height: 50,
          child: DropdownButtonFormField<String>(
            value: selectedItem.isNotEmpty ? selectedItem : null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              selectedItem = newValue!;
            },
          ),
        ),
      ),
    ],
  );
}