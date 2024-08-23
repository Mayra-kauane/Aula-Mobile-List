import 'package:flutter/material.dart';
import '../data/todos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController text = TextEditingController();
  String title = "Informação do usuário";
  bool show = false;
  List tasks = ["Dar aula", "trablahar", "estudar"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                print(text.text);
              },
              obscureText: show,
              controller: text,
              keyboardType: TextInputType.text,
              maxLength: 100,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //hintText: "Usuário",
                labelText: "Tarefa",
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      text.clear();
                    });
                  },
                  icon: Icon(Icons.cancel),
                  splashRadius: 16,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    setState(() {
                      tasks.add(text.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Tarefa adicionada com sucesso")));
                      text.clear();
                    });
                  },
                  splashRadius: 16,
                ),
                //obscureText: true,
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index)=>Divider(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //tileColor: ((index % 2) == 0) ? Colors.pink : Colors.purple,
                    onLongPress: () {
                      todos.removeAt(index);
                    },
                    title: Text(todos[index]["title"]),
                    trailing: !todos[index]["completed"]
                  );
                  //return Text(tasks[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
