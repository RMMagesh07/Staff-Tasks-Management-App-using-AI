import 'package:attendance_app/adminfeedback.dart';
import 'package:attendance_app/adminmain.dart';
import 'package:attendance_app/adminprofile.dart';
import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class AssignStaffPage extends StatefulWidget {
  @override
  _AssignStaffPageState createState() => _AssignStaffPageState();
}

class _AssignStaffPageState extends State<AssignStaffPage> {
  int _selectedIndex = 0;

  String? selectedStaff; // Default selected staff, change as needed
  List<String> staffList = ['Staff 1', 'Staff 2', 'Staff 3', 'Staff 4', 'Staff 5']; // Add actual staff names
  String? selectedProgram; // Use nullable type to represent no selection
  String? selectedCourse;
  String? selectedDept;

  List<String> programList = ['U.G', 'P.G']; // Add actual program names
  List<String> courseList = ['B.E', 'M.E', 'B.Tech', 'M.Tech', 'M.B.A']; // Add actual course names
  List<String> deptList = ['EEE', 'CSE', 'ECE', 'AERO', 'MECH', 'CIVIL']; // Add actual department names
  String? selectedYear; // Default selected staff, change as needed
  List<String> yearList = ['I', 'II', 'III', 'IV']; // Add actual staff names
  String? selectedSemester; // Default selected staff, change as needed
  List<String> semesterList = ['I', 'II', 'III', 'IV','V','VI','VII','VIII']; // Add actual staff names
  String? selectedSection; // Default selected staff, change as needed
  List<String> sectionList = ['A', 'B', 'C', 'D']; // Add actual staff names
  String? selectedSubject; // Default selected staff, change as needed
  List<String> subjectList = ['Subject 1', 'Subject 2', 'Subject 3', 'Subject 4','Subject 5']; // Add actual staff names



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
                    'Assign Staff',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                        value: selectedYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedYear = newValue!;
                          });
                        },
                        items: yearList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Year"),
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
                        value: selectedSemester,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSemester = newValue!;
                          });
                        },
                        items: semesterList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Semester"),
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
                        value: selectedSection,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSection = newValue!;
                          });
                        },
                        items: sectionList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Section"),
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
              // Grey box around the dropdown
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true, // Set to true to make the dropdown wider
                  value: selectedSubject,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSubject = newValue!;
                    });
                  },
                  items: subjectList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text("Select Subject"),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminMainPage(

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
                      'Assign Staff',
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
