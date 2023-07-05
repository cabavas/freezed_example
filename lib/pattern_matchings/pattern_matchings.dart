import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matchings.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

void main() {
  // var union = Union(1);
  var union = Union.loading();

  /*
    when
    maybeWhen
    map
    maybeMap
   */

  var message = union.when<String>(
    (value) => 'Union Data implemented',
    loading: () => 'Loading implemented',
    error: (String? message) => 'Error implemented',
  );

  var messageMaybe = union.maybeWhen(
    null,
    error: (String? message) => 'Error implemented',
    orElse: () => 'Pattern implemented',
  );

  var messageMap = union.map(
    (UnionData value) => '${value.runtimeType} implemented',
    error: (UnionError error) => '${error.message.runtimeType} implemented',
    loading: (UnionLoading loading) => '${loading.runtimeType} implemented',
  );

  print(message);
  print(messageMaybe);
  print(messageMap);
}
