import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildBody(size),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
        )
      ],
    );
  }

  SingleChildScrollView _buildBody(Size size) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
        child: Column(
          children: [
            _buildTopMenu(),
            _buildText(),
            _buildSearch(),
            _buildCategories(),
            _buildScrollCards(size),
          ],
        ),
      ),
    );
  }

  Container _buildScrollCards(Size size) {
    return Container(
      height: size.height * .4,
      color: Colors.white,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _buildCardField(size);
        },
      ),
    );
  }

  Container _buildCardField(Size size) {
    return Container(
      width: size.width * .4,
      height: size.height * .4,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildImageField(size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ImmunoDerm",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Zinc 10mg",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("\$23,50",style: TextStyle(fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue.shade800,
                  child: Icon(
                    Icons.wallet_giftcard,
                    size: 16,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildImageField(Size size) {
    return Container(
      child: ClipRRect(
        child: Image.asset(
          "assets/images/masaüstü.jpg",
          height: size.height * .15,
          width: size.width * .15,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(top: size.height * .03),
    );
  }

  Row _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Bone",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Diet",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Energy",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Liver",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            "Diabet",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Padding _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buildSearchField(), _buildSearchButton()],
      ),
    );
  }

  Container _buildSearchButton() {
    var size=MediaQuery.of(context).size;;
    return Container(
      height: size.height * .075,
      width: size.width * .12,
      child: Icon(Icons.menu),
      decoration: BoxDecoration(
          color: Colors.blue.shade800,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(16, 16))),
    );
  }

  Container _buildSearchField() {
    return Container(
      width: 250,
      alignment: Alignment.centerLeft,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          fillColor: Colors.grey.shade100,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Column _buildText() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8, 20, 20, 5),
          alignment: Alignment.centerLeft,
          child: Text(
            "The product",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(8, 0, 20, 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "you really need",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        )
      ],
    );
  }

  Row _buildTopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLeftTopMenu(),
        _buildRightTopMenu(),
      ],
    );
  }

  Container _buildRightTopMenu() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/masaüstü.jpg")),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
    );
  }

  Container _buildLeftTopMenu() {
    return Container(
      height: 40,
      width: 40,
      child: Icon(Icons.menu),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(16, 16))),
    );
  }
}
