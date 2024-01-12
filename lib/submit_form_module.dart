import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentList();
}

class _StudentList extends State<StudentList> {
  final _studentNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final List<Student> _students = [];

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _studentNameController,
              decoration: const InputDecoration(
                labelText: 'Tên sinh viên',
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
              ),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Thêm'),
            ),
            Expanded(
                child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Tên sinh viên',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Số điện thoại',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: _students.isEmpty
                  ? const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('')),
                          DataCell(Text('')),
                        ],
                      ),
                    ]
                  : _students
                      .map(
                        (student) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(student.name)),
                            DataCell(Text(student.phoneNumber)),
                          ],
                        ),
                      )
                      .toList(),
            )),
          ],
        ),
      ),
    );
  }

  void _submit() {
    String studentName = _studentNameController.text;
    String phoneNumber = _phoneNumberController.text;

    Student student = Student(name: studentName, phoneNumber: phoneNumber);

    _students.add(student);

    _studentNameController.clear();
    _phoneNumberController.clear();

    setState(() {});
  }
}

class Student {
  String name;
  String phoneNumber;

  Student({required this.name, required this.phoneNumber});
}
