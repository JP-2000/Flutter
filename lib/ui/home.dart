import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/questions.dart';
import 'package:flutter_projects/ui/movie.dart';


//9

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}
class _MoviesState extends State<Movies> {
  List movieList = Movie.getMovies();  //since it is static list it can be accesses elsewhere via class name in ewhich it is defined. *(getmovies() is a list)
  List moviesNames = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikings",
    "Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.3),
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
            return Stack(
                children: <Widget>[
                  movieCard(context, movieList[index]),
                  Positioned(
                    top: 15.0,
                    left: 3.0,
                    child: movieImage(movieList[index].images[0]),
                  ),
                ]
            );
//            return Card(
//              color: Colors.white,
//              elevation: 5.0,
//              child: ListTile(
//                leading: CircleAvatar(
//                  backgroundColor: Colors.black54,
//                  child: Container(
//                    width: 300,
//                    height: 300,
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                        image: NetworkImage(movieList[index].images[0]),
//                        fit: BoxFit.cover
//                      ),
//                      borderRadius: BorderRadius.circular(5 .0)
//                    ),
//                    child: null,
//                  ),
//                ),
//                title: Text(movieList[index].title),
//                subtitle: Text(movieList[index].title),
//                trailing: Text("..."),
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => MovieDetails(movieList[index].title, movieList[index])
//                      )
//                  );
//                },
////                onTap: () => debugPrint(movieList[index].title),
//              ),
//
//            );
          }
      ),
    );
  }
  Widget movieCard(BuildContext context, Movie movie) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 50.0),
        width: MediaQuery.of(context).size.width ,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0)
        ),
        child: Card(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.0125 ,
            right: MediaQuery.of(context).size.width * 0.0125 ,
            top: 10.0,
          ),
//        borderOnForeground: false,
          elevation: 10.0,
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0,
              bottom: 8.0,
              right: 8.0,
              left: 54.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        movie.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Text("Rating : ${movie.imdbRating} / 10", style: textStyle_1()),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Released: ${movie.released}", style: textStyle_1()),
                    Text(movie.runtime, style: textStyle_1()),
                    Text(movie.rated, style: textStyle_1())
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetails(movie.title, movie)
          )
        );
      }
    );
  }
  Widget movieImage(String image_url) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit: BoxFit.cover
        )
      ),
    );
  }

  TextStyle textStyle_1() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 10.0
    );
  }
}

class MovieDetails extends StatelessWidget {
  String movieName;
  Movie movie;
  MovieDetails(this.movieName, this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black54.withOpacity(0.8),
      ),
    body: ListView(
        children: <Widget> [
          MovieDetailsThumbnail(movie.images[0]),
          MovieDetailsHeaderWithPoster(movie),
          HorizontalLine(),
          MovieDetailsCast(movie),
          HorizontalLine(),
          MovieDetailsPictures(movie.images)
        ]
    ),



//      body: Container(
//        alignment: Alignment.center,
//        child: RaisedButton(
//          color: Colors.grey.withOpacity(0.2),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text(
//            "Go Back ${movie.director}",
//            style: TextStyle(
//              color: Colors.white,
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//        )
//   
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  String thumbnail;
  MovieDetailsThumbnail(this.thumbnail);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(
              Icons.play_circle_filled,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
        )
      ],

    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  Movie movie;
  MovieDetailsHeaderWithPoster(this.movie);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          MoviePoster(movie.images[0]),
          SizedBox(width: 10, height: 170),
          Expanded(
            child: MovieDetailsHeader(movie),
          )
        ]
      ),
    );
  }
}
class MoviePoster extends StatelessWidget {
  var borderRadius = BorderRadius.circular(8.0);
  String poster_url;
  MoviePoster(this.poster_url);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white.withOpacity(0.7),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 3.5,
          height: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster_url),
              fit: BoxFit.cover
            )
          ),
        )
      )
    );
  }
}
class MovieDetailsHeader extends StatelessWidget {
  Movie movie;
  MovieDetailsHeader(this.movie);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5.0),
        Text(
          "${movie.released} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          )
        ),
        SizedBox(height: 5.0),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black26.withOpacity(1.0),
          )
        ),
        SizedBox(height: 5.0),
        Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300
              ),
              children: <TextSpan>[
                TextSpan(
                  text: movie.plot
                ),
                TextSpan(
                  text: " \n More....",
                  style: TextStyle(
                    color: Colors.blue
                  )
                )
              ]
            )
        )
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  Movie movie;
  MovieDetailsCast(this.movie);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          MovieDetailsCastField("Director", movie.director),
          MovieDetailsCastField("Writer", movie.writer),
          MovieDetailsCastField("Actors", movie.actors),
          MovieDetailsCastField("Country", movie.country),
        ],
      ),
    );
  }
}
class MovieDetailsCastField extends StatelessWidget {
  String field;
  String value;
  MovieDetailsCastField(this.field, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$field : ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12
            ),
          ),
          Expanded(
            child: Text(
              "$value",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsPictures extends StatelessWidget {
  List images;
  MovieDetailsPictures(this.images);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.0),
          Text(
              "More Images: ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            )
          ),
          SizedBox(height: 5.0,),
          Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8.0,),
              itemCount: images.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//8

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  List quistionsList = [
    Questions.name("blehblehbleh", true),
    Questions.name("oof", false),
  ];
  SnackBar displaySnackBar(){
    return SnackBar(
      content: Text("oo yeah"),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.lightBlueAccent,
        title: Text("QUIZ"),
        centerTitle: true,
      ),
      body: Builder(  // inorder tp pass context to container for scaffold for more details see video 16.6
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(50.0),
                  child: Image.asset("images/nanjibhai.jpg"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 350.0,
                height: 250.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.cyan),
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: Text(
                  quistionsList[0].questionText,
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: (){
                  Scaffold.of(context).showSnackBar(displaySnackBar());
                  },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.cyan
                )
              ),
              Spacer(),
            ],
          ),
        ),
      )
    );
  }
}
//7

class TipCalc extends StatefulWidget {
  @override
  _TipCalcState createState() => _TipCalcState();
}
class _TipCalcState extends State<TipCalc> {
  double billAmount = 0.0;
  int personCounter = 1;
  int tipPercentage = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(14.5)
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Cost Per Person",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("\$${((billAmount + ((billAmount * tipPercentage) / 100)) / personCounter).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue.shade700
                      )
                    ),
                  )
                ],
              )
            ),
            Container(
              width: 350,
              height: 255,
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(14.5)
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.lightBlue),
                      decoration: InputDecoration(
                        labelText: "Enter Amount",
                        prefixIcon: Icon(Icons.monetization_on),
                      ),
                      onChanged: (String value) {
                        try{
                          billAmount = double.parse(value);
                        }catch(exception){
                          billAmount = 0.0;
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              setState(() {
                                if (personCounter > 1){
                                  personCounter--;
                                }
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(3.0)
                              ),
                              child: Text("-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue,
                                fontSize: 25.0
                              ),)
                            )
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 7.0, right: 7.0),
                              child: Text("$personCounter")),
                          InkWell(
                              onTap: (){
                                setState(() {
                                    personCounter++;
                                });
                              },
                              child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(3.0)
                                  ),
                                  child: Text("+",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue,
                                        fontSize: 25.0
                                    ),)
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tip",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),
                        ),
                        Text("\$${(billAmount * tipPercentage) / 100}",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    child: Text("$tipPercentage%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                      )
                    )
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    divisions: 10,

                    value: tipPercentage.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        tipPercentage = value.round();
                      });
                    },
                  )
                ],
              )

            )
          ],

          
        ),
      )
    );
  }
}
//6

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}
class _WisdomState extends State<Wisdom> {
  List quotes = ["click kr","abe click kr","abe click krna","hiten ","padu","hai","aise","mai","kyu","bolu"];
  int index = 0;
  void showQuote() {
    setState(() {
      index = index + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.5)
                ),
                child: Center(
                    child: Text(
                        quotes[index % quotes.length],
                        textAlign: TextAlign.center,
                    )
                )
            ),
            Divider(thickness: 1.3,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                  onPressed: showQuote,
                  color: Colors.lightBlue,
                  icon: Icon(Icons.bubble_chart),
                  label: Text("LeL"),
              ),
            )

          ]
        )
      )
    );
  }
}
//5

class BizCard extends StatelessWidget {
  Container _getAvatar() {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.pinkAccent, width: 0.2),
          image: DecorationImage(image: NetworkImage("https://pbs.twimg.com/media/EXPRgX3XkAAqc8Q.jpg"),
              fit: BoxFit.cover)
      ),
    );
  }
  Container _getcard() {
    return Container(
      width: 350,
      height : 200,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage("https://getmemetemplates.com/wp-content/uploads/2020/01/20200114_121814-1024x484.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Nanji Bhai", style: TextStyle(color: Colors.white)),
          Text("Shaitaan gali, Khatra Mahal, Andher \n      nagar, Shamshaan ke piche", style: TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.email),
              Text(" : nanjibhai6699@gmail.com", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.phone_paused),
              Text(" : 7864206969", style: TextStyle(color: Colors.white)),
            ],
          ),
          Text("")
        ],
      )

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("My Biz Card"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child : Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getcard(),
            _getAvatar()
          ]
        )

      )
    );
  }

}
//4

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Container(
          height: 20,
          alignment: Alignment.bottomCenter,
          child: Icon(Icons.home),)  );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text("Click me!")
      ),
    );
  }
}
//3

class ScaffoldExample extends StatelessWidget {
  iconbutton() {
    debugPrint("Flash_on pressed");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Bolo Tara Rara"),
            centerTitle: true,
            backgroundColor: Colors.lightBlueAccent,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () => debugPrint("ac_unit pressed")),
              IconButton(icon: Icon(Icons.flash_on), onPressed: iconbutton),

            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child: Icon(Icons.airplanemode_active),
          onPressed: () => debugPrint("Airplane btton pressed"),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon : Icon(Icons.accessible), title: Text("First")),
          BottomNavigationBarItem(icon : Icon(Icons.airline_seat_flat), title : Text("Second")),
          BottomNavigationBarItem(icon : Icon(Icons.accessible_forward), title: Text("third"))
        ], onTap: (int index) => debugPrint("${index} pressed"),),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton()
            ]
          ),
        ));
  }
}
//2

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            "Hajime Mashite",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
//1