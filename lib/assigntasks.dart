import 'adminfeedback.dart';
import 'adminmain.dart';
import 'adminprofile.dart';
import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class AssignTaskPage extends StatefulWidget {
  @override
  _AssignTaskPageState createState() => _AssignTaskPageState();
}

class _AssignTaskPageState extends State<AssignTaskPage> {
  int _selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedStaff; // Default selected staff, change as needed
  List<String> staffList = ['Staff 1', 'Staff 2', 'Staff 3', 'Staff 4', 'Staff 5']; // Add actual staff names
  String? selectedProgram; // Use nullable type to represent no selection
  String? selectedCourse;
  String? selectedDept;

  List<String> programList = ['U.G', 'P.G']; // Add actual program names
  List<String> courseList = ['B.E', 'M.E', 'B.Tech', 'M.Tech', 'M.B.A']; // Add actual course names
  List<String> deptList = ['EEE', 'CSE', 'ECE', 'AERO', 'MECH', 'CIVIL']; // Add actual department names


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/clg logo.png', // Adjust the path as needed
                width: 40,
                height: 40,
              ),
            ),
            Text('Assign Tasks', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Assign Tasks',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: titleController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: descriptionController,
                  style: TextStyle(fontSize: 18),
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.cyan),
                        SizedBox(width: 10),
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'Date',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('End Date'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.cyan),
                        SizedBox(width: 10),
                        Text(
                          selectedTime != null
                              ? '${selectedTime!.hour}:${selectedTime!.minute}'
                              : 'Time',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => _selectTime(context),
                          child: Text('End Time'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Row with three dropdowns for "Program", "Course", and "Dept"
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedProgram,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedProgram = newValue!;
                          });
                        },
                        items: programList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Program"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedCourse,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCourse = newValue!;
                          });
                        },
                        items: courseList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Course"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedDept,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDept = newValue!;
                          });
                        },
                        items: deptList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Dept"),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              // Grey box around the dropdown
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true, // Set to true to make the dropdown wider
                  value: selectedStaff,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStaff = newValue!;
                    });
                  },
                  items: staffList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text("Select Staff"),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminMainPage(
                        newTitle: titleController.text,
                        newDescription: descriptionController.text,
                        endDate: selectedDate,
                        endTime: selectedTime,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Assign Task',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        iconSize: 40.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            label: 'Feedback',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminMainPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminProfilePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminFeedbackPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
