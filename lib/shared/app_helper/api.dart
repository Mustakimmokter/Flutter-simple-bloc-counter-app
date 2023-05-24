
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint{

  static final String api = dotenv.get('OWN');

}