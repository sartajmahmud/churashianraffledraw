import 'package:http/http.dart' as http;


getGuests() async {
  try {
    var url = Uri.http('churashianuttara.com', 'guestlist');
    final response = await http.get(
        Uri.http('churashianuttara.com', 'guestlist'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });

    print(response.statusCode);
    print(response.body);
    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
}catch(e){
    print(e);
  }
}