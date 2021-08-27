import 'package:bagzz/ui/views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Color(0x9F93FFC9),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: Column(
               mainAxisSize: MainAxisSize.min,

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      height: 200,
                      width: 200,
                      child: Image(
                          image: AssetImage('assets/images/bag05.png'),
                          fit: BoxFit.cover),
                    ),
                  Text('Welcome to',style: TextStyle(),)

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
