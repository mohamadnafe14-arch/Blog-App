// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogModelAdapter extends TypeAdapter<BlogModel> {
  @override
  final int typeId = 0;

  @override
  BlogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogModel(
      id: fields[0] as String,
      updatedAt: fields[1] as DateTime,
      title: fields[2] as String,
      posterId: fields[3] as String,
      content: fields[4] as String,
      imageUrl: fields[5] as String,
      topics: (fields[6] as List).cast<String>(),
      name: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BlogModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.posterId)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.topics)
      ..writeByte(7)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
