import 'package:flutter/material.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/notesclass.dart';
import 'package:get/get.dart';


class Alldatashow extends StatefulWidget {
  const Alldatashow({super.key});

  @override
  State<Alldatashow> createState() => _AlldatashowState();
}

class _AlldatashowState extends State<Alldatashow> {
  late DatabaseHelper dbHelper;
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    //initializing dbHelper
    dbHelper = DatabaseHelper.instance;
    //load notes on startup
    loadAllNotes();
  }


  //for loading data from db
  Future loadAllNotes() async {
    final data = await dbHelper.getAllData();
    setState(() {
      //This line converts a list of map entries (database records) into a list of Note objects using the Note.fromMap method, making it easier to work with custom objects in your app.
      //each element is a map, represented by e
      notes = data.map((e) => Note.fromMap(e)).toList();


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("All Data of Students",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No notes available!"))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          Note note = notes[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(5),
              ), // for clickable list item
              title: Text(note.id!,style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(note.name!),
              leading: const Icon(
                Icons.person,
                size: 40,

              ),


            ),
          );
        },
      ),
    );
  }
}

