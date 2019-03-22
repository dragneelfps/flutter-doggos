import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'dog_model.dart';
import 'dog_detail_page.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);

}

class _DogCardState extends State<DogCard> {

  Dog dog;
  
  String renderUrl;

  _DogCardState(this.dog);

  @override
  void initState() {
    super.initState();
    renderDogPic();
  }

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image:NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290,
      height: 115,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 64,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name, style: Theme.of(context).textTheme.headline),
              Text(widget.dog.location, style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.dog.rating} / 10')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    debugPrint(dog.imageUrl);
    setState(() {
     renderUrl = dog.imageUrl; 
    });
  }

  void showDogDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DogDetailPage(dog);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 115,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50,
                child: dogCard,
              ),
              Positioned(
                top: 7.5,
                child: dogImage
              )
            ],
          )
        )
      )
    );
  }

}