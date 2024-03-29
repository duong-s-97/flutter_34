import 'package:assingment_34/enity/students_entity.dart';
import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  StudentDetail({super.key});
  static const String routeName = "/StudentdetailPage";
  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)?.settings.arguments as Student?;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${student?.name}"),
                          Text("${student?.email}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Back to first page",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
