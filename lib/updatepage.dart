import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/homepage.dart';
import 'package:student_info/notesclass.dart';

class UpdateNotes extends StatefulWidget {

  final notes;
  const UpdateNotes({super.key,required this.notes});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {

  late DatabaseHelper dbHelper;

  var nameController=TextEditingController();
  var idController=TextEditingController();
  var emailController=TextEditingController();
  var numberController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();





  //add notes to database
  Future  updateNotes() async
  {
    final updatedNote = Note(
      id: (idController.text).toString(),
      name: (nameController.text).toString(),
      email: (emailController.text).toString(),
      number: (numberController.text).toString(),
    );

    int check= await dbHelper.updateData(updatedNote.toMap(),updatedNote.id!);
    print("Check=$check");
    if(check>0)
    {

      Get.snackbar("Updated", "Information Updated",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(Homepage());

    }
    else
    {
      Get.snackbar("Error", "Error in Information update",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DatabaseHelper.instance;
    idController.text=widget.notes.id;
    nameController.text=widget.notes.name;
    emailController.text=widget.notes.email;
    numberController.text=widget.notes.number;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.blue,
        title: Text("Updates Notes",style: TextStyle(
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
                    return "Please enter note Name";
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
                    return "Please enter note Student-ID";
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
                    return "Please enter note Email";
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



                    updateNotes();



                  }

                },
                child:  Text(
                  "Update Notes",
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