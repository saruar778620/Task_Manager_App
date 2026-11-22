import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/in_progress_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class MainBottomNeavScreen extends StatefulWidget {
  const MainBottomNeavScreen({super.key});

  @override
  State<MainBottomNeavScreen> createState() => _MainBottomNeavScreenState();
}

class _MainBottomNeavScreenState extends State<MainBottomNeavScreen> {
  int _selectIndex = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressScreen(),
    CancelledTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (index){
          _selectIndex = index;
          if(mounted){
            setState(() {});
          }
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: "New Task"),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.clear),label: "Cancelled")
      ],),
    );
  }
}
