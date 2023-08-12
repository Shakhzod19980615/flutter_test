class Product{
  final String name;
  final String category;

  Product({
    required this.name,
    required this.category
});
}
String text="";
final List<Product> productList = [
  Product(name: "Sandwich", category: "Favourites"),
  Product(name: "Fish", category: "Favourites"),
  Product(name: "Vegetables", category: "Favourites"),
  Product(name: "Drinks", category: "Clubs"),
  Product(name: "Friends", category: "Clubs"),
  Product(name: "Dream Club", category: "Clubs"),
  Product(name: "Youth Club", category: "Clubs"),
  Product(name: "Central AuqaPark", category: "Aquaparks"),
  Product(name: "Western AuqaPark", category: "Aquaparks"),
  Product(name: "Eastern AuqaPark", category: "Aquaparks"),
  Product(name: "Southern AuqaPark", category: "Aquaparks"),
  Product(name: "Northern AuqaPark", category: "Aquaparks"),
  Product(name: "Merhaba", category: "Restaurants"),
  Product(name: "Kebab", category: "Restaurants"),
  Product(name: "Subway sandwichs", category: "Restaurants"),
  Product(name: "KFC", category: "Restaurants"),
  Product(name: "Salam", category: "Hookah"),
  Product(name: "Smile", category: "Hookah"),
  Product(name: "Night", category: "Hookah"),
];