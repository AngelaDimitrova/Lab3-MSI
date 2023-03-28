import 'package:flutter/material.dart';
import 'package:laboratoriska3/Model/exam_appointment.dart';
import 'package:laboratoriska3/widgets/nov_element.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ExamAppointment> _examAppointments = [
     ExamAppointment(id: '1', examName: 'OOP', date: DateTime(2023, 1, 20)),
  ];

  void _addExamAppointment(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: () {},
        child: NovElement(_addNewAppointmentToList),
        behavior: HitTestBehavior.opaque
      );
      }
    );
  }

  void _addNewAppointmentToList(ExamAppointment ea){
    setState(() {
      _examAppointments.add(ea);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addExamAppointment(context),
          )
        ],
      ),
      body: Center(
        child: _examAppointments.isEmpty ? Text("There are no exam appointements yet") :  ListView.builder(itemBuilder: (ctx, index){
            return Card(elevation: 3,margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                title: Text(_examAppointments[index].examName),
                subtitle: Text(DateFormat('dd.MM.yyyy').format(_examAppointments[index].date!)),
              )
            );
          },
          itemCount: _examAppointments.length
        ),
      ),
    );
  }
}
