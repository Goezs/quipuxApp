class Grade {
  final String teacherName;
  final DateTime day;
  final int grade;

  const Grade({
    required this.teacherName,
    required this.day,
    required this.grade,
  });

  Grade copy({
    String? teacherName,
    DateTime? day,
    int? grade,
  }) =>
      Grade(
        teacherName: teacherName ?? this.teacherName,
        day: day ?? this.day,
        grade: grade?? this.grade,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Grade &&
          runtimeType == other.runtimeType &&
          teacherName == other.day &&
          day == other.day &&
          grade == other.grade;

  @override
  int get hashCode => teacherName.hashCode ^ day.hashCode ^ grade.hashCode;
}

final allGrades = <Grade>[
  Grade(teacherName: 'Fernando Gonsalez', day: DateTime(2023, 9, 23), grade: 3),
  Grade(teacherName: 'Andrés Viñedo', day: DateTime(2023, 9, 30), grade: 4),
  Grade(teacherName: 'Samuel Herrera', day: DateTime(2023, 10, 7), grade: 5),
  Grade(teacherName: 'Juan Salazar', day: DateTime(2023, 10, 14), grade: 2),
  Grade(teacherName: 'Manolo Zuluaga', day: DateTime(2023, 10, 21), grade: 3),
  Grade(teacherName: 'David Ospina', day: DateTime(2023, 10, 28), grade: 5),
  Grade(teacherName: 'Hernesto Valle', day: DateTime(2023, 10, 4), grade: 4),
];