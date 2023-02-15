import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldi_68_multi_bloc_provider/counter.dart';
import 'package:flutter_kuldi_68_multi_bloc_provider/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData dark = ThemeData.dark();
  ThemeData light = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc(false)),
        BlocProvider(create: (context) => CounterBloc(0)),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (BuildContext context, state) => MaterialApp(
          theme: state ? dark : light,
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(builder: (BuildContext context, state) {
            return Text('Angka saat ini : $state');
          }),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => context.read<CounterBloc>().decrement(),
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () => context.read<CounterBloc>().increment(),
                  icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeBloc>().changeTheme(),
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
