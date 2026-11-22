import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Card(
                child: Column(
                  children: [
                    Text("12"),
                    Text('New Task')
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
