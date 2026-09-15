import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorSalariuApp());
}

class CalculatorSalariuApp extends StatelessWidget {
  const CalculatorSalariuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Salariu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const CalculatorSalariuPage(),
    );
  }
}

// Enum pentru tipul de angajat (definește procentul de impozitare)
enum TipAngajat { standard, manager, itangajat  }

class CalculatorSalariuPage extends StatefulWidget {
  const CalculatorSalariuPage({super.key});

  @override
  State<CalculatorSalariuPage> createState() => _CalculatorSalariuPageState();
}

class _CalculatorSalariuPageState extends State<CalculatorSalariuPage> {
  final TextEditingController _salariuBrutController = TextEditingController();

  // Tipul de angajat selectat (implicit: obișnuit)
  TipAngajat _tipSelectat = TipAngajat.standard;

  double? _salariuNet;
  double? _sumaImpozit;
  String? _mesajEroare;

  // Procentele de impozitare pentru fiecare categorie
  double _getProcentImpozit(TipAngajat tip) {
    switch (tip) {
      case TipAngajat.standard:
        return 0.20; // 20%
      case TipAngajat.manager:
        return 0.15; // 15%
      case TipAngajat.itangajat:
        return 0.10; // 10%
    }
  }

  String _getNumeTip(TipAngajat tip) {
    switch (tip) {
      case TipAngajat.standard:
        return 'Angajat standard (20%)';
      case TipAngajat.manager:
        return 'Angajat manager (15%)';
      case TipAngajat.itangajat:
        return 'Angajat IT (10%)';
    }
  }

  void _calculeazaSalariu() {
    final String textIntrodus = _salariuBrutController.text.replaceAll(',', '.');
    final double? salariuBrut = double.tryParse(textIntrodus);

    setState(() {
      if (salariuBrut == null || salariuBrut <= 0) {
        _mesajEroare = 'Introduceți o valoare validă pentru salariul brut.';
        _salariuNet = null;
        _sumaImpozit = null;
        return;
      }

      _mesajEroare = null;
      final double procent = _getProcentImpozit(_tipSelectat);
      _sumaImpozit = salariuBrut * procent;
      _salariuNet = salariuBrut - _sumaImpozit!;
    });
  }

  @override
  void dispose() {
    _salariuBrutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Salariu Net'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Salariul brut (MDL):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _salariuBrutController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Ex: 15000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Tipul de angajat:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // DropdownButton pentru selectarea tipului de angajat/impozitare
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<TipAngajat>(
                  value: _tipSelectat,
                  isExpanded: true,
                  items: TipAngajat.values.map((tip) {
                    return DropdownMenuItem<TipAngajat>(
                      value: tip,
                      child: Text(_getNumeTip(tip)),
                    );
                  }).toList(),
                  onChanged: (TipAngajat? valoareNoua) {
                    if (valoareNoua != null) {
                      setState(() {
                        _tipSelectat = valoareNoua;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 28),

            ElevatedButton.icon(
              onPressed: _calculeazaSalariu,
              icon: const Icon(Icons.calculate),
              label: const Text('Calculează'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 28),

            if (_mesajEroare != null)
              Text(
                _mesajEroare!,
                style: const TextStyle(color: Colors.red, fontSize: 15),
                textAlign: TextAlign.center,
              ),

            if (_salariuNet != null && _sumaImpozit != null)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Impozit reținut: ${_sumaImpozit!.toStringAsFixed(2)} MDL',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Salariu net: ${_salariuNet!.toStringAsFixed(2)} MDL',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}