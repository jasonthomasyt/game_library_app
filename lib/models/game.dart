import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  factory Game({int? id, String? name, String? image}) = _Game;
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
