class Product{
  String name;
  int id;
  String description;
  String price;
  String image;

  Product({this.name, this.id, this.description, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}