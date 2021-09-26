import 'package:bagzz/ui/views/pre_loader_screen/pre_loader_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreLoaderScreen extends StatelessWidget {
  const PreLoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreLoaderScreenViewModel>.reactive(
      viewModelBuilder: () => PreLoaderScreenViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///widget here
                Container(
                  child: Image(
                    image: AssetImage('assets/images/loginBanner.png'),
                  ),
                ),
                SizedBox(height: 10),
                CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
  }
}
