import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/home/views/home_view.dart';
import 'package:employee_system2/app/modules/inbox/views/inbox_view.dart';
import 'package:employee_system2/app/modules/pengajuan/views/pengajuan_view.dart';
import 'package:employee_system2/app/modules/profile/views/profile_view.dart';
import 'package:employee_system2/app/modules/task/views/task_view.dart';
import 'package:employee_system2/app/navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navController.tabIndex,
        children: [
          HomeView(),
          TaskView(),
          PengajuanView(),
          InboxView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        padding: EdgeInsets.all(2.0.h),
        selectedItemColor: mainColor,
        unselectedItemColor: blackColor,
        snakeViewColor: mainColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: navController.tabIndex,
        onTap: (index) {
          setState(() {
            navController.tabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Pengajuan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_to_inbox),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
