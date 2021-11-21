import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_x/Providers/menu_provider.dart';
import 'package:todo_x/Utils.dart/custom_widgets.dart';
import 'package:todo_x/constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    final CustomWidgets _customWidgets = CustomWidgets();

    MenuStateProvider menuStateProvider =
        Provider.of<MenuStateProvider>(context, listen: false);
    return Stack(
      children: [
        Container(
          color: kPrimaryColor,
          height: _height,
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  width: _width * 0.6,
                  color: kPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              radius: 24.0,
                              backgroundColor: kIconColor.withAlpha(50),
                              child: CircleAvatar(
                                backgroundColor: kPrimaryColor,
                                radius: 23.0,
                                child: IconButton(
                                  color: kIconColor,
                                  onPressed: () => menuStateProvider
                                      .changeMenuState(updatedMenuState: false),
                                  icon: Icon(
                                    Icons.chevron_left_outlined,
                                    color: kIconColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 56.0,
                        backgroundColor: kSecondaryColor,
                        child: CircleAvatar(
                            radius: 52.0, child: Image.asset("assets/ab2.png")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: Text(
                          "Sai kiran katayath",
                          style: TextStyle(
                              fontFamily: "monospace",
                              fontSize: 32.0,
                              color: kTextColor.withOpacity(0.9)),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          customTile(
                              icon: Icons.bookmark_outline, text: "Templates"),
                          customTile(
                              icon: Icons.dashboard_outlined,
                              text: "Dashboard"),
                          customTile(
                              icon: Icons.av_timer_outlined, text: "Analyze"),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: kTextColor,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kSecondaryColor),
                        ),
                        onPressed: () {
                          _customWidgets.addCategorySnacbar(context: context);
                        },
                        label: const Text(
                          "Logout",
                          style: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  customTile({@required IconData? icon, @required String? text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: kSecondaryColorAccent),
          const SizedBox(
            width: 20,
          ),
          Text(
            text.toString(),
            style:
                TextStyle(color: kTextColor.withOpacity(0.7), fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
