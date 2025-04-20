import 'package:core/theme/app_colors.dart';
import 'package:core/utils/log_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smart_to_do_app/resources/app_image.dart';
import 'package:smart_to_do_app/resources/app_strings.dart';
import 'package:smart_to_do_app/resources/app_widgets.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(final context) {
    final size = MediaQuery.of(context).size;
    final _focusNode = useState<FocusNode>(FocusNode());
    final numberInputFormatters = [
      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
    ];
    final phoneNumberController = useTextEditingController(text: '');
    final countryCode = useState<String>('91');
    const initialCountryCode = 'IN';
    final _country = useState<Country>(
      countries.firstWhere((final element) => element.code == initialCountryCode),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image.asset(
              appLogoNoBg,
              color: colorScheme.primary,
              width: size.width * 0.5,
            ),
            Expanded(
              child: ClipPath(
                clipper: WaveClipperTwo(
                  reverse: true,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: colorScheme.primaryFixedDim,
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.25, left: 20, right: 20),
                        child: IntlPhoneField(
                          // disableLengthCheck: false,
                          focusNode: _focusNode.value,
                          inputFormatters: numberInputFormatters,
                          initialCountryCode: initialCountryCode,
                          showCountryFlag: false,
                          controller: phoneNumberController,
                          dropdownIconPosition: IconPosition.trailing,
                          dropdownIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          invalidNumberMessage: '',
                          flagsButtonPadding: EdgeInsets.only(left: 5),
                          pickerDialogStyle: PickerDialogStyle(
                            width: size.width,
                            countryNameStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 14,
                                ),
                            countryCodeStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 14,
                                ),
                            searchFieldPadding: EdgeInsets.only(left: 10, right: 10),
                            searchFieldInputDecoration: InputDecoration(
                              hintText: 'Search for your country here..',
                              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w100,
                                  ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorScheme.onPrimaryFixedVariant,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 0,
                                  color: Colors.transparent,
                                ),
                            counterStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 0,
                                  color: Colors.grey,
                                ),
                            hintText: samplePhoneNumberString,
                            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 30,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w100,
                                ),
                          ),
                          dropdownTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                          onCountryChanged: (final country) {
                            countryCode.value = country.dialCode;
                            _country.value = country;
                            logGreenText(
                              'Country changed to: ${country.dialCode} \nCountry Code min length: ${country.minLength} \nCountry code max length ${country.maxLength}',
                            );
                          },
                          onChanged: (final phoneNumber) {
                            if (phoneNumber.number.length == _country.value.maxLength) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                          onTap: () {
                            FocusScope.of(context).requestFocus(_focusNode.value);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomGenericButton(
                            title: 'Verify',
                            minWidth: size.width * 0.6,
                            height: 60,
                            onTap: () {
                              // if (phoneNumberController.text.length >= _country.value.minLength &&
                              //     phoneNumberController.text.length <= _country.value.maxLength) {
                              //   authCubit.login(
                              //     phoneNumberController.text,
                              //     '+${countryCode.value}',
                              //   );
                              // } else {
                              //   if (FocusManager.instance.primaryFocus!.hasFocus) {
                              //     FocusManager.instance.primaryFocus?.unfocus();
                              //   }
                              //   Future.delayed(Duration(milliseconds: 600)).then(
                              //     (final value) => showToast(
                              //       context: context,
                              //       fToast: fToast!,
                              //       msg: phoneNumberController.text.length == 0
                              //           ? emptyPhoneString
                              //           : invalidPhoneString,
                              //       duration: 3,
                              //     ),
                              //   );
                              // }
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      child: Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Create one',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: colorScheme.onPrimaryFixedVariant),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
