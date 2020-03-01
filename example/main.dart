import 'package:date_range_common/date_range_common.dart';

void main() {
  /// Returns DateRange containing last week period
  DateRange.lastWeek();

  /// Returns DateRange containing last month period
  DateRange.lastMonth();

  /// Returns DateRange containing the past 7 days
  DateRange.pastSevenDays();

  /// Returns DateRange containing the past 28 days
  DateRange.pastTwentyHeightDays();

  /// This will work perfectly fine
  final DateRange customRange =
      DateRange(DateTime.now(), DateTime.now().add(Duration(days: 5)));

  /// And you can get the duration between both date with:
  customRange.getDuration();

  /// This will throw an error because the last date must be at least equal to the first date!
  DateRange(DateTime.now(), DateTime.now().subtract(Duration(days: 1)));
}
