import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "home_model.g.dart";

@JsonSerializable()
class HomeModel extends Equatable {
  final int? wpId;
  final int? backgroundTask;
  final String? status;
  final dynamic error;
  final int? productId;
  final Data? data;

  const HomeModel(
      {this.wpId, this.backgroundTask, this.status, this.error, this.productId, this.data});

  fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  @override
  List<Object?> get props => [wpId, backgroundTask, status, error, productId, data];
}

@JsonSerializable()
class Data extends Equatable {
  final String? website;
  final String? brandLogo;
  final String? productUrl;
  final String? productName;
  final List<ProductColors>? productColors;
  final List<ProductSizes>? productSizes;
  final List<String>? productCategory;

  const Data(
      {this.website,
      this.brandLogo,
      this.productUrl,
      this.productName,
      this.productColors,
      this.productSizes,
      this.productCategory});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props =>
      [website, brandLogo, productUrl, productName, productColors, productSizes, productCategory];
}

@JsonSerializable()
class ProductColors extends Equatable {
  final String? color;
  final String? originalImage;
  final String? available;
  final bool? active;
  final String? url;
  final String? image;

  const ProductColors(
      {this.color, this.originalImage, this.available, this.active, this.url, this.image});

  factory ProductColors.fromJson(Map<String, dynamic> json) => _$ProductColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorsToJson(this);

  @override
  List<Object?> get props => [color, originalImage, available, active, url, image];
}

@JsonSerializable()
class ProductSizes extends Equatable {
  final String? size;
  final double? price;
  final String? available;

  const ProductSizes({this.size, this.price, this.available});

  factory ProductSizes.fromJson(Map<String, dynamic> json) => _$ProductSizesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSizesToJson(this);

  @override
  List<Object?> get props => [size, price, available];
}
