import 'package:flutter/material.dart';

class LoginAuthPage extends StatefulWidget {
  const LoginAuthPage({super.key});

  @override
  State<LoginAuthPage> createState() => _LoginAuthPageState();
}

class _LoginAuthPageState extends State<LoginAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:      Center(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.arrow_back, size: 28),
            ),
            Text("نفاذ",textAlign: TextAlign.center,style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold,fontSize: 26, ),),
            SizedBox(height: 10,),
            Text("التحقق من التسجيل",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("الرجاء فتح تطبيق نفاذ واختيار الرقم أدناه لإكمال التسجيل",textAlign: TextAlign.center),
            SizedBox(height: 20,),
            Container(width: 70,height: 70 ,decoration: BoxDecoration( color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Center(child: Text("77", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),)


          ],
        ),
      )

    );
  }
}
