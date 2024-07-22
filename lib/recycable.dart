const double textSmall = 20;
const double textMedium = 50;
const double textLarge = 80;

// List Of Elements of Students
final studentEmil = <String>[
  'Emil',
  'Hillebrand',
  'Falkenstraße',
  '20',
  '28215',
  'Bremen',
  'Basketball',
  'Handball',
  'Brettspiele'
];
final studentEmil2 = <String>[
  'Gritta',
  'Musterfrau',
  'Wiesenstraße',
  '8',
  '28217',
  'Bremen',
  'Basketball',
  'Handball',
  'Brettspiele'
];
final students = <List>[studentEmil, studentEmil2];

List getStudent(int index) {
  return students[index];
}

void setStudent(List<String> student) {
  students.add(student);
}

int getStudentIndex() {
  return students.length;
}

String getStudentName(int index) {
  String studentname = ('${students[index][0]} ${students[index][1]}');
  return studentname;
}
