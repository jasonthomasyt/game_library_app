import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  factory Game({
    int? id,
    @JsonKey(name: 'name') String? title,
    @JsonKey(name: 'background_image') String? thumbnail,
    String? description,
    @JsonKey(name: 'metacritic') int? metacriticScore,
  }) = _Game;
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
