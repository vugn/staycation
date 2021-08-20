class HomeApi {
  final int travelers;
  final int treasure;
  final int cities;
  final List<MostPicked> mostPicked;
  final List<Category> category;

  HomeApi({
    required this.travelers,
    required this.treasure,
    required this.cities,
    required this.mostPicked,
    required this.category,
  });

  factory HomeApi.fromJson(Map<String, dynamic> json) {
    var mostPickedList = json['mostPicked'] as List;
    List<MostPicked> mostPicked =
        mostPickedList.map((i) => MostPicked.fromJson(i)).toList();
    var categoryList = json['category'] as List;
    List<Category> category =
        categoryList.map((i) => Category.fromJson(i)).toList();

    return HomeApi(
      travelers: json['hero']['travelers'],
      treasure: json['hero']['treasure'],
      cities: json['hero']['cities'],
      mostPicked: mostPicked,
      category: category,
    );
  }
}

class MostPicked {
  final String country;
  final String unit;
  final String id;
  final String title;
  final String city;
  final int price;
  final List<MostPickedImage> images;

  MostPicked({
    required this.country,
    required this.unit,
    required this.id,
    required this.title,
    required this.city,
    required this.price,
    required this.images,
  });

  factory MostPicked.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['imageId'] as List;
    List<MostPickedImage> images =
        list.map((i) => MostPickedImage.fromJson(i)).toList();

    return MostPicked(
      country: parsedJson['country'],
      unit: parsedJson['unit'],
      id: parsedJson['_id'],
      title: parsedJson['title'],
      city: parsedJson['city'],
      price: parsedJson['price'],
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['country'] = this.country;
    data['city'] = this.city;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}

class MostPickedImage {
  final String imageId;
  final String imageUrl;

  MostPickedImage({required this.imageId, required this.imageUrl});

  factory MostPickedImage.fromJson(Map<String, dynamic> parsedJson) {
    return MostPickedImage(
        imageId: parsedJson['_id'], imageUrl: parsedJson['imageUrl']);
  }
}

class Category {
  final String id;
  final String title;
  final List<CategoryItem> items;

  Category({
    required this.id,
    required this.title,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['itemId'] as List;
    List<CategoryItem> items =
        list.map((i) => CategoryItem.fromJson(i)).toList();

    return Category(
      id: parsedJson['_id'],
      title: parsedJson['name'],
      items: items,
    );
  }
}

class CategoryItem {
  final String country;
  final bool isPopular;
  final String id;
  final String title;
  final String city;
  final int price;
  final List<CategoryItemImage> images;

  CategoryItem({
    required this.country,
    required this.isPopular,
    required this.id,
    required this.title,
    required this.city,
    required this.price,
    required this.images,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['imageId'] as List;
    List<CategoryItemImage> images =
        list.map((i) => CategoryItemImage.fromJson(i)).toList();

    return CategoryItem(
      country: parsedJson['country'],
      isPopular: parsedJson['isPopular'],
      id: parsedJson['_id'],
      title: parsedJson['title'],
      city: parsedJson['city'],
      price: parsedJson['price'],
      images: images,
    );
  }
}

class CategoryItemImage {
  final String imageId;
  final String imageUrl;

  CategoryItemImage({required this.imageId, required this.imageUrl});

  factory CategoryItemImage.fromJson(Map<String, dynamic> parsedJson) {
    return CategoryItemImage(
        imageId: parsedJson['_id'], imageUrl: parsedJson['imageUrl']);
  }
}
