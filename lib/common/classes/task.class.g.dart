// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      name: json['name'] as String,
      priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'isComplete': instance.isComplete,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
