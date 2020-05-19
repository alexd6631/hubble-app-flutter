// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HubblePicture extends HubblePicture {
  @override
  final String id;
  @override
  final String name;
  @override
  final String mission;

  factory _$HubblePicture([void Function(HubblePictureBuilder) updates]) =>
      (new HubblePictureBuilder()..update(updates)).build();

  _$HubblePicture._({this.id, this.name, this.mission}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('HubblePicture', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('HubblePicture', 'name');
    }
    if (mission == null) {
      throw new BuiltValueNullFieldError('HubblePicture', 'mission');
    }
  }

  @override
  HubblePicture rebuild(void Function(HubblePictureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HubblePictureBuilder toBuilder() => new HubblePictureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HubblePicture &&
        id == other.id &&
        name == other.name &&
        mission == other.mission;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), mission.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HubblePicture')
          ..add('id', id)
          ..add('name', name)
          ..add('mission', mission))
        .toString();
  }
}

class HubblePictureBuilder
    implements Builder<HubblePicture, HubblePictureBuilder> {
  _$HubblePicture _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _mission;
  String get mission => _$this._mission;
  set mission(String mission) => _$this._mission = mission;

  HubblePictureBuilder();

  HubblePictureBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _mission = _$v.mission;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HubblePicture other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HubblePicture;
  }

  @override
  void update(void Function(HubblePictureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HubblePicture build() {
    final _$result =
        _$v ?? new _$HubblePicture._(id: id, name: name, mission: mission);
    replace(_$result);
    return _$result;
  }
}

class _$HubblePictureDetails extends HubblePictureDetails {
  @override
  final String description;
  @override
  final String url;

  factory _$HubblePictureDetails(
          [void Function(HubblePictureDetailsBuilder) updates]) =>
      (new HubblePictureDetailsBuilder()..update(updates)).build();

  _$HubblePictureDetails._({this.description, this.url}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('HubblePictureDetails', 'url');
    }
  }

  @override
  HubblePictureDetails rebuild(
          void Function(HubblePictureDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HubblePictureDetailsBuilder toBuilder() =>
      new HubblePictureDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HubblePictureDetails &&
        description == other.description &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, description.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HubblePictureDetails')
          ..add('description', description)
          ..add('url', url))
        .toString();
  }
}

class HubblePictureDetailsBuilder
    implements Builder<HubblePictureDetails, HubblePictureDetailsBuilder> {
  _$HubblePictureDetails _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  HubblePictureDetailsBuilder();

  HubblePictureDetailsBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HubblePictureDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HubblePictureDetails;
  }

  @override
  void update(void Function(HubblePictureDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HubblePictureDetails build() {
    final _$result =
        _$v ?? new _$HubblePictureDetails._(description: description, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
