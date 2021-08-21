class DetailApi {
  final String id;
  final String categoryId;
  final String title;
  final String country;
  final String city;
  final String description;
  final bool isPopular;
  final int price;
  final int sumBooking;
  final List<DetailImage> images;
  final List<DetailFeature> features;
  final List<DetailActivity> activities;
  final List<DetailBank> banks;

  DetailApi({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.country,
    required this.city,
    required this.description,
    required this.isPopular,
    required this.price,
    required this.sumBooking,
    required this.images,
    required this.features,
    required this.activities,
    required this.banks,
  });

  factory DetailApi.fromJson(Map<String, dynamic> json) {
    var imagesList = json['imageId'] as List;
    List<DetailImage> images =
        imagesList.map((i) => DetailImage.fromJson(i)).toList();
    var featureList = json['featureId'] as List;
    List<DetailFeature> features =
        featureList.map((i) => DetailFeature.fromJson(i)).toList();
    var activitiesList = json['activityId'] as List;
    List<DetailActivity> activities =
        activitiesList.map((i) => DetailActivity.fromJson(i)).toList();
    var banksList = json['bank'] as List;
    List<DetailBank> banks =
        banksList.map((i) => DetailBank.fromJson(i)).toList();

    return DetailApi(
      id: json['_id'],
      categoryId: json['categoryId'],
      title: json['title'],
      country: json['country'],
      city: json['city'],
      description: json['description'],
      isPopular: json['isPopular'],
      price: json['price'],
      sumBooking: json['sumBooking'],
      images: images,
      features: features,
      activities: activities,
      banks: banks,
    );
  }
}

class DetailImage {
  final String imageId;
  final String imageUrl;

  DetailImage({required this.imageId, required this.imageUrl});

  factory DetailImage.fromJson(Map<String, dynamic> json) {
    return DetailImage(imageId: json['_id'], imageUrl: json['imageUrl']);
  }
}

class DetailActivity {
  final String imageId;
  final String imageUrl;
  final String name;
  final String type;

  DetailActivity(
      {required this.imageId,
      required this.imageUrl,
      required this.name,
      required this.type});

  factory DetailActivity.fromJson(Map<String, dynamic> json) {
    return DetailActivity(
        imageId: json['_id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        type: json['type']);
  }
}

class DetailFeature {
  final String imageId;
  final String imageUrl;
  final String name;
  final int qty;

  DetailFeature(
      {required this.imageId,
      required this.imageUrl,
      required this.name,
      required this.qty});

  factory DetailFeature.fromJson(Map<String, dynamic> json) {
    return DetailFeature(
        imageId: json['_id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        qty: json['qty']);
  }
}

class DetailBank {
  final String imageId;
  final String imageUrl;
  final String name;
  final String bankNumber;
  final String bankName;

  DetailBank({
    required this.imageId,
    required this.imageUrl,
    required this.name,
    required this.bankNumber,
    required this.bankName,
  });

  factory DetailBank.fromJson(Map<String, dynamic> json) {
    return DetailBank(
      imageId: json['_id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      bankNumber: json['nomorRekening'],
      bankName: json['nameBank'],
    );
  }
}
