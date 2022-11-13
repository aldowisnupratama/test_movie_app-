// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<MovieTable> {
  @override
  final int typeId = 1;

  @override
  MovieTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieTable(
      id: fields[0] as int,
      isFavorite: fields[1] as bool,
      popularity: fields[2] as double,
      posterPath: fields[3] as String,
      releaseDate: fields[4] as String,
      title: fields[5] as String,
      voteAverage: fields[6] as double?,
      overview: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieTable obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isFavorite)
      ..writeByte(2)
      ..write(obj.popularity)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
