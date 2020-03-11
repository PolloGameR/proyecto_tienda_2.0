class Product {
  String id;
  int price;
  String name;
  String img;
  String talla;
  String categoria;


  Product({this.id, this.price, this.name,this.img});

  Product.fromMap(Map snapshot,String id) :
        id = id ?? '',
        price = snapshot['precio'] ?? '',
        name = snapshot['nombre'] ?? '',
        img = snapshot['cantidad'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "img": img,
    };
  }
}