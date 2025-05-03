class DateFormatter {
  // Format date from yyyy-MM-dd to MM/dd/yyyy
  static String formatDate(String dateString) {
    try {
      final parts = dateString.split('-');
      if (parts.length != 3) return dateString;
      
      return '${parts[1]}/${parts[2]}/${parts[0]}';
    } catch (e) {
      return dateString;
    }
  }
}