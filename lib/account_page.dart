import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class Accountpage extends StatefulWidget{
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => AccountpageState();
}

class AccountpageState extends State<Accountpage> {
  File? image;

  Future pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    setState(() {
      image = File(picked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(centerTitle: true,
        title:Text("Turf ID"),
          ),
        body:
           Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                      image != null ? FileImage(image!) : null,
                      child: image == null
                          ? Icon(Icons.person, size: 40)
                          : null,
                    ),
                  ),
            Center(child:GestureDetector(onTap:(){
            },
                child:ElevatedButton(onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>EditProfilePage(),),);},
                    child:Text("Edit Profile")))
            )
       ],), );
  }
}

class EditProfilePage extends StatelessWidget{
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}