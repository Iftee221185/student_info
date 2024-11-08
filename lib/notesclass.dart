//model class
class Note {
  final String? id;
  final String? name;
  final String? number;
  final String? email;


  //constructor
  Note({
    this.id,
    this.name,
    this.email,
    this.number,

  });


  //for saving data to db
  //name must be same as table name in db
  Map<String, dynamic> toMap() {

    return {
      'id':id,
      'name': name,
      'email' : email,
      'number':number,
    };

  }

  //for retrieving data from db
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'].toString(),
      name: map['name'],
      email: map['email'],
      number: map['number'].toString(),
    );
  }
}