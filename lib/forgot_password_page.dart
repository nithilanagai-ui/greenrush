import 'package:flutter/material.dart';



class Forgotpasswordpage extends StatefulWidget{


  @override
  State<Forgotpasswordpage> createState() => ForgotpasswordpageState();
}

class ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final emailController = TextEditingController();
@override
  Widget build(BuildContext context){
  return Scaffold(backgroundColor:Colors.white,
    appBar: AppBar(
      title: Text("Forgot Password"),
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Text(
          "Reset Password",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),

        Text(
          "Enter your email address and we will send you instructions to reset your password.",
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 30),

        // 📌 Email TextField
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),

        // 📌 Reset Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              print("Reset link sent to: ${emailController.text}");
              // You can add Firebase Auth or API call here.
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text("Send Reset Link", style: TextStyle(fontSize: 16)),
          ),
        ),

            SizedBox(height: 10),

            // 🔙 Back to Login
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // back to login
                },
                child: Text(
                  "Back to Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
  );
}
}