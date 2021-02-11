import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieShop',
      theme: ThemeData(
          primarySwatch: Colors.amber
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Movie Shopee'),),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<BodyLayout>{
  int total = 0;
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/AvengerInf.jpg'),
          ),
          title: Text('Avenger: Infinity War'),
          subtitle: Text('Price: 229฿'),
          onTap: () {
            setState(() {
              total += 229;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Coco.jpg'),
          ),
          title: Text('Coco'),
          subtitle: Text('Price: 219฿'),
          onTap: () {
            setState(() {
              total += 219;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Her.jpg'),
          ),
          title: Text('Her'),
          subtitle: Text('Price: 159฿'),
          onTap: () {
            setState(() {
              total += 159;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Joker.jpg'),
          ),
          title: Text('Joker'),
          subtitle: Text('Price: 229฿'),
          onTap: () {
            setState(() {
              total += 229;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Narnia.jpg'),
          ),
          title: Text('Narnia'),
          subtitle: Text('Price: 129฿'),
          onTap: () {
            setState(() {
              total += 129;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/NowYouSeeMe2.png'),
          ),
          title: Text('Now You See Me 2'),
          subtitle: Text('Price: 179฿'),
          onTap: () {
            setState(() {
              total += 179;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Parasite.jpg'),
          ),
          title: Text('Parasite'),
          subtitle: Text('Price: 209฿'),
          onTap: () {
            setState(() {
              total += 209;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Spiderman.jpg'),
          ),
          title: Text('Spiderman: Far From Home'),
          subtitle: Text('Price: 199฿'),
          onTap: () {
            setState(() {
              total += 199;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/StarWarIX.jpg'),
          ),
          title: Text('Star War: The Last Jedi'),
          subtitle: Text('Price: 189฿'),
          onTap: () {
            setState(() {
              total += 189;
            });
          },
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Titanic.jpg'),
          ),
          title: Text('Titanic'),
          subtitle: Text('Price: 129฿'),
          onTap: () {
            setState(() {
              total += 129;
            });
          },
        ),
        ListTile(
          title: Text('Total Price: $total฿'),
          tileColor: Colors.amberAccent,
        ),
      ],
    );
  }
}
