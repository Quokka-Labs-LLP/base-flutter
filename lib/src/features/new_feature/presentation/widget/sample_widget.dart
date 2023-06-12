import 'package:base_architecture/src/features/new_feature/presentation/bloc/sample_bloc.dart';
import 'package:base_architecture/src/shared/utilities/utils.dart';
import 'package:base_architecture/src/shared/widgets/common_title_text.dart';
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
            if (state.apiCallStatus is StateLoaded) {
              Utils.instance.showToast('Success');
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CommonTitleText(text: state.sampleModel?.data?[index].employeeName ?? '');
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

