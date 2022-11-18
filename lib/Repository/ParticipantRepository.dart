import 'package:excel/excel.dart';

import 'package:flutter/services.dart' show ByteData, rootBundle;

/* Your blah blah code here */
getParticipants() async {
  ByteData data = await rootBundle.load("assets/dmdchurashian.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  Excel excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table]?.maxCols);
    int maxrows = excel.tables[table]?.maxRows ?? 0;
    print(excel.tables[table]?.maxRows);
    for(int i = 0; i<maxrows; i++){
      print(excel.tables[table]?.rows[i].toList()[0]?.cellIndex);
    }
    // var x = excel.tables[table]?.rows;
    // for (var row in x) {
    //   print("$row");
    // }
  }
}