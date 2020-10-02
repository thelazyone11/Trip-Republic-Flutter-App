import 'package:flutter/material.dart';
import 'package:tourist_helper/screen/place_detail_screen.dart';

final List<TripStates> stateList = [
  TripStates(
      stateName: 'Maharashtra',
      stateImg:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Mumbai_Train_Station.jpg/1024px-Mumbai_Train_Station.jpg'),
  TripStates(
      stateName: 'Kerala',
      stateImg:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/The_View_of_the_Athirapally_Falls_during_the_onset_of_Monsoon.jpg/800px-The_View_of_the_Athirapally_Falls_during_the_onset_of_Monsoon.jpg'),
  TripStates(
    stateImg:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/62_Fatehpur_Sikr%C3%AD_11.jpg/1024px-62_Fatehpur_Sikr%C3%AD_11.jpg',
    stateName: 'Utter Pradesh',
  ),
  TripStates(
      stateName: 'Rajasthan',
      stateImg:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Thar_Khuri.jpg/1024px-Thar_Khuri.jpg'),
  TripStates(
      stateName: 'Delhi',
      stateImg:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Delhi_Red_fort.jpg/1024px-Delhi_Red_fort.jpg')
];

class HomeCardViewCirculer extends StatelessWidget {
  final String categoryName;

  HomeCardViewCirculer({this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              // InkWell(
              //     onTap: () {
              //       Navigator.of(context).pushNamed(SeeAllScreen.routeName);
              //     },
              //     child: Text("See all"))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(PlaceDetailScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(stateList[index].stateImg),
                  )),
                ),
              );
            },
            itemCount: stateList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class TripStates {
  final String stateName;
  final String stateImg;

  TripStates({this.stateName, this.stateImg});
}
