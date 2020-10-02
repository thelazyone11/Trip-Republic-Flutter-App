class Hotel {
  Hotel({
    this.hotelImg,
    this.hotelName,
    this.hotelRate,
  });

  String hotelImg;
  String hotelName;
  String hotelRate;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelImg: json["hotelImg"],
        hotelName: json["hotelName"],
        hotelRate: json["hotelRate"],
      );

  Map<String, dynamic> toJson() => {
        "hotelImg": hotelImg,
        "hotelName": hotelName,
        "hotelRate": hotelRate,
      };
}
