
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'Forgot_password_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => LoginpageState();
}

class LoginpageState extends State<Loginpage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
bool isChecked=false;
  void login() {
    String user = userController.text.trim();
    String pass = passController.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter User ID & Password")),
      );
      return;
    }

    // Example hardcoded login
    if (user == "admin" && pass == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful")),
      );
      // Navigate after login
      Navigator.push(context, MaterialPageRoute(builder: (_) => Homepage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid User ID or Password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 100, color: Colors.grey),

              SizedBox(height: 20),

              // USER ID
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: "User ID or Mobile Number",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              // PASSWORD
              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:5),
              Text("It must be Combination of minimum 8 letters,number,one special character",
              style: TextStyle(color: Colors.black, fontSize: 12),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text("Remember Me", style: TextStyle(fontSize: 16)),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Forgotpasswordpage()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),



              SizedBox(height: 30,width:100),

              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,

                  minimumSize:Size(200, 50),
                  maximumSize: Size(200, 60),
                ),
                child: Text("Log In"),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
