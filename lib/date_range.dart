library date_range;


class DateRange {
  final DateTime start;
  final DateTime end;

  const DateRange._(this.start, this.end);

  factory DateRange(DateTime _start, DateTime _end) {
    assert(_start != null && _end != null, 'One or both of the provided dates are null');
    assert(_start.isBefore(_end) || _start.isAtSameMomentAs(_end), 'Start date can not be after end date');

    return DateRange._(_start, _end);
  }

  factory DateRange.lastWeek() {
    DateTime _startDate = removeDateDetails(DateTime.now().subtract(const Duration(days: 7)));

    while (_startDate.weekday != DateTime.monday) {
      _startDate = _startDate.subtract(Duration(days: 1));
    }

    return DateRange(_startDate, _startDate.add(Duration(days: 6)));
  }

  factory DateRange.pastSevenDays() {
    final DateTime _startDate = removeDateDetails(DateTime.now().subtract(const Duration(days: 7)));

    return DateRange(_startDate, _startDate.add(Duration(days: 6)));
  }

  factory DateRange.lastMonth() {
    DateTime _startDate = removeDateDetails(DateTime.now());

    _startDate = DateTime(_startDate.year, _startDate.month - 1, 1);

    return DateRange(_startDate, DateTime(_startDate.year, _startDate.month + 1, 1).subtract(const Duration(days: 1)));
  }

  factory DateRange.pastTwentyHeightDays() {
    final DateTime _startDate = removeDateDetails(DateTime.now().subtract(const Duration(days: 28)));

    return DateRange(_startDate, _startDate.add(const Duration(days: 27)));
  }

  static DateTime removeDateDetails(DateTime dateTime) => DateTime(dateTime.year, dateTime.month, dateTime.day);

  Duration getDuration() => start.difference(end);

  @override
  String toString() {
    return '$start $end';
  }
}

