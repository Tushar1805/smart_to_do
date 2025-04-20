import 'package:core/theme/app_colors.dart';
import 'package:core/utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final _txtWord = TextEditingController();

Widget inputCard(final Size size) => Container(
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
                disabledBorder: InputBorder.none,
              ),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

final heroCard = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16.0),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(.12),
      offset: const Offset(0, 27),
      blurRadius: 27,
      spreadRadius: .5,
    ),
  ],
);

class CustomGenericButton extends StatelessWidget {
  const CustomGenericButton({
    required this.title,
    required this.onTap,
    required this.minWidth,
    required this.height,
    this.loader,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final double? minWidth;
  final double? height;
  final bool? loader;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: MaterialButton(
          highlightElevation: 10,
          highlightColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : colorScheme.onPrimaryFixedVariant,
          minWidth: minWidth,
          color: colorScheme.onPrimaryFixedVariant,
          onPressed: onTap.call,
          height: height,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: (loader ?? false)
              ? LoadingWithoutText()
              : Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                ),
        ),
      );
}

Widget navButton({
  required final String iconPath,
  required final bool isSelected,
  required final VoidCallback onTap,
}) =>
    IconButton(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? primaryFixedDim : Colors.white,
          BlendMode.srcIn,
        ),
        height: 30,
      ),
      onPressed: onTap,
    );
