import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/homepage.dart';
import 'package:student_info/notesclass.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  late DatabaseHelper dbHelper;

  var nameController = TextEditingController();
  var idController=TextEditingController();
  var emailController=TextEditingController();
  var numberController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //add notes to database
  Future addNotes() async
  {
    final newNote = Note(
      id: (idController.text).toString(),
      name: (nameController.text).toString(),
      email: (emailController.text).toString(),
      number: (numberController.text).toString(),
    );

    //if data insert successfully, its return row number which is greater that 1 always
    int check= await dbHelper.insertData(newNote.toMap());
    Fluttertoast.showToast(msg: "homepage");
    print("Check=$check");
    if(check>0)
    {


      Get.snackbar("Success", "Note Added",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(Homepage());
    }
    else
    {
      Get.snackbar("Error", "Error in adding notes",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.blue,
        title: Text("Add Student's Data",style: TextStyle(
            color: Colors.white
        ),),


      ),
      body: Form(
        key: noteFormKey,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: idController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student-ID",
                  hintText: "Enter your ID",
                  prefixIcon: const Icon(Icons.card_membership),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Student-ID";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Number",
                  hintText: "Enter your Number",
                  prefixIcon: const Icon(Icons.mobile_friendly),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Number";
                  }

                  return null;
                },
              ),





              SizedBox(height: 50,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();

                    addNotes();



                  }

                },
                child:  Text(
                  "Save Data",
                  style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),

                ),
              ),

            ],
          ),

        ) ,
      ),
    );
  }
}