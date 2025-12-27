// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponse<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResponse<$T>()';
}


}

/// @nodoc
class $ApiResponseCopyWith<T,$Res>  {
$ApiResponseCopyWith(ApiResponse<T> _, $Res Function(ApiResponse<T>) __);
}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Success<T> value)?  success,TResult Function( Loading<T> value)?  loading,TResult Function( Failure<T> value)?  failure,TResult Function( None<T> value)?  none,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Loading() when loading != null:
return loading(_that);case Failure() when failure != null:
return failure(_that);case None() when none != null:
return none(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Success<T> value)  success,required TResult Function( Loading<T> value)  loading,required TResult Function( Failure<T> value)  failure,required TResult Function( None<T> value)  none,}){
final _that = this;
switch (_that) {
case Success():
return success(_that);case Loading():
return loading(_that);case Failure():
return failure(_that);case None():
return none(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Success<T> value)?  success,TResult? Function( Loading<T> value)?  loading,TResult? Function( Failure<T> value)?  failure,TResult? Function( None<T> value)?  none,}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Loading() when loading != null:
return loading(_that);case Failure() when failure != null:
return failure(_that);case None() when none != null:
return none(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T? data)?  success,TResult Function()?  loading,TResult Function( String code,  String message)?  failure,TResult Function()?  none,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.data);case Loading() when loading != null:
return loading();case Failure() when failure != null:
return failure(_that.code,_that.message);case None() when none != null:
return none();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T? data)  success,required TResult Function()  loading,required TResult Function( String code,  String message)  failure,required TResult Function()  none,}) {final _that = this;
switch (_that) {
case Success():
return success(_that.data);case Loading():
return loading();case Failure():
return failure(_that.code,_that.message);case None():
return none();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T? data)?  success,TResult? Function()?  loading,TResult? Function( String code,  String message)?  failure,TResult? Function()?  none,}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.data);case Loading() when loading != null:
return loading();case Failure() when failure != null:
return failure(_that.code,_that.message);case None() when none != null:
return none();case _:
  return null;

}
}

}

/// @nodoc


class Success<T> implements ApiResponse<T> {
  const Success(this.data);
  

 final  T? data;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponse<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class Loading<T> implements ApiResponse<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResponse<$T>.loading()';
}


}




/// @nodoc


class Failure<T> implements ApiResponse<T> {
  const Failure({this.code = "", this.message = "unknown"});
  

@JsonKey() final  String code;
@JsonKey() final  String message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ApiResponse<$T>.failure(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<T,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(Failure<T>(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class None<T> implements ApiResponse<T> {
  const None();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is None<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResponse<$T>.none()';
}


}




// dart format on
