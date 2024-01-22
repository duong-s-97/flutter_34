import 'package:assingment_34/student_detail.dart';
import 'package:assingment_34/submit_form_module.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  FormSubmit.routeName: (context) => const FormSubmit(),
  StudentDetail.routeName: (context) => StudentDetail(),
};
