import 'package:flutter/material.dart';

final _txtWord = TextEditingController();

Widget inputCard(Size size) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    alignment: Alignment.bottomCenter,
    width: size.width * .86,
    height: size.height * .25,
    decoration: heroCard,
    child: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
            controller: _txtWord,
            maxLines: 6,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(
            width: size.width,
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.copy_outlined,
                  color: Colors.grey,
                  size: 22.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.record_voice_over_outlined,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

final heroCard = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16.0),
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(.12),
        offset: const Offset(0, 27),
        blurRadius: 27,
        spreadRadius: .5)
  ],
);
