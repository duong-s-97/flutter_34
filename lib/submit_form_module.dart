import 'package:assingment_34/enity/students_entity.dart';
import 'package:assingment_34/sql_heper.dart';
import 'package:assingment_34/student_detail.dart';
import 'package:flutter/material.dart';

class FormSubmit extends StatefulWidget {
  const FormSubmit({super.key});

  static const String routeName = "/formPage";

  @override
  State<FormSubmit> createState() => _FormSubmitState();
}

class _FormSubmitState extends State<FormSubmit> {
  List<Student> students = [];

  final _formKey = GlobalKey<FormState>();
  int _idEdit = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 200,
      height: 500,
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      hintText: "your name...", labelText: "Input your name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Input your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: "your email...", labelText: "Input your email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Input your email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String name = _nameController.text;
                        String email = _emailController.text;
                        Student student = Student(name: name, email: email);
                        if (_idEdit == 0) {
                          var _id = await SQLHelper.createItem(student);
                          if (_id != 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Success')),
                            );
                            setState(() {
                              _nameController.clear();
                              _emailController.clear();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Fail')),
                            );
                          }
                        } else {
                          student.id = _idEdit;
                          await SQLHelper.updateItem(student);
                          setState(() {
                            _idEdit = 0;
                            _nameController.clear();
                            _emailController.clear();
                          });
                        }
                      }
                    },
                    child: const Text("submit"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "List",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: SQLHelper.getItems(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text("Not data");
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return const Text("error get data");
                          } else {
                            students = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, index) {
                                return ListTile(
                                  tileColor: Colors.green.withOpacity(0.4),
                                  title: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          StudentDetail.routeName,
                                          arguments: snapshot.data?[index]);
                                    },
                                    child: Text(
                                      students[index].name,
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () async {
                                          Student student =
                                              await SQLHelper.getItem(
                                                  students[index].id as int);
                                          _idEdit =
                                              int.parse(student.id.toString());
                                          _nameController.text = student.name;
                                          _emailController.text = student.email;
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () async {
                                          await SQLHelper.deleteItem(
                                              students[index].id as int);
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
