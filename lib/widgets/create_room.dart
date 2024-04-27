import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connector/helpers/cooma_dot_input_formatter.dart';
import 'package:connector/helpers/helpers.dart';
import 'package:connector/helpers/negative_number_input_formatter.dart';
import 'package:connector/models/room.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_internet_signal/flutter_internet_signal.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';

class CreateRoom extends StatefulWidget {
  Room? room;
  final nameController = TextEditingController();
  final legacyLinkSpeedController = TextEditingController();
  final legacyLinkStrengthController = TextEditingController();
  final linkSpeedController = TextEditingController();
  final linkStrengthController = TextEditingController();
  final interferenceController = TextEditingController();

  CreateRoom({
    Key? key,
    this.room,
  }) {
    if (room != null) {
      nameController.text = room!.name;
      legacyLinkSpeedController.text = room!.legacyLinkSpeed.toString();
      legacyLinkStrengthController.text = room!.legacyLinkStrength.toString();
      linkSpeedController.text = room!.linkSpeed.toString();
      linkStrengthController.text = room!.linkStrength.toString();
      interferenceController.text = room!.interference.toString();
    }
  }

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final _formKey = GlobalKey<FormState>();

  final RegExp _regex = RegExp(r'^[\d.,-]*$');

  _getIntensity(bool is5g) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.wifi)) {
      return Helpers.toast(
        title: "Sem conexão wifi",
        message:
            "Por favor, conecte-se a uma rede wifi para realizar essa ação.",
        color: AppTheme.colors.warning,
      );
    }
    final FlutterInternetSignal internetSignal = FlutterInternetSignal();
    final int? wifiSignal = await internetSignal.getWifiSignalStrength();

    if (is5g) {
      widget.linkStrengthController.text = "$wifiSignal";
    } else {
      widget.legacyLinkStrengthController.text = "$wifiSignal";
    }

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  _getVelocity(bool is5g) async {
    var percentage = 0.0.obs;
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.wifi)) {
      return Helpers.toast(
        title: "Sem conexão wifi",
        message:
            "Por favor, conecte-se a uma rede wifi para realizar essa ação.",
        color: AppTheme.colors.warning,
      );
    }

    Loader.show(
      // ignore: use_build_context_synchronously
      context,
      progressIndicator: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppTheme.colors.dark,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${percentage.value.toStringAsPrecision(2)}%",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: AppTheme.colors.dark,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final speedTest = FlutterInternetSpeedTest();
    speedTest.startTesting(
        downloadTestServer: 'https://fast.com/',
        uploadTestServer: 'http://speedtest.ftp.otenet.gr/',
        fileSize: 5000,
        onDone: (download, upload) {
          if (is5g) {
            widget.linkSpeedController.text = "${download.transferRate}";
          } else {
            widget.legacyLinkSpeedController.text = "${download.transferRate}";
          }
          Loader.hide();
          Navigator.pop(context);
        },
        onProgress: (percent, data) {
          percentage.value = percent;
        },
        onError: (errorMessage, speedTestError) {
          Loader.hide();
          Helpers.toast(
            title: 'Erro',
            message: "Erro ao testar a velocidade",
            color: AppTheme.colors.danger,
          );
          Navigator.pop(context);
        });
  }

  Future<void> _dialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Selecione a opção desejada"),
            children: [
              SimpleDialogOption(
                child: const Text("Velociade de conexão 5G"),
                onPressed: () {
                  _getVelocity(true);
                },
              ),
              SimpleDialogOption(
                child: const Text("Velocidade de conexão 2,4g"),
                onPressed: () {
                  _getVelocity(false);
                },
              ),
              SimpleDialogOption(
                child: const Text("Intensidade de sinal 5G"),
                onPressed: () {
                  _getIntensity(true);
                },
              ),
              SimpleDialogOption(
                child: const Text("Intensidade de sinal 2,4G"),
                onPressed: () {
                  _getIntensity(false);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      (widget.room != null ? 'Atualizar' : 'Novo') + ' cômodo',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 5,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: InkWell(
                    onTap: () async {
                      await _dialog();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.bars,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome do cômodo',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Velocidade 2,4GHz',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.legacyLinkSpeedController,
                    inputFormatters: [
                      CommaToDotTextInputFormatter(),
                      FilteringTextInputFormatter.allow(_regex)
                    ],
                    decoration: const InputDecoration(
                      suffixText: "Mbps",
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Velocidade 2,4GHz é obrigatório';
                      }

                      var number = double.tryParse(value);

                      if (number == null) {
                        return 'Número inválido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nível de Sinal 2.4GHz',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.legacyLinkStrengthController,
                    inputFormatters: [
                      NegativeNumberTextInputFormatter(),
                      CommaToDotTextInputFormatter(),
                      FilteringTextInputFormatter.allow(_regex)
                    ],
                    decoration: const InputDecoration(
                      suffixText: "dbm",
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nível de Sinal 2,4GHz é obrigatório';
                      }
                      var number = double.tryParse(value);

                      if (number == null || number >= 0) {
                        return 'Número inválido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Velocidade 5GHz',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.linkSpeedController,
                    inputFormatters: [
                      CommaToDotTextInputFormatter(),
                      FilteringTextInputFormatter.allow(_regex)
                    ],
                    decoration: const InputDecoration(
                      suffixText: "Mbps",
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Velocidade 5GHz é obrigatório';
                      }

                      var number = double.tryParse(value);

                      if (number == null) {
                        return 'Número inválido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nível de Sinal 5GHz',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.linkStrengthController,
                    inputFormatters: [
                      NegativeNumberTextInputFormatter(),
                      CommaToDotTextInputFormatter(),
                      FilteringTextInputFormatter.allow(_regex)
                    ],
                    decoration: const InputDecoration(
                      suffixText: "dbm",
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nível de Sinal 2,4GHz é obrigatório';
                      }
                      var number = double.tryParse(value);

                      if (number == null || number >= 0) {
                        return 'Número inválido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Interferência',
                    style: TextStyle(
                      color: AppTheme.colors.medium,
                    ),
                  ),
                  TextFormField(
                    controller: widget.interferenceController,
                    inputFormatters: [
                      NegativeNumberTextInputFormatter(),
                      CommaToDotTextInputFormatter(),
                      FilteringTextInputFormatter.allow(_regex)
                    ],
                    decoration: const InputDecoration(
                      suffixText: "dbm",
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Interferência é obrigatório';
                      }
                      var number = double.tryParse(value);

                      if (number == null || number >= 0) {
                        return 'Número inválido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Visibility(
                        visible: widget.room == null,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Get.back(
                                      result: Room(
                                        name: widget.nameController.text,
                                        legacyLinkSpeed: double.parse(widget
                                            .legacyLinkSpeedController.text),
                                        legacyLinkStrength: double.parse(widget
                                            .legacyLinkStrengthController.text),
                                        linkSpeed: double.parse(
                                            widget.linkSpeedController.text),
                                        linkStrength: double.parse(
                                            widget.linkStrengthController.text),
                                        interference: double.parse(
                                            widget.interferenceController.text),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.colors.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 40,
                                  child: const Center(
                                    child: Text(
                                      'SALVAR',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widget.room != null,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back(
                                    result: 'excluir',
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppTheme.colors.danger),
                                  height: 40,
                                  child: const Center(
                                    child: Text(
                                      'EXCLUIR',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back(
                                    result: Room(
                                      id: widget.room?.id,
                                      name: widget.nameController.text,
                                      legacyLinkSpeed: double.parse(widget
                                          .legacyLinkSpeedController.text),
                                      legacyLinkStrength: double.parse(widget
                                          .legacyLinkStrengthController.text),
                                      linkSpeed: double.parse(
                                          widget.linkSpeedController.text),
                                      linkStrength: double.parse(
                                          widget.linkStrengthController.text),
                                      interference: double.parse(
                                          widget.interferenceController.text),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppTheme.colors.primary),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      25,
                                  child: const Center(
                                    child: Text(
                                      'ATUALIZAR',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
