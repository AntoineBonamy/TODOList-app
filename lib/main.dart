import 'package:flutter/material.dart';
import 'pages/add_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List liste = [
    "Première tâche",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: 
      Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Ma TODO List : "),
        Container(
        color: const Color.fromARGB(255, 233, 197, 197),
        height: 250,
        width: 300,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(left: 10.0, top: 5.0),
        child: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (BuildContext context, int index) {
                  return 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) => true,
                          ),
                        Text(liste[index]),
                        IconButton(
                          icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            liste.removeAt(index);
                          }
                        );
                      },
                    ),
                  ]
                );
              }
            )
          ),
        ElevatedButton(
        onPressed: (() async {
          final result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const AddTask())
            );

            if (result != null) {
              setState(() {
                liste.add(result);
              });
            }
          }
        ),
        child: const Text("Ajouter une tâche"),
        )
      ]
    ))
  );
}
}
