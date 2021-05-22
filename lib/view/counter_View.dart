import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/counter_Bloc.dart';


//class counterview tidak mengetahui kerja backend, hanya mengirimkan increment dan decrement serta menampilkan state baru
class counterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final cb sebagai blockprovider dari counterbloc (getter/caller)
    final counterBloc cb = BlocProvider.of<counterBloc>(context);
    return Scaffold(
      // dengan menggunakan blocbuilder untuk mengirimkan state dan bloc
      body: BlocBuilder<counterBloc, counterState>(builder: (context, state) {
        return Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  cb.add(increment());
                },
                icon: Icon(Icons.add)),
            Text(state.count.toString()),
            IconButton(
                onPressed: () {
                  cb.add(decrement());
                },
                icon: Icon(Icons.remove))
          ],
        ));
      }),
    );
  }
}
