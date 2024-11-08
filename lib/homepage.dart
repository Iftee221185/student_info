import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_info/addpage.dart';
import 'package:student_info/alldatashow.dart';
import 'package:student_info/dbhelper.dart';
import 'package:student_info/deletepage1.dart';
import 'package:student_info/updatepage1.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late DatabaseHelper dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DatabaseHelper.instance;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              toolbarHeight: 150,
              backgroundColor: Colors.greenAccent,
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Student's Information",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),)
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 200, 30, 0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              children: [
                Card(
                  elevation: 10,
                  color: Colors.grey.shade50,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>Alldatashow());
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 50,color: Colors.greenAccent,),
                          Text("Students",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.grey.shade50,
                  child: GestureDetector(
                    onTap: (){

                      Get.to(AddNotes());
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,size: 50,color: Colors.greenAccent,),
                          Text("Add Student",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.grey.shade50,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>Updatepage1());
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.update,size: 50,color: Colors.greenAccent,),
                          Text("Update Student",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.grey.shade50,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(Deletenodes());
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete,size: 50,color: Colors.redAccent,),
                          Text("Delete",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
