import 'package:flutter/material.dart';

class Paymentpage extends StatefulWidget{
    const Paymentpage({super.key});
    @override
    State<Paymentpage> createState() => PaymentpageState();
}
 class PaymentpageState extends State<Paymentpage> {
  String selectedValue='cash on turf';
@override
  Widget build(BuildContext context){
return Scaffold(
  appBar:AppBar(backgroundColor: Colors.indigoAccent,
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Align text to left
    children: [
      Text(
        "Book Turf",
        style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,
            color:Colors.green),
      ),
      Text(
        "The Home of Grassroots Sports",
        style: TextStyle(fontSize: 14,
            color: Colors.green),
      ),
    ],
  ),
),

body:Column(
  mainAxisAlignment:MainAxisAlignment.start,
  children: [
    RadioListTile(
      title: Text("Cash on Turf"),
      value: "Cash on Turf",
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
    RadioListTile(
      title: Text("UPI"),
      value: "UPI",
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),

    RadioListTile(
      title: Text("Debit/Credit card"),
      value: "Debit/Credit card",
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
    RadioListTile(
      title: Text("Net Banking"),
      value: "Net Banking",
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
    SizedBox(height:40,width:300,
      child:TextField(
      decoration: InputDecoration(
        hintText: 'Add promo card or Gift card',
        hintStyle: const TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),

        ),
        suffixIcon: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
      style: const TextStyle(color: Colors.green),
    ),),
  ],
),
);
}}