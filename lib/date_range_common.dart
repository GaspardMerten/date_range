library date_range;

/// This class allows to store two [DateTime], you can be sure that the start date will
/// always be <= the last date! (This is very important when using Flutter date time picker or the
/// Flutter package DateTimeModalPicker which is using this class.
///
/// You can use the default constructor () or one of the factories:
///   - lastWeek, lastMonth, pastSevenDays, pastTwentyHeightDays
class DateRange {
  final DateTime start;
  final DateTime end;

  /// Private constructor used by the factory constructors.
  const DateRange._(this.start, this.end);

  factory DateRange(DateTime _start, DateTime _end) {
    assert(_start != null && _end != null,
        'One or both of the provided dates are null');
    assert(_start.isBefore(_end) || _start.isAtSameMomentAs(_end),
        'Start date can not be after end date');

    return DateRange._(_start, _end);
  }

  /// Returns a [DateRange] object containing last week period
  factory DateRange.lastWeek() {
    DateTime _startDate =
        removeDateDetails(DateTime.now().subtract(const Duration(days: 7)));

    while (_startDate.weekday != DateTime.monday) {
      _startDate = _startDate.subtract(Duration(days: 1));
    }

    return DateRange(_startDate, _startDate.add(Duration(days: 6)));
  }

  /// Returns a [DateRange] object containing the past 7 days period
  factory DateRange.pastSevenDays() {
    final DateTime _startDate =
        removeDateDetails(DateTime.now().subtract(const Duration(days: 7)));

    return DateRange(_startDate, _startDate.add(Duration(days: 6)));
  }

  /// Returns a [DateRange] object containing last month period
  factory DateRange.lastMonth() {
    DateTime _startDate = removeDateDetails(DateTime.now());

    _startDate = DateTime(_startDate.year, _startDate.month - 1, 1);

    return DateRange(
        _startDate,
        DateTime(_startDate.year, _startDate.month + 1, 1)
            .subtract(const Duration(days: 1)));
  }

  /// Returns a [DateRange] object containing the past 28 days period
  factory DateRange.pastTwentyHeightDays() {
    final DateTime _startDate =
        removeDateDetails(DateTime.now().subtract(const Duration(days: 28)));

    return DateRange(_startDate, _startDate.add(const Duration(days: 27)));
  }

  /// Returns a [DateTime] with no value set for hours, minutes, seconds, ...!
  static DateTime removeDateDetails(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  /// Returns a [Duration] object containing the difference between the start and end date.
  Duration getDuration() => end.difference(start);

  /// Overrides the default toString method and returns both dates toString values!
  @override
  String toString() {
    return '$start $end';
  }
}
