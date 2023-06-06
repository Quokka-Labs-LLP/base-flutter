import 'package:base_architecture/src/features/new_feature/presentation/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utilities/event_status.dart';

class SampleWidget extends StatefulWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  final _bloc = SampleBloc();
  @override
  void initState() {
    super.initState();
    _bloc.add(const SampleBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        body: BlocBuilder<SampleBloc, SampleState>(
          builder: (context, state) {
            if (state.sampleApiCallStatus is StateLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(state.sampleModel?.data?[index].employeeName ?? '');
                },
                itemCount: state.sampleModel?.data?.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

