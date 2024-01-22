// import 'package:assingment_34/basic_layout.dart';
import 'package:assingment_34/submit_form_module.dart';
import 'package:flutter/material.dart';
// import 'package:assingment_34/tabs_modul.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Nav is this'),
        ),
        // body: const TabsModule(),
        body: const FormSubmit(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
