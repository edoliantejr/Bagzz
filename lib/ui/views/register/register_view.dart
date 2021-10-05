import 'dart:io';

import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/register/register_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
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
                    SizedBox(height: 50),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: model.selectedImage != null
                                        ? Colors.grey
                                        : Colors.transparent,
                                  ),
                                ),
                                child: model.selectedImage != null
                                    ? Image.file(
                                  File(model.selectedImage!.path),
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                )
                                    : Container(),
                              ),
                              model.selectedImage != null
                                  ? Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: model.clearImageSelection,
                                  child: Container(
                                    color: Colors.grey,
                                    height: 18,
                                    width: 18,
                                    child: Icon(
                                      Icons.close_outlined,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              )
                                  : Container(),
                          SizedBox(width: model.selectedImage != null ? 10 : 0),
                          DottedBorder(
                            strokeWidth: 1,
                            color: Colors.blue,
                            dashPattern: [3],
                            child: Container(
                              width: 95,
                              height: 90,
                              child: TextButton(
                                onPressed: model.selectImage,
                                child: FittedBox(
                                  child: Text(
                                    model.selectedImage == null
                                        ? '+ Add photo'
                                        : 'Change Photo',
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20),
                    TextField(
                      controller: model.name,
                      focusNode: model.nameFocus,
                      style: TextStyle(
                        fontFamily: FontNames.workSans,
                      ),
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIconConstraints: BoxConstraints(minWidth: 0),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.people_outlined,
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
                      controller: model.email,
                      focusNode: model.emailFocus,
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1F59B6)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: model.password,
                      onChanged: (value) => model.checkPass(),
                      focusNode: model.passFocus,
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
                    TextButton(
                      onPressed:
                          model.registerNow,
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
                            onTap: model.navigationService.pop,
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
