import 'package:flutter/material.dart';



class AttendanceRecord {
  final String date;
  final bool isPresent;

  AttendanceRecord(this.date, this.isPresent);
}

class AttendanceDataSource {
  List<AttendanceRecord> getAttendanceForMonth(String month) {
    // You would replace this method with your own logic for retrieving
    // attendance data for a given month from a database or other data source.
    // For this example, we'll just return some sample data.
    List<AttendanceRecord> records = [];
    if (month == "January") {
      records = [
        AttendanceRecord("Jan 1", true),
        AttendanceRecord("Jan 2", false),
        AttendanceRecord("Jan 3", true),
        AttendanceRecord("Jan 4", true),
        AttendanceRecord("Jan 5", true),
        AttendanceRecord("Jan 6", false),
        AttendanceRecord("Jan 7", true),
        AttendanceRecord("Jan 8", true),
        AttendanceRecord("Jan 9", true),
        AttendanceRecord("Jan 10", true),
      ];
    } else if (month == "February") {
      records = [
        AttendanceRecord("Feb 1", true),
        AttendanceRecord("Feb 2", true),
        AttendanceRecord("Feb 3", false),
        AttendanceRecord("Feb 4", true),
        AttendanceRecord("Feb 5", true),
        AttendanceRecord("Feb 6", false),
        AttendanceRecord("Feb 7", true),
        AttendanceRecord("Feb 8", true),
        AttendanceRecord("Feb 9", true),
        AttendanceRecord("Feb 10", true),
      ];
    }
    return records;
  }
}
class Attendancelog extends StatefulWidget {
  const Attendancelog({super.key});

  @override
  State<Attendancelog> createState() => _AttendancelogState();
}

class _AttendancelogState extends State<Attendancelog> {
   String selectedMonth = "January"; // initial selected month
  
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ]; // list of months for dropdown button
  
  AttendanceDataSource dataSource = AttendanceDataSource();
  @override
  Widget build(BuildContext context) {
   
    List<AttendanceRecord> records =
        dataSource.getAttendanceForMonth(selectedMonth);

   return
       Scaffold(
        appBar: AppBar(
          title: Text('Attendance Log'),
           backgroundColor: Color.fromARGB(255, 121, 6, 6) 
        ),
         backgroundColor: Color.fromARGB(255, 4, 28, 63),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select a month:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: selectedMonth,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                dropdownColor: Colors.grey[800],
                  underline: Container(
                    height: 2,
                    color: Colors.purple,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                  },
                  items: months
                      .map<DropdownMenuItem<String>>((
// continued from previous code

                    String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Attendance for $selectedMonth:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Attendance',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: records.map((record) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(record.date),
                          ),
                          DataCell(
                            Text(record.isPresent ? 'Present' : 'Absent'),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  
  }
}
