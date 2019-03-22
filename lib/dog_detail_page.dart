import 'package:flutter/material.dart';
import 'dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => _DogDetailPageState(dog);

}

class _DogDetailPageState extends State<DogDetailPage> {
  Dog dog;
  _DogDetailPageState(this.dog);

  final double dogAvatarSize = 150;

  double _sliderValue = 10;

  Widget get dogImage {
    return Container(
      height:dogAvatarSize,
      width: dogAvatarSize,
      decoration: BoxDecoration(
        shape:BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            offset: const Offset(1, 2),
            blurRadius: 2,
            spreadRadius: -1,
            color: const Color(0x33000000)),
          const BoxShadow(
              offset: const Offset(2.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: const Color(0x24000000)),
          const BoxShadow(
              offset: const Offset(3.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              color: const Color(0x1F000000)),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.dog.imageUrl),
        )
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40,
        ),
        Text(' ${widget.dog.rating} / 10', style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text('${widget.dog.name} 🎾', style: TextStyle(fontSize: 32)),
          Text(widget.dog.location, style: TextStyle(fontSize: 20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(widget.dog.description)
          ),
          rating,
        ],
      )
    );
  }

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0,
                  max: 15,
                  onChanged: (newRating) {
                    setState(() {
                     _sliderValue = newRating; 
                    });
                  },
                  value: _sliderValue,
                )
              ),
              Container(
                width: 50,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}', style: Theme.of(context).textTheme.display1),
              )
            ],
          )
        ),
        submitRatingButton,
      ],
    );
  }

  Widget get submitRatingButton {
    return RaisedButton(
      onPressed: () => print('pressed'),
      child: Text('Submit'),
      color: Colors.indigoAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.dog.name}')
      ),
      body: ListView(
        children: <Widget>[dogProfile, addYourRating],
      ),
    );
  }

  
}