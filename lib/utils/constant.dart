import 'package:wallpaper/models/categorie.dart';

List<Categorie> getInitCategories() {
  List<Categorie> _categories = new List();
  Categorie categorieModel = new Categorie(
      imgUrl:
          "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categorieName: "Street Art");

  _categories.add(categorieModel);

  categorieModel = new Categorie(
      imgUrl:
          "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categorieName: "Wild Life");

  _categories.add(categorieModel);
  categorieModel = new Categorie(
      imgUrl:
          "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categorieName: "Nature");

  _categories.add(categorieModel);
  categorieModel = new Categorie(
      imgUrl:
          "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categorieName: "City");

  _categories.add(categorieModel);
  categorieModel = new Categorie(
      imgUrl:
          "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      categorieName: "Motivation");

  _categories.add(categorieModel);
  return _categories;
}
