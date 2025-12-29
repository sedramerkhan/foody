// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Menu {

@JsonKey(name: 'menu_id') String get menuId;@JsonKey(name: 'restaurant_id') String get restaurantId;@JsonKey(name: 'item_name') String get itemName; String get description; double get price;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'availability_status') bool get availabilityStatus;
/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCopyWith<Menu> get copyWith => _$MenuCopyWithImpl<Menu>(this as Menu, _$identity);

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Menu&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuId,restaurantId,itemName,description,price,imageUrl,availabilityStatus);

@override
String toString() {
  return 'Menu(menuId: $menuId, restaurantId: $restaurantId, itemName: $itemName, description: $description, price: $price, imageUrl: $imageUrl, availabilityStatus: $availabilityStatus)';
}


}

/// @nodoc
abstract mixin class $MenuCopyWith<$Res>  {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) _then) = _$MenuCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'menu_id') String menuId,@JsonKey(name: 'restaurant_id') String restaurantId,@JsonKey(name: 'item_name') String itemName, String description, double price,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'availability_status') bool availabilityStatus
});




}
/// @nodoc
class _$MenuCopyWithImpl<$Res>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._self, this._then);

  final Menu _self;
  final $Res Function(Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuId = null,Object? restaurantId = null,Object? itemName = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? availabilityStatus = null,}) {
  return _then(_self.copyWith(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Menu].
extension MenuPatterns on Menu {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Menu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Menu value)  $default,){
final _that = this;
switch (_that) {
case _Menu():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Menu value)?  $default,){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_id')  String menuId, @JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'item_name')  String itemName,  String description,  double price, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'availability_status')  bool availabilityStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that.menuId,_that.restaurantId,_that.itemName,_that.description,_that.price,_that.imageUrl,_that.availabilityStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_id')  String menuId, @JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'item_name')  String itemName,  String description,  double price, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'availability_status')  bool availabilityStatus)  $default,) {final _that = this;
switch (_that) {
case _Menu():
return $default(_that.menuId,_that.restaurantId,_that.itemName,_that.description,_that.price,_that.imageUrl,_that.availabilityStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'menu_id')  String menuId, @JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'item_name')  String itemName,  String description,  double price, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'availability_status')  bool availabilityStatus)?  $default,) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that.menuId,_that.restaurantId,_that.itemName,_that.description,_that.price,_that.imageUrl,_that.availabilityStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Menu extends Menu {
   _Menu({@JsonKey(name: 'menu_id') required this.menuId, @JsonKey(name: 'restaurant_id') required this.restaurantId, @JsonKey(name: 'item_name') required this.itemName, required this.description, required this.price, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'availability_status') this.availabilityStatus = true}): super._();
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

@override@JsonKey(name: 'menu_id') final  String menuId;
@override@JsonKey(name: 'restaurant_id') final  String restaurantId;
@override@JsonKey(name: 'item_name') final  String itemName;
@override final  String description;
@override final  double price;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'availability_status') final  bool availabilityStatus;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCopyWith<_Menu> get copyWith => __$MenuCopyWithImpl<_Menu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Menu&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuId,restaurantId,itemName,description,price,imageUrl,availabilityStatus);

@override
String toString() {
  return 'Menu(menuId: $menuId, restaurantId: $restaurantId, itemName: $itemName, description: $description, price: $price, imageUrl: $imageUrl, availabilityStatus: $availabilityStatus)';
}


}

/// @nodoc
abstract mixin class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) _then) = __$MenuCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'menu_id') String menuId,@JsonKey(name: 'restaurant_id') String restaurantId,@JsonKey(name: 'item_name') String itemName, String description, double price,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'availability_status') bool availabilityStatus
});




}
/// @nodoc
class __$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(this._self, this._then);

  final _Menu _self;
  final $Res Function(_Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuId = null,Object? restaurantId = null,Object? itemName = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? availabilityStatus = null,}) {
  return _then(_Menu(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
