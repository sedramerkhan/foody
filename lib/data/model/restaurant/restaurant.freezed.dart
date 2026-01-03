// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Restaurant {

@JsonKey(name: 'restaurant_id') String get restaurantId;@JsonKey(name: 'name_ar') String get nameAr;@JsonKey(name: 'name_en') String get nameEn;@JsonKey(name: 'address_ar') String get addressAr;@JsonKey(name: 'address_en') String get addressEn; String get phone; double get rating;@JsonKey(name: 'cuisine_type_ar') String get cuisineTypeAr;@JsonKey(name: 'cuisine_type_en') String get cuisineTypeEn;@JsonKey(name: 'image_url') dynamic get imageUrl;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.addressAr, addressAr) || other.addressAr == addressAr)&&(identical(other.addressEn, addressEn) || other.addressEn == addressEn)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.cuisineTypeAr, cuisineTypeAr) || other.cuisineTypeAr == cuisineTypeAr)&&(identical(other.cuisineTypeEn, cuisineTypeEn) || other.cuisineTypeEn == cuisineTypeEn)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,nameAr,nameEn,addressAr,addressEn,phone,rating,cuisineTypeAr,cuisineTypeEn,const DeepCollectionEquality().hash(imageUrl));

@override
String toString() {
  return 'Restaurant(restaurantId: $restaurantId, nameAr: $nameAr, nameEn: $nameEn, addressAr: $addressAr, addressEn: $addressEn, phone: $phone, rating: $rating, cuisineTypeAr: $cuisineTypeAr, cuisineTypeEn: $cuisineTypeEn, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'restaurant_id') String restaurantId,@JsonKey(name: 'name_ar') String nameAr,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'address_ar') String addressAr,@JsonKey(name: 'address_en') String addressEn, String phone, double rating,@JsonKey(name: 'cuisine_type_ar') String cuisineTypeAr,@JsonKey(name: 'cuisine_type_en') String cuisineTypeEn,@JsonKey(name: 'image_url') dynamic imageUrl
});




}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? nameAr = null,Object? nameEn = null,Object? addressAr = null,Object? addressEn = null,Object? phone = null,Object? rating = null,Object? cuisineTypeAr = null,Object? cuisineTypeEn = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,addressAr: null == addressAr ? _self.addressAr : addressAr // ignore: cast_nullable_to_non_nullable
as String,addressEn: null == addressEn ? _self.addressEn : addressEn // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,cuisineTypeAr: null == cuisineTypeAr ? _self.cuisineTypeAr : cuisineTypeAr // ignore: cast_nullable_to_non_nullable
as String,cuisineTypeEn: null == cuisineTypeEn ? _self.cuisineTypeEn : cuisineTypeEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [Restaurant].
extension RestaurantPatterns on Restaurant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restaurant value)  $default,){
final _that = this;
switch (_that) {
case _Restaurant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restaurant value)?  $default,){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'name_ar')  String nameAr, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'address_ar')  String addressAr, @JsonKey(name: 'address_en')  String addressEn,  String phone,  double rating, @JsonKey(name: 'cuisine_type_ar')  String cuisineTypeAr, @JsonKey(name: 'cuisine_type_en')  String cuisineTypeEn, @JsonKey(name: 'image_url')  dynamic imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.restaurantId,_that.nameAr,_that.nameEn,_that.addressAr,_that.addressEn,_that.phone,_that.rating,_that.cuisineTypeAr,_that.cuisineTypeEn,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'name_ar')  String nameAr, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'address_ar')  String addressAr, @JsonKey(name: 'address_en')  String addressEn,  String phone,  double rating, @JsonKey(name: 'cuisine_type_ar')  String cuisineTypeAr, @JsonKey(name: 'cuisine_type_en')  String cuisineTypeEn, @JsonKey(name: 'image_url')  dynamic imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.restaurantId,_that.nameAr,_that.nameEn,_that.addressAr,_that.addressEn,_that.phone,_that.rating,_that.cuisineTypeAr,_that.cuisineTypeEn,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'restaurant_id')  String restaurantId, @JsonKey(name: 'name_ar')  String nameAr, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'address_ar')  String addressAr, @JsonKey(name: 'address_en')  String addressEn,  String phone,  double rating, @JsonKey(name: 'cuisine_type_ar')  String cuisineTypeAr, @JsonKey(name: 'cuisine_type_en')  String cuisineTypeEn, @JsonKey(name: 'image_url')  dynamic imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.restaurantId,_that.nameAr,_that.nameEn,_that.addressAr,_that.addressEn,_that.phone,_that.rating,_that.cuisineTypeAr,_that.cuisineTypeEn,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant extends Restaurant {
   _Restaurant({@JsonKey(name: 'restaurant_id') required this.restaurantId, @JsonKey(name: 'name_ar') required this.nameAr, @JsonKey(name: 'name_en') required this.nameEn, @JsonKey(name: 'address_ar') required this.addressAr, @JsonKey(name: 'address_en') required this.addressEn, required this.phone, required this.rating, @JsonKey(name: 'cuisine_type_ar') required this.cuisineTypeAr, @JsonKey(name: 'cuisine_type_en') required this.cuisineTypeEn, @JsonKey(name: 'image_url') required this.imageUrl}): super._();
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override@JsonKey(name: 'restaurant_id') final  String restaurantId;
@override@JsonKey(name: 'name_ar') final  String nameAr;
@override@JsonKey(name: 'name_en') final  String nameEn;
@override@JsonKey(name: 'address_ar') final  String addressAr;
@override@JsonKey(name: 'address_en') final  String addressEn;
@override final  String phone;
@override final  double rating;
@override@JsonKey(name: 'cuisine_type_ar') final  String cuisineTypeAr;
@override@JsonKey(name: 'cuisine_type_en') final  String cuisineTypeEn;
@override@JsonKey(name: 'image_url') final  dynamic imageUrl;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantCopyWith<_Restaurant> get copyWith => __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.addressAr, addressAr) || other.addressAr == addressAr)&&(identical(other.addressEn, addressEn) || other.addressEn == addressEn)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.cuisineTypeAr, cuisineTypeAr) || other.cuisineTypeAr == cuisineTypeAr)&&(identical(other.cuisineTypeEn, cuisineTypeEn) || other.cuisineTypeEn == cuisineTypeEn)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,nameAr,nameEn,addressAr,addressEn,phone,rating,cuisineTypeAr,cuisineTypeEn,const DeepCollectionEquality().hash(imageUrl));

@override
String toString() {
  return 'Restaurant(restaurantId: $restaurantId, nameAr: $nameAr, nameEn: $nameEn, addressAr: $addressAr, addressEn: $addressEn, phone: $phone, rating: $rating, cuisineTypeAr: $cuisineTypeAr, cuisineTypeEn: $cuisineTypeEn, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'restaurant_id') String restaurantId,@JsonKey(name: 'name_ar') String nameAr,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'address_ar') String addressAr,@JsonKey(name: 'address_en') String addressEn, String phone, double rating,@JsonKey(name: 'cuisine_type_ar') String cuisineTypeAr,@JsonKey(name: 'cuisine_type_en') String cuisineTypeEn,@JsonKey(name: 'image_url') dynamic imageUrl
});




}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? nameAr = null,Object? nameEn = null,Object? addressAr = null,Object? addressEn = null,Object? phone = null,Object? rating = null,Object? cuisineTypeAr = null,Object? cuisineTypeEn = null,Object? imageUrl = freezed,}) {
  return _then(_Restaurant(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,nameAr: null == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,addressAr: null == addressAr ? _self.addressAr : addressAr // ignore: cast_nullable_to_non_nullable
as String,addressEn: null == addressEn ? _self.addressEn : addressEn // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,cuisineTypeAr: null == cuisineTypeAr ? _self.cuisineTypeAr : cuisineTypeAr // ignore: cast_nullable_to_non_nullable
as String,cuisineTypeEn: null == cuisineTypeEn ? _self.cuisineTypeEn : cuisineTypeEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
