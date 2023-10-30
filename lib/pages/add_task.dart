import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => AddTaskState();

}

class AddTaskState extends State<AddTask> {

String addTask = "";

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "Ajouter une tâche"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (text) {
              addTask = text;
            },
            maxLength: 25,
            controller: TextEditingController(),
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ajouter une tâche...',
            ),
          ),
      ElevatedButton(
        onPressed: () => {
          if(addTask == "") {
            
          } else
          Navigator.pop(context, addTask)
        },
        child: const Text("Ajouter"),
          )
        ]
      ))
    );
  }
}