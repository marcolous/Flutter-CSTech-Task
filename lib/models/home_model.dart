class HomeModel {
  final int status;
  final Data data;

  HomeModel({
    required this.status,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'] ?? 0,
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  final List<Banner> bannerOne;
  final List<Category> category;
  final List<Product> products;

  Data({
    required this.bannerOne,
    required this.category,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      bannerOne: (json['banner_one'] as List<dynamic>?)
              ?.map((e) => Banner.fromJson(e))
              .toList() ??
          [],
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Banner {
  final String banner;

  Banner({
    required this.banner,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      banner: json['banner'] ?? '',
    );
  }
}

class Category {
  final String label;
  final String icon;

  Category({
    required this.label,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}

class Product {
  final String icon;
  final String offer;
  final String label;
  final String subLabel;

  Product({
    required this.icon,
    required this.offer,
    required this.label,
    required this.subLabel,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'] ?? '',
      offer: json['offer'] ?? '',
      label: json['label'] ?? '',
      subLabel: json['SubLabel'] ?? json['Sublabel'] ?? '',
    );
  }
}
