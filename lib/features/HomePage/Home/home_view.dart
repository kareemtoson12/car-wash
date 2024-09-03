import 'package:flutter/material.dart';

import '../../../core/colors_manger.dart';

var features = [
  {
    'image':'images/car wash 2.jpg',
    'title': 'Exterior',
  },
  {
    'image':'images/interior.jpg',
    'title': 'Interior',
  },
  {
    'image':'images/car wash 1.jpg',
    'title': 'Detailing',
  },
  {
    'image':'images/car wash 3.jpg',
    'title': 'Tyre Wash',
  },
  {
    'image':'images/interior.jpg',
    'title': 'Polish',
  },
];
class HomeView extends StatelessWidget {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:EdgeInsets.fromLTRB(15,12,15,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Header(),
              SizedBox(height:15,),
              Features_services(),
              SizedBox(height:8,),
              appointment(),
              SizedBox(height:10,),
              Promotions(),
              SizedBox(height:10,),
              About_us(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Header(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dohaa aymann",
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 35,
              ))
        ],
      ),
      Text(
        "A clean Car is a\nhappy car!",
        style: TextStyle(
            color: ColorsManger.darkblue, fontWeight: FontWeight.bold, fontSize: 35),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.black12,
            borderRadius:BorderRadius.circular(15)),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Search..",
              fillColor: Colors.white30,
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.settings),
            border: InputBorder.none
          ),
        ),
      ),
    ],
  );
}

Widget Features_services(){
  return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Featured services",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black38)),
    Container(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: features.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("${features[i]['image']}"),
                  radius: 30,
                ),
                Text(
                  "${features[i]['title']}",
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color:ColorsManger.darkblue),
                )
              ],
            ),
          );
        },
      ),
    ),
  ],);
}
Widget appointment(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Your appointment",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black45)),
      SizedBox(height: 10,),
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
          // image: DecorationImage(image: AssetImage("images/img.png"),fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("You don't have any car wash appointment yet..",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    ElevatedButton(
                        onPressed: () {}, child: Text("Book now"))
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/car wash 3.jpg"),
                      fit: BoxFit.cover)),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget Promotions(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Promotions",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black45)),
      SizedBox(height: 10,),
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
          // image: DecorationImage(image: AssetImage("images/img.png"),fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("For our most loyal customers!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    ElevatedButton(
                        onPressed: () {}, child: Text("Join now"))
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/offers.jpg"),
                      fit: BoxFit.cover)),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget About_us(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("About us",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black45)),
      SizedBox(height: 10,),
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
          // image: DecorationImage(image: AssetImage("images/img.png"),fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("You don't have any\ncar wash appointment yet..",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    ElevatedButton(
                        onPressed: () {}, child: Text("About Us"))
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/img.png"),
                      fit: BoxFit.cover)),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ],
  );
}