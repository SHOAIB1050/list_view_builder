import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'List View Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchControler = TextEditingController();
  String search = '';


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: searchControler,
                decoration: const InputDecoration(
                    hintText: 'Search Somthing....',
                    border: OutlineInputBorder()),
                onChanged: (String? value) {
                  setState(() {
                    search = value.toString();
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5000,
                    itemBuilder: (context, index) {
                      late String Position = index.toString();
                      if (searchControler.text.isEmpty) {
                        return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://media.licdn.com/dms/image/D4D03AQHxokPY-fRQyg/profile-displayphoto-shrink_800_800/0/1691647057439?e=2147483647&v=beta&t=IDZ7AhZd9jSbdLj2KP0ATAoyzL1Gl7wh-jccHeAvbZY'),
                            ),
                            title: Text('Shoaib Farooq $index'),
                            subtitle: Text('Hello'));
                      } else if (Position.toLowerCase()
                          .contains(searchControler.text.toLowerCase())) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://media.licdn.com/dms/image/D4D03AQHxokPY-fRQyg/profile-displayphoto-shrink_800_800/0/1691647057439?e=2147483647&v=beta&t=IDZ7AhZd9jSbdLj2KP0ATAoyzL1Gl7wh-jccHeAvbZY'),
                          ),
                          title: RichText(
                            text: TextSpan(
                              text: 'Shoaib  ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: index.toString(),
                                style: TextStyle(color: Colors.red))
                              ]
                            ),

                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
