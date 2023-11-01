import 'package:flutter/material.dart';
import 'package:quipux_app/model/grades.dart';

class SortableTable extends StatefulWidget {
  @override
  _SortableTableState createState() => _SortableTableState();
}

class _SortableTableState extends State<SortableTable> {
  late List<Grade> grades;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    grades = List.of(allGrades);
  }

  @override
  Widget build(BuildContext context){ 
    return buildDataTable();
  }

  Widget buildDataTable() {
    final columns = ['Profesor', 'Fecha', 'Nota'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(grades),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Grade> grades) => grades.map((Grade grade) {
        final cells = [grade.teacherName, grade.day, grade.grade];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      grades.sort((grade1, grade2) =>
          compareString(ascending, grade1.teacherName, grade2.teacherName));
    } else if (columnIndex == 1) {
      grades.sort((grade1, grade2) =>
          compareString(ascending, '$grade1.day', '$grade2.day'));
    } else if (columnIndex == 2) {
      grades.sort((grade1, grade2) =>
          compareString(ascending, '${grade1.grade}', '${grade2.grade}'));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
    ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}