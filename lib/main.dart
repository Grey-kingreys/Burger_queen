
import 'package:flutter/material.dart';



void main() {
  runApp( MaterialApp(
    theme: ThemeData(
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white
    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});



  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("WhatsApp"),
          elevation: 15.0,
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.camera_alt)
            ),
            IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.more_vert)
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                  child: Text("Menu")
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Parametres"),
                onTap: (){

                },

              )
            ],
          ),
        ),
        body: Center(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            margin: EdgeInsets.all(16),
            color: Colors.lightBlue.shade100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Mon identité",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Divider(
                  thickness: 2,
                  indent: 8,
                  endIndent: 8,
                  color: Colors.lightBlueAccent,
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2023/05/07/21/06/ai-generated-7977128_640.png"),
                    ),
                    Spacer(),
                    Text(
                        "Grey Kingrey's",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.network("https://cdn.pixabay.com/photo/2022/04/04/16/42/ai-7111803_640.jpg")
              ],
            ),
          ),
        ),
    );
  }
}

