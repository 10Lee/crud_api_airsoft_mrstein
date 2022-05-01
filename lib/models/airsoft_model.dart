class AirsoftModel {
  late int id;
  late String name;
  late String description;
  late int price;
  late String photo;

  AirsoftModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
  });

  AirsoftModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    // price = int.parse(map['price'].toString());
    price = map['price'];
    photo = map['photo'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'photo': photo,
      };
}
