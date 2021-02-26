import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String img;
  final String description;
  final int price;
  Movie(this.title, this.img, this.description, this.price);
}

void main() {
  runApp(MaterialApp(
    home: MainScreen(
        movies: List<Movie>.from([
      Movie('Avenger: Infinity War', 'assets/images/AvengerInf.jpg',
          'Genre: Action, Fantasy, Superhero\nPrice: 229฿', 229),
      Movie('Coco', 'assets/images/Coco.jpg',
          'Genre: Animation, Heartwarming, Music\nPrice: 219฿', 219),
      Movie('Her', 'assets/images/Her.jpg',
          'Genre: Drama, Romance\nPrice: 159฿', 159),
      Movie('Joker', 'assets/images/Joker.jpg',
          'Genre: Drama, Thriller, Psychopath\nPrice: 229฿', 229),
      Movie('Narnia', 'assets/images/Narnia.jpg',
          'Genre: Action, Fantasy \nPrice: 129฿', 129),
      Movie('Now You See Me 2', 'assets/images/NowYouSeeMe2.png',
          'Genre: Action, Sci-fi, Magic \nPrice: 179฿', 179),
      Movie('Parasite', 'assets/images/Parasite.jpg',
          'Genre: Drama, K-Drama \nPrice: 209฿', 209),
      Movie('Spiderman: Far From Home', 'assets/images/Spiderman.jpg',
          'Genre: Action, Sci-fi, Superhero \nPrice: 199฿', 199),
      Movie('Star War: The Last Jedi', 'assets/images/StarWarIX.jpg',
          'Genre: Action, Drama, Fantasy, Sci-fi \nPrice: 189฿', 189),
      Movie('Titanic', 'assets/images/Titanic.jpg',
          'Genre: Documentary, Drama, Romance \nPrice: 129฿', 129),
    ])),
  ));
}

class MainScreen extends StatefulWidget {
  final List<Movie> movies;
  List<Movie> SelectMovies = [];
  int total = 0;
  MainScreen({Key key, @required this.movies}) : super(key: key);

  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Shopee'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(widget.movies[index].img),
                      ),
                      title: Text(widget.movies[index].title),
                      subtitle: Text(
                          'Price: ${widget.movies[index].price.toString()}฿'),
                      onTap: () {
                        _navigateAndDisplaySelection(context, index);
                      },
                    );
                  })),
          Container(
              padding: EdgeInsets.only(top: 5.0),
              color: Colors.lightBlue.shade200,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
                    child: Text(
                      'Total Price: ${widget.total} ฿',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    elevation: 2.0,
                    color: Colors.white,
                    onPressed: () {
                      _quotation(context);
                    },
                    child: Text('Checkout'),
                  ),
                  Padding(padding: EdgeInsets.all(10.0))
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              )),
        ]));
  }

  _navigateAndDisplaySelection(BuildContext context, int index) async {
    final Selectmovie = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailScreen(movies: widget.movies[index])),
    );
    print(Selectmovie);
    if (Selectmovie != null)
      setState(() {
        widget.total += Selectmovie.price;
        widget.SelectMovies.add(Selectmovie);
      });
  }

  _quotation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QuotationScreen(widget.total, widget.SelectMovies)),
    );
    if (result)
      setState(() {
        widget.total = 0;
        widget.SelectMovies.clear();
      });
  }
}

class DetailScreen extends StatelessWidget {
  final Movie movies;

  DetailScreen({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
              child: Image.asset(
                movies.img,
                alignment: Alignment.center,
                width: 350.0,
                height: 350.0,
              )),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                movies.description,
                style: TextStyle(fontSize: 20),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, movies);
              },
              child: Text('Confirm'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text('Cancel'),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

class QuotationScreen extends StatelessWidget {
  final int total;
  List<Movie> SelectMovies;

  QuotationScreen(this.total, this.SelectMovies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your shopping cart'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: SelectMovies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(SelectMovies[index].img),
                      ),
                      title: Text(SelectMovies[index].title),
                      subtitle: Text(
                          'Price: ${SelectMovies[index].price.toString()}฿'),
                    );
                  })),
          ListTile(
            title: Text('Total: ${total}฿'),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('Confirm'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('Return'),
                ),
              )
            ],
          )
        ]));
  }
}
