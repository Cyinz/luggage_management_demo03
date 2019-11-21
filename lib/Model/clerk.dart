class ClerkModel {
  String username;
  String img;
  String hotel;

  ClerkModel({this.username, this.img, this.hotel});

  ClerkModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    img = json['img'];
    hotel = json['hotel'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['img'] = this.img;
    data['hotel'] = this.hotel;
    return data;
  }
}