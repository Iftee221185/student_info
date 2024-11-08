import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/notesclass.dart';


class Deletenodes extends StatefulWidget {
  const Deletenodes({super.key});

  @override
  State<Deletenodes> createState() => _DeletenodesState();
}

class _DeletenodesState extends State<Deletenodes> {

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

  //for deleting a note
  Future deleteNote(String id) async {
    int check= await dbHelper.deleteData(id);
    if(check>0){
      Fluttertoast.showToast(msg: "Note deleted successfully");
      loadAllNotes();
    }
    else
    {
      Fluttertoast.showToast(msg: "Failed to delete note");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Delete",style: TextStyle(
            color: Colors.white
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
              ),
               // for clickable list item
              title: Text(note.id!,style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(note.name!),
              leading: const Icon(
                Icons.note_alt_outlined,
                size: 40,

              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete,color: Colors.redAccent,size: 40,),
                onPressed: () {


                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'Delete',
                    desc: 'Want to delete note ?',
                    buttonsTextStyle:
                    const TextStyle(color: Colors.white),
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkText: 'YES',
                    btnCancelText: 'NO',
                    btnOkOnPress: () {

                      deleteNote(note.id!);
                      Get.back();

                    },
                  ).show();
                } ,
              ),
            ),
          );
        },
      ),
    
    );
  }
}