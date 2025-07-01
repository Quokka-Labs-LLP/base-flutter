import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utilities/event_status.dart';
import '../../../../shared/utilities/utils.dart';
import '../../../../shared/widgets/common_title_text.dart';
import '../bloc/sample_bloc.dart';

class SampleWidget extends StatefulWidget {
  const SampleWidget({super.key});

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
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => _bloc,
      child: Scaffold(
        body: BlocBuilder<SampleBloc, SampleState>(
          builder: (final context, final state) {
            if (state.apiCallStatus is StateLoaded) {
              Utils.instance.showToast('Success');
              return ListView.builder(
                itemBuilder: (final context, final index) {
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
