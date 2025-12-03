
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
class Paymentpage extends StatefulWidget {
  final String courtName;
  final String slot;

  const Paymentpage({super.key,required this.courtName, required this.slot});

  @override
  State<Paymentpage> createState() => PaymentpageState();
}

class PaymentpageState extends State<Paymentpage> {
  String? selectedValue;
  TextEditingController couponController = TextEditingController();

  double originalPrice = 500;   // your turf price
  double discountAmount = 0;    // discount value
  double finalPrice = 0;
  String message = "";
  void applyCoupon() {
    String code = couponController.text.trim().toUpperCase();

    setState(() {
      if (code == "TURF10") {
        discountAmount = originalPrice * 0.10;   // 10% discount
        message = "Coupon Applied: 10% Off!";
      }
      else if (code == "TURF50") {
        discountAmount = 50;  // Flat ₹50 off
        message = "₹50 Discount Applied!";
      }
      else {
        discountAmount = 0;
        message = "Invalid Coupon Code!";
      }

      finalPrice = originalPrice - discountAmount;
    });
  }

  @override
  Widget build(BuildContext context){
  return Scaffold(
  appBar:AppBar(backgroundColor: Colors.white,
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Align text to left
    children: [
      Text(
        "Book Turf",
        style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,
            color:Colors.lightGreen),
      ),
      Text(
        "The Home of Grassroots Sports",
        style: TextStyle(fontSize: 14,
            color: Colors.lightGreen),
      ),
    ],
  ),
),

    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment:MainAxisAlignment.start,
            children:[
            Container(
      child:Text("Select a Payment method",
          style:TextStyle(color:Colors.lightGreen,
              fontWeight:FontWeight.bold),),),],),

          RadioListTile<String>(
    title: Text("Cash on Turf",
      style:TextStyle(color:Colors.lightGreen,
    fontSize:16,
          fontWeight:FontWeight.w200),),
    subtitle: Text("Pay directly at the turf location",     // <-- Your subtitle here
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ),
    ),

    value: "Cash on Turf",
    groupValue: selectedValue,
    onChanged: (value) {
      setState(() => selectedValue = value);
    },
  ),
    RadioListTile<String>(
    title: Text("UPI",style:TextStyle(color:Colors.lightGreen,
        fontSize:16),),
      subtitle: Text("Paytm,Phonepe",     // <-- Your subtitle here
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    value: "UPI",
    groupValue: selectedValue,
    onChanged: (value) {
    setState(() => selectedValue = value);
    },
    ),
    RadioListTile<String>(
    title: Text("Debit/Credit Card",
      style:TextStyle(color:Colors.lightGreen,
        fontSize:16),),
    value: "Debit/Credit Card",
    groupValue: selectedValue,
    onChanged: (value) {
    setState(() => selectedValue = value);
    },
    ),
          RadioListTile<String>(
            title: Text("Net Banking",
              style:TextStyle(color:Colors.lightGreen,
                fontSize:16),),
            value: "Net Banking",
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() => selectedValue = value);
            },
          ),

        Padding(padding:EdgeInsets.only(left:50),
          child:SizedBox(
            width:200,
          child: TextField(
            controller: couponController,
            decoration: InputDecoration(
              labelText: "Add promo code or GIFT card",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: applyCoupon,

              ),
            ),
          ),),),
          Align(alignment:Alignment.bottomCenter,
          child:Padding(padding:EdgeInsets.symmetric(vertical: 14, horizontal: 30),

            child:SizedBox(width:150,height:50,
              child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                backgroundColor: Colors.lightGreen,     // Button color
                foregroundColor: Colors.white,    // Text color
              ),
              onPressed: () {},
              child: Text("Continue Pay"),
            ),),),),


    ],),);
      }
}

            