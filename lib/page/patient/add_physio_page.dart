import 'package:flutter/material.dart';
import 'package:physioapp/services/pair_users/patient/pair_with_physio.dart';
import 'package:provider/provider.dart';

class AddPhysioPage extends StatelessWidget {
  const AddPhysioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final readQrcodeProvider = Provider.of<PairWithPhysio>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Fisioterapeuta'),
      ),
      body: Text(
        readQrcodeProvider.listPhysioPair.elementAt(0).email,
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        maxRadius: 30,
        child: IconButton(
          onPressed: () => readQrcodeProvider.readQRcode(),
          icon: Icon(
            Icons.qr_code_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
