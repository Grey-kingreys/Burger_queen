import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.pink),
      ),
      home: const MyHomePage(title: 'Burger Queen'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage> {

  final TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.brown
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
          leading: const Icon(Icons.token),
          actions: const [
            Icon(Icons.person)
          ],
        ),
        body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Section mon restaurant le plus proche
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 150,
                child: Center(
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:  MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              const Text(
                                "Mon restaurant le plus proche",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "4km",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.pink
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.touch_app, color: Colors.white),
                                SizedBox(width: 16,),
                                Text(
                                  "Commander",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Section en ce moment
              sectionTitle(title: "En ce moment"),
              Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/layer-burger.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            "Une petite faim?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                          "Venez personnaliser votre burger",
                          style: TextStyle(
                            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Nos choix de burgers
              sectionTitle(title: "Chaud devant"),
              const Text("Le meilleur de nos burger a portée de clic"),
              SizedBox(
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      burgerCard(
                          name: "twins",
                          url: "twins",
                          description: "Le burger des jumeaux qui font la paire"
                      ),
                      burgerCard(
                          name: "Big Queen",
                          url: "big-queen",
                          description: "Celle qu porte la couronne a la maison"
                      ),
                      burgerCard(name: "Egg Bacon", url: "egg-bacon-burger", description: "Le burger des leve tot"),
                      burgerCard(name: "Prince", url: "prince", description: "Le preferer des futures rois"),
                      burgerCard(name: "Cheese", url: "cheese", description: "Le classique pour les fans de fromage")
                    ],
                  ),
                ),
              ),
              //Accompagnements
              sectionTitle(title: "Les accompagnements"),
              Card(
                elevation: 8,
                child: Column(
                  children: [
                    sideDish(name: "Frites classiques", url: "fries"),
                    sideDish(name: "Les frites de patate douce", url: "patate-douce"),
                    sideDish(name: "Poutine", url: "poutine"),
                    sideDish(name: "Potatoes", url: "potatoes")
                  ],
                ),
              ),

              //Boissons
              sectionTitle(title: "Une petite soif?"),
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      drink(name: "Le calssique", url: "classic-cola"),
                      drink(name: "Eau gazeuse", url: "sparkling"),
                      drink(name: "A l'Orange", url: "orange-soda"),
                      drink(name: "Goût fraise", url: "strawberry-soda"),
                    ],
                  ),
                ),
              ),
              
              sectionTitle(title: "Pour finir une petite touche sucrée"),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  douceur(name: "Glace oreo", url: "oreo-ice", size: MediaQuery.of(context).size.width * 0.4, context: context),
                  douceur(name: "Crepe Fraise", url: "strawberry-waffle", size: MediaQuery.of(context).size.width * 0.4, context: context),
                  douceur(name: "Donut", url: "donut", size: MediaQuery.of(context).size.width * 0.4, context: context),
                  douceur(name: "Cupcake", url: "cupcake", size: MediaQuery.of(context).size.width * 0.4, context: context),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: sectionTitle(title: "Et bon appétit bien sûr !"),
                      )
                    ),

                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Widget sectionTitle({required String title}){
    return Padding(padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text(title, style: titleStyle),
    );
  }

  Container burgerCard({required String name, required String url, required String description}){
    double size = 240;
    TextStyle descriptionStyle = const TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.black54

    );
    return Container(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.pinkAccent.withOpacity(0.3)
      ),
      height: size,
      width: size,
      child: Column(
        children: [
          Image.asset(
            "assets/images/$url.jpg",
            height: size * 0.6,
            width: size,
            fit: BoxFit.cover,
          ),
          Text(name, style: titleStyle),
          Text(description, style: descriptionStyle, textAlign: TextAlign.center,)
        ],
      ),
    );

  }

  Container sideDish({required String name, required String url}){
    return Container(
        padding:  const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/$url.jpg"),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const Divider(
              indent: 8,
              endIndent: 8,
            )
          ],
        )
    );
  }

  Container drink({required String name, required String url}){
    const double height = 250;
    const double width = 125;
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/$url.jpg",
            fit: BoxFit.cover, height: height,
          ),
          Text(
              name,
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),

    );
  }

  Container douceur({required String name, required String url, required double size, required BuildContext context}){
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/$url.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(6)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }

}
