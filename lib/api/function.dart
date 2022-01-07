List<String> _weekdays = [
  'Day',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
List<String> _months = [
  'Month',
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String getweekday(DateTime time) {
  return _weekdays[time.weekday];
}

String getmonth(DateTime time) {
  return _months[time.month] +
      ' ' +
      time.day.toString() +
      ',' +
      time.year.toString();
}

String getcombineddaymonth(DateTime time) {
  return getweekday(time) + ', ' + getmonth(time);
}

String gettime(DateTime time) {
  return time.hour.toString() + ':' + time.minute.toString();
}
