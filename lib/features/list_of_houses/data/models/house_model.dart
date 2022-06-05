// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:test_work_elki/features/list_of_houses/domain/entitys/house_entity.dart';
part 'house_model.g.dart';

@JsonSerializable(anyMap: true)
class HouseModel extends HouseEntity {
  HouseModel(List<String>? images,
      {required id,
      required name,
      required description,
      required type,
      required rating,
      required review_count,
      required price})
      : super(
          images,
          id: id,
          name: name,
          description: description,
          type: type,
          rating: rating,
          review_count: review_count,
          price: price,
        );
  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);
}

