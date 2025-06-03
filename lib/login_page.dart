import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';

import 'extentions/app_text_field.dart';

class PhoneInputWithCountryPicker extends StatefulWidget {
  const PhoneInputWithCountryPicker({super.key});

  @override
  State<PhoneInputWithCountryPicker> createState() =>
      _PhoneInputWithCountryPickerState();
}

class _PhoneInputWithCountryPickerState
    extends State<PhoneInputWithCountryPicker> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    countryCode: 'SA',
    phoneCode: '966',
    name: 'Saudi Arabia',
    e164Sc: 0,
    geographic: true,
    level: 1,
    example: '512345678',
    displayName: 'Saudi Arabia',
    displayNameNoCountryCode: 'Saudi Arabia',
    e164Key: '',
  );

  int get maxPhoneLength {
    switch (selectedCountry.countryCode) {
      case 'SA':
        return 9;
      case 'EG':
        return 10;
      case 'AE':
        return 9;
      default:
        return 12;
    }
  }

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (country) {
        setState(() {
          selectedCountry = country;
          phoneController.clear();
        });
      },
    );
  }

  bool get isValid => phoneController.text.length == maxPhoneLength;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  "أدخل رقم الجوال",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Phone Input with flag and code
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _selectCountry,
                        child: Row(
                          children: [
                            Text(selectedCountry.flagEmoji), // Optional: flag from emoji or asset
                            const SizedBox(width: 6),
                            Text("+${selectedCountry.phoneCode}",
                                style: TextStyle(fontSize: 16)),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppTextField(
                          controller: phoneController,
                          fieldLabel: '',
                          textInputType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(maxPhoneLength),
                          ],
                          onChange: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Terms
                Text.rich(
                  TextSpan(
                    text: 'بالضغط على “التالي” أنت توافق على ',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'الشروط والأحكام و سياسة الخصوصية',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                // Next Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isValid ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isValid ? Colors.deepPurple : Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text("التالي", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
