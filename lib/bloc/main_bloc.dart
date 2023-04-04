import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolates/bloc/post_bloc/post_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() => [
    BlocProvider<PostBloc>(create: (context) => PostBloc())
  ];
}