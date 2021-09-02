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
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              primary: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 38),
                    Text(
                      'Welcome Back!',
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
                      onChanged: (value) => model.checkEmail(),
                      focusNode: model.emailFocusNode,
                      style: TextStyle(
                        fontFamily: FontNames.workSans,
                      ),
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIconConstraints: BoxConstraints(minWidth: 0),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.email_outlined,
                            color: Color(0xff1F59B6),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: model.isEmailValid
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1F59B6)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: model.passwordController,
                      onChanged: (value) => model.checkPass(),
                      focusNode: model.passFocusNode,
                      obscureText: model.isObscure,
                      style: TextStyle(
                        fontFamily: FontNames.workSans,
                      ),
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIconConstraints: BoxConstraints(minWidth: 0),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: Color(0xff1F59B6),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1F59B6)),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              model.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: model.isPasswordEmpty
                                  ? Colors.transparent
                                  : Colors.blueAccent,
                            ),
                            onPressed: model.showPassword),
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 66,
                            vertical: 10,
                          ),
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
                          onTap: () {
                            if (!model.isBusy) model.loginWithGoogle();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(fontSize: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1, color: Colors.blue),
                          )),
                          child: InkWell(
                            highlightColor: Colors.white60,
                            onTap: () {},
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: FontNames.workSans,
                                  fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 27),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By signing up, you are agree with our ',
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(width: 1, color: Colors.blue),
                            )),
                            child: InkWell(
                              highlightColor: Colors.white60,
                              onTap: () {},
                              child: Text(
                                'Terms & Condition',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: FontNames.workSans,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
