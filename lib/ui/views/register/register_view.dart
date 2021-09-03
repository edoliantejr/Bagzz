import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/register/register_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
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
                      'Register Now!',
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
                        hintText: 'Retry Password',
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
                        'REGISTER',
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
                    SizedBox(height: 41),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: Colors.blue),
                              )),
                          child: InkWell(
                            highlightColor: Colors.white60,
                            onTap: model.logout,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: FontNames.workSans,
                                  fontSize: 12),
                            ),
                          ),
                        )
                      ],
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
