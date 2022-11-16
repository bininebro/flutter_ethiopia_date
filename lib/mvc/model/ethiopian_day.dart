class EthiopianDay {
  final bool isSelected;
  final bool isFirst;
  final bool isBetween;
  final String day;
  final String month;
  final String enDay;
  final String enMonth;

  EthiopianDay(this.isSelected, this.isFirst, this.isBetween, this.day,
      this.month, this.enDay, this.enMonth);
}

class EthiopianMonth{
  final List<EthiopianDay> dates;



  EthiopianMonth(this.dates);
}