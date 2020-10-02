import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/screen/place_detail_screen.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<Destination> _searchedList = [];

  TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void search() {
    setState(() {
      if (_searchController.text == '') {
        _searchedList = [];
      } else {
        _searchedList = Provider.of<Places>(context, listen: false)
            .search(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              color: darkModeOn ? const Color(0xff121212) : Colors.white,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 50,
                          width: 250,
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            onChanged: (value) {
                              search();
                            },
                            controller: _searchController,
                            onSubmitted: (value) {
                              search();
                            },
                            decoration: InputDecoration(
                              labelText: 'Search',
                            ),
                          )),
                      Container(
                          color: Colors.grey[800],
                          height: 50,
                          width: 50,
                          child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                search();
                              }))
                    ],
                  ),
                ],
              ),
            ),
            _searchedList.isEmpty
                ? SizedBox()
                : Container(
                    color: darkModeOn ? Color(0xff121212) : Colors.white,
                    height: 50 * double.parse(_searchedList.length.toString()),
                    width: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _searchedList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              PlaceDetailScreen.routeName,
                              arguments: _searchedList[index].placeName),
                          child: Container(
                            height: 50,
                            width: 300,
                            color:
                                darkModeOn ? Color(0xff121212) : Colors.white,
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _searchedList[index].placeName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
