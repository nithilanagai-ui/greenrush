import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'book_now_page.dart';

class CourtlistPage extends StatefulWidget {
  @override
  CourtlistPageState createState() => CourtlistPageState();
}

class CourtlistPageState extends State<CourtlistPage> {
  late Future<List<dynamic>> courtsFuture;
  @override
  void initState() {
    super.initState();
    courtsFuture = loadCourts();
  }

  Future<List<dynamic>> loadCourts() async {
    final  jsonString =
        await rootBundle.loadString('assets/data/courts.json');
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Courts")),
      body: FutureBuilder<List<dynamic>>(
        future: courtsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final courts = snapshot.data!;
return ListView.builder(
            itemCount: courts.length,
            itemBuilder: (context, index) {
              final site = courts[index]["site"];
              final image = courts[index]['image'];

              return Card(
                margin: EdgeInsets.all(12),
                elevation: 3,
                child: ListTile(contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                child:Image.asset(
                  image,
                  width:60,
                  height:60,
                  fit: BoxFit.cover,),),
                  
                                   
                  tileColor:Colors.black26,
                  title: Text(site),
                  subtitle: Text("Tap to book"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BooknowPage(courtName: site,
                        courtImage:image),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}