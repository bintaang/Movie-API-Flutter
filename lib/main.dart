import 'package:flutter/material.dart';
import 'package:movie_app_flutter/services/route_generator.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  onGenerateRoute: RouteGenerator.generateRoute,
));