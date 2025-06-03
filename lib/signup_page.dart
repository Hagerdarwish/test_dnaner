import 'package:dnaner_test/login_auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'extentions/app_text_field.dart';
import 'extentions/password_field_validation.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.arrow_back, size: 28),
                ),
                const SizedBox(height: 40),
                Text(

                  'سجل و ابدأ الإستثمار مع دنانير',
                  style: TextStyle(
                    fontSize: 25,

                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 40),

                // رقم الهوية
                AppTextField(
                  controller: idController,
                  fieldLabel: 'رقم الهوية',
                  prefixSvgPath: 'images/idicon.svg',

                ),
                const SizedBox(height: 16),

                // كلمة المرور
                PasswordFieldWithValidation(controller: passwordController),

                const SizedBox(height: 16),
                // تأكيد كلمة المرور
                AppTextField(
                  controller: confirmPasswordController,
                  fieldLabel: 'تأكيد كلمة المرور',
                  obscureText: true,
                  prefixSvgPath: 'images/Password.svg',
                ),

                const Spacer(),

                // زر إنشاء حساب
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginAuthPage()),
                      );

                    }, // disabled by default
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
}}
