class Event {
  String id;
  String Name;
  String Owner;
  String Time;
  int People;
  String Date;
  String Location;
  bool isFull;
  List members;

  Event({
    required this.id,
    required this.Name,
    required this.Owner,
    required this.Time,
    required this.People,
    required this.Date,
    required this.Location,
    required this.isFull,
    required this.members,
  });
}
