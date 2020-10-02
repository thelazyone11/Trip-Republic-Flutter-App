class Nearby {
  Nearby({
    this.nearbyCat,
    this.nearbyDetail,
    this.nearbyLat,
    this.nearbyLog,
    this.nearbyName,
  });

  String nearbyCat;
  String nearbyDetail;
  String nearbyLat;
  String nearbyLog;
  String nearbyName;

  factory Nearby.fromJson(Map<String, dynamic> json) => Nearby(
        nearbyCat: json["nearbyCat"],
        nearbyDetail: json["nearbyDetail"],
        nearbyLat: json["nearbyLat"],
        nearbyLog: json["nearbyLog"],
        nearbyName: json["nearbyName"],
      );

  Map<String, dynamic> toJson() => {
        "nearbyCat": nearbyCat,
        "nearbyDetail": nearbyDetail,
        "nearbyLat": nearbyLat,
        "nearbyLog": nearbyLog,
        "nearbyName": nearbyName,
      };
}
