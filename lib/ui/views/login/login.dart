import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 38),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontFamily: FontNames.workSans,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 48),
                  Container(
                    height: 210,
                    width: 270,
                    child: Image(
                      image: AssetImage('assets/images/loginBanner.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 62),
                  TextField(
                    controller: model.emailController,
                    style: TextStyle(
                      fontFamily: FontNames.workSans,
                    ),
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIconConstraints: BoxConstraints(minWidth: 0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.email_outlined,
                          color: Color(0xff1F59B6),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1F59B6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: model.passwordController,
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: FontNames.workSans,
                    ),
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIconConstraints: BoxConstraints(minWidth: 0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xff1F59B6),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1F59B6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Color(0xff1F59B6),
                          fontSize: 14,
                          fontFamily: FontNames.workSans),
                    ),
                  ),
                  SizedBox(height: 19),
                  TextButton(
                    onPressed: () {
                      if (!model.isBusy)
                        model.loginNow(
                          email: model.emailController.text,
                          password: model.passwordController.text,
                        );
                    },
                    child: model.isBusy
                        ? Container(
                            height: 21,
                            width: 21,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2),
                          )
                        : Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 16, fontFamily: FontNames.workSans),
                          ),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(180, 40),
                        backgroundColor: Color(0xff1F59B6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Or via Social Media',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(!model.isBusy)model.loginWithGoogle();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/gmail.svg',
                          height: 32,
                          width: 32,
                        ),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/icons/twitter.svg',
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                  SizedBox(height: 41),
                  Text(
                    'Don’t have an account? Register now',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 27),
                  Text(
                      'By signing up, you are agree with our Terms & Conditions',
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
