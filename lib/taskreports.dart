import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class TasksReportPage extends StatelessWidget {
  int _selectedIndex = 0;

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
            SizedBox(width: 10),
            Text('PSN COLLEGE', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
                Text(
                  'Completed Tasks',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Three clickable boxes
          buildClickableBox(
              context, 'Task 1', 'Task 1', 'Task 1 Description', '9:00 AM'),
          buildClickableBox(
              context, 'Task 2', 'Task 2', 'Task 2 Description', '10:30 AM'),
          buildClickableBox(
              context, 'Task 3', 'Task 3', 'Task 3 Description', '2:00 PM'),
        ],
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
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget buildClickableBox(BuildContext context, String text, String taskName,
      String taskDescription, String taskTime) {
    return GestureDetector(
      onTap: () {
        _showReportPopup(context);
      },
      child: Container(
        height: 60,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.8,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  void _showReportPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Displaying text in a box with no input
              Container(
                height: 100, // Adjust the height as needed
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  'Enter your report here...',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          actions: [
            // Close button in the top-right corner with an icon

            // Button "Submit" in the top-left corner
            Positioned(
              top: 0,
              left: 0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                  // Handle "Submit" button click
                  // ...
                },
                child: Text('Close'),
              ),
            ),
          ],
        );
      },
    );
  }
}