class ExamAppointment {
  final String id;
  final String examName;
  final DateTime? date;

  ExamAppointment({
    required this.id,
    required this.examName,
    this.date,
  });
}