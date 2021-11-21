import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_x/Providers/menu_provider.dart';
import 'package:todo_x/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = Get.width;
    final double _height = Get.height;
    return Consumer<MenuStateProvider>(
      builder: (_, menuStateProvider, child) => AnimatedPositioned(
        left: menuStateProvider.menuState ? 250 : 0.0,
        top: 0.0,
        child: InkWell(
          onTap: () =>
              menuStateProvider.changeMenuState(updatedMenuState: false),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            filterQuality: FilterQuality.high,
            scale: menuStateProvider.menuState ? 0.9 : 1,
            child: Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(
                      menuStateProvider.menuState ? 16.0 : 0.0)),
              height: _height,
              width: _width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "What's up, Katayath!",
                            style: TextStyle(
                                fontSize: 32.0,
                                color: kTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: _height * 0.03),
                          Text(
                            "CATEGORIES",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: kTextColor.withOpacity(0.7)),
                          ),
                          const SizedBox(height: 10),
                          CategoriesList(),
                          const SizedBox(height: 10.0),
                          Text(
                            "TODAY'S TASKS",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: kTextColor.withOpacity(0.7)),
                          ),
                          const SizedBox(height: 10.0),
                          TodayTasksList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuStateProvider menuStateProvider =
        Provider.of<MenuStateProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            menuStateProvider.changeMenuState(
                updatedMenuState: !menuStateProvider.menuState);
          },
          icon: const Icon(Icons.menu, color: kTextColor),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined,
                  color: kTextColor.withOpacity(0.7)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined,
                    color: kTextColor.withOpacity(0.7)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = Get.width;
    final double _height = Get.height;
    return SizedBox(
      height: _height * 0.18,
      width: _width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              color: kPrimaryColor,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween<double>(begin: 32.0, end: 16.0),
                  builder: (_, double value, __) {
                    return Container(
                      padding: EdgeInsets.all(value),
                      height: _height * 0.18,
                      width: _width * 0.53,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${taskCounts[index]} tasks",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: kTextColor.withOpacity(0.5)),
                          ),
                          Text(
                            categories[index],
                            style: const TextStyle(
                                fontSize: 24.0, color: kTextColor),
                          ),
                          Container(
                            width: _width * 0.48,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: index % 2 == 0
                                  ? kSecondaryColor
                                  : kPrimaryColorAccent,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }

  final List categories = [
    "Work",
    "Bussiness",
    "Education",
    "Travel",
    "Course",
  ];
  final List taskCounts = ["4", "12", "2", "23", "8"];
}

class TodayTasksList extends StatelessWidget {
  TodayTasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = Get.width;
    final double _height = Get.height;
    return SizedBox(
      height: _height * 0.5,
      width: _width,
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) {
            return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 500),
                tween: Tween<double>(begin: 20, end: 10),
                builder: (_, double value, __) {
                  return Card(
                    margin: EdgeInsets.only(bottom: value),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                    elevation: 8.0,
                    child: ListTile(
                      title: Text(
                        tasks[index],
                        style: TextStyle(color: kTextColor.withOpacity(0.8)),
                      ),
                      leading: Icon(
                        Icons.circle_outlined,
                        color: index % 3 == 0 || index == 1
                            ? kPrimaryColorAccent
                            : kSecondaryColor,
                      ),
                    ),
                  );
                });
          }),
    );
  }

  final List tasks = [
    "Design Converter UI",
    "Learn Express",
    "Learn Node",
    "Postman Basics",
    "Compleate X App",
    "Design Converter UI",
    "Learn Express",
    "Learn Node",
    "Postman Basics",
    "Compleate X App",
    "Design Converter UI",
    "Learn Express",
    "Learn Node",
    "Postman Basics",
    "Compleate X App",
  ];
}
