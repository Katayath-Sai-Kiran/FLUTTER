import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/constants.dart';

class CustomWidgets {
  ScaffoldFeatureController addCategorySnacbar(
      {required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kBackgroundColor,
        behavior: SnackBarBehavior.floating,
        content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Are You Sure To Logout  !"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.back(closeOverlays: true);
                    },
                    child: const Text("Cancle"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: kTextColor),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kSecondaryColor)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
