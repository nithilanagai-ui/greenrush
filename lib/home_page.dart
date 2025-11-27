import 'package:flutter/material.dart';
import 'court_list_page.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Homepage(),));
}
class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(backgroundColor: const Color.fromARGB(255, 177, 187, 194),
      appBar:AppBar(backgroundColor: Colors.blue,
        title: const Text('Welcome to Cricketclub'),
        flexibleSpace:
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [IconButton(icon:const Icon(Icons.home),color: Colors.white,
          onPressed:() {
            Navigator.push(context,
              MaterialPageRoute<void>(
                builder: (context)=> Homepage(),),);
          }, ),

          IconButton(icon:const Icon(Icons.search), color: Colors.white,
            onPressed:(){
              Navigator.push(context,
                MaterialPageRoute<void>(
                  builder: (context)=> Locationsearchpage(),),);
            }, ),
          IconButton(icon:const Icon(Icons.settings), color: Colors.white,
            onPressed:(){Navigator.push(context,
              MaterialPageRoute<void>(
                builder: (context)=> Settingspage(),),);},),],),

      body:SingleChildScrollView(
        padding:EdgeInsets.only(top:20.0),
        child:Column(
          children: [

            GestureDetector( onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CourtlistPage()),);},
              child: Column(
                children:[Container(
                  width:  screenWidth * 0.85,  // 85% of screen size (Responsive)
                  height: screenHeight * 0.30, // 30% of screen height
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/flamingcricket.png'),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),


                  SizedBox(height:5),
                  Text('Play with us'),
                ],),
            ),
            GestureDetector( onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CourtlistPage()),);},
              child: Column(
                children:[Container(
                  width:  screenWidth * 0.85,  // 85% of screen size (Responsive)
                  height: screenHeight * 0.30, // 30% of screen height
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/flamingcricket.png'),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),


                  SizedBox(height:5),
                  Text('To book new'),
                ],),
            )




          ],),), );
  }
}

class Locationsearchpage extends StatelessWidget{
  const Locationsearchpage ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100, // Adjust as needed
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: TextField(maxLength: 20,
                decoration: InputDecoration(
                  hintText: 'venues,cities,club,...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),


    );

  }
}
class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => SettingspageState();
}

class SettingspageState extends State<Settingspage> {
  bool notification = true;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('setting'),),
        body:ListView(
            children: [

        // --- ACCOUNT ---
        ListTile(
        leading: Icon(Icons.person),
      title: Text("Account"),
      subtitle: Text("Profile, phone number"),
      onTap: () {

      },
    ),
    Divider(),

    // --- NOTIFICATIONS ---
    SwitchListTile(
      title: Text("Notifications"),
      secondary: Icon(Icons.notifications),
      value: notification,
      onChanged: (value) {
        setState(() {
          notification = value;
        });
      },
    ),
    // --- DARK MODE ---


    Divider(),


    // --- PRIVACY ---
    ListTile(
      leading: Icon(Icons.lock),
      title: Text("Privacy"),
      subtitle: Text("Password, security"),
      onTap: () {
             },
    ),

    // --- ABOUT ---
    ListTile(
      leading: Icon(Icons.info),
      title: Text("About"),
      subtitle: Text("Version, app info"),
      onTap: () {},
    ),
              Divider(),

              // LOGOUT BUTTON
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
        ),
    );
    }
}

