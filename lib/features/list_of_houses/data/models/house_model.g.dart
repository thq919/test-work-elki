// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map json) => HouseModel(
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      rating: json['rating'],
      review_count: json['review_count'],
      price: json['price'],
    );

