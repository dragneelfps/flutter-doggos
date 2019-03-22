import 'package:flutter/material.dart';
import 'dog_model.dart';

class AddDogForm extends StatefulWidget {

  @override
  _AddDogFormState createState() => _AddDogFormState();

}

class _AddDogFormState extends State<AddDogForm> {

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void submitPup(BuildContext context) {
    if(nameController.text.isEmpty) {
      print('Dogs need a name!!');
    } else {
      var newDog = Dog(nameController.text, locationController.text, descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body:Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: locationController,
                    decoration: InputDecoration(
                  labelText: "Pup's location",
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child:Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitPup(context),
                      color: Colors.indigoAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                )
              )
            ],
          )
        )
      )
    );
  }
  
}