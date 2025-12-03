import 'package:flutter/material.dart';
import 'payment_page.dart';
class BooknowPage extends StatefulWidget {
  final String courtName;
  final String courtImage;

  BooknowPage({required this.courtName, required this.courtImage});

  @override
  BooknowPageState createState() => BooknowPageState();
}

class BooknowPageState extends State<BooknowPage> {
  String? selectedSlot;
  String? courtName;
  String? slot;

  final List<String> timeSlots = [
    "7:00 AM - 8:00 AM",
    "8:00 AM - 9:00 AM",
    "4:00 PM - 5:00 PM",
    "5:00 PM - 6:00 PM",
    "6:00 PM - 7:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Court"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              widget.courtName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
Text(
              "Select Time Slot:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 10),

            Wrap(
              children: timeSlots.map((slot) {
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedSlot = slot);
                  },
                  child: Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: selectedSlot == slot
                      ? Colors.blue
                          : Colors.white,
                      border: Border.all(
                        color: selectedSlot == slot
                            ? Colors.blue
                            : Colors.black26,
                      ),
                    ),
                    child: Text(
                      slot,
                      style: TextStyle(
                        color: selectedSlot == slot
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: selectedSlot == null ? null : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Booked ${widget.courtName} for $selectedSlot"),
                    ),
                  );
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Paymentpage(
                  courtName:widget.courtName,
                  slot:selectedSlot!,
                ),),);
                  },
                child: Text("Confirm Booking"),
              ),
            )
          ],
        ),
      ),
    );
  }
}








