import 'package:flutter/material.dart';
import 'package:physioapp/model/schedule/schedule_form_data.dart';

class FirstFormScheduleAppointment extends StatefulWidget {
  const FirstFormScheduleAppointment({super.key});

  @override
  State<FirstFormScheduleAppointment> createState() =>
      _FirstFormScheduleAppointmentState();
}

class _FirstFormScheduleAppointmentState
    extends State<FirstFormScheduleAppointment> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _showPatientsAppoiments() async {
    showDialog(context: context, builder: (context) => ,);
  }

  @override
  Widget build(BuildContext context) {
    Widget defaultTextForm({required Widget textForm}) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: textForm,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 16,
          ),
          child: Text(
            'Dados do Paciente',
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).textTheme.labelLarge?.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () => ,
                child: defaultTextForm(
                  textForm: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'Nome completo',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    onChanged: (name) => ScheduleFormData.name = name,
                  ),
                ),
              ),
              defaultTextForm(
                textForm: TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Ocorrência',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  onChanged: (occurrence) =>
                      ScheduleFormData.occurrence = occurrence,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
