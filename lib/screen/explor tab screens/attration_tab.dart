import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tourist_helper/provider/model/nearby_model.dart';

class AttractionTab extends StatelessWidget {
  final List<Nearby> nearBy;
  AttractionTab(this.nearBy);

  lauchMap(String lat, lng, place) async {
    final avilableMap = await MapLauncher.installedMaps;
    await avilableMap.first.showMarker(
        coords: Coords(double.parse(lat), double.parse(lng)), title: place);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: nearBy == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 50,
                  ),
                  Text("No Data Available!"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: nearBy.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: nearBy[index].nearbyCat,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Container(
                          width: double.infinity,
                          color: Colors.black87,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nearBy[index].nearbyName,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.navigation,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    lauchMap(
                                        nearBy[index].nearbyLat,
                                        nearBy[index].nearbyLog,
                                        nearBy[index].nearbyName);
                                  })
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
