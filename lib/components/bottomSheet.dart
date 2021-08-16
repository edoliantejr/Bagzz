import 'package:bagzz/constant/constant.dart';
import 'package:flutter/material.dart';

//show modal bottom sheet
showBottomSheets(BuildContext context, Widget itemslistView(), String btnText) {
  double topPadding = MediaQuery.of(context).padding.top;
  return showModalBottomSheet(
    backgroundColor: colorWhite.withOpacity(0.9),
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    ),
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Wrap(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - (topPadding + 48),
              padding: EdgeInsets.only(top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                      child:
                          Container(height: 2, width: 125, color: colorBlack)),
                  SizedBox(height: 45),
                  Expanded(
                    flex: 8,
                    child: itemslistView(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15),
                      child: Container(
                          height: 43,
                          width: 193,
                          color: colorBlack,
                          child: TextButton(
                            onPressed: () {
                              if (btnText == proceedToBuy) {
                              } else {}
                            },
                            child: Center(
                              child: Text(
                                '$btnText',
                                style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 16,
                                    fontFamily: workSans),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
