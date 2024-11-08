import 'package:flutter/material.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/notesclass.dart';
import 'package:student_info/updatepage.dart';

class Updatepage1 extends StatefulWidget {

  const Updatepage1({super.key});

  @override
  State<Updatepage1> createState() => _Updatepage1State();
}

class _Updatepage1State extends State<Updatepage1> {
  //declared variables
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
        title: const Text("Update Notes",style: TextStyle(
            color: Colors.white
        ),),
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No Information available!"))
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
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateNotes(notes : note,)));
              },  // for clickable list item
              title: Text(note.id!,style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(note.name!),
              leading: const Icon(
                Icons.note_alt_outlined,
                size: 40,

              ),
            ),
          );
        },
      ),
    );
  }
}
