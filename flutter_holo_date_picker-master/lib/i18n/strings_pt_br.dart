part of 'date_picker_i18n.dart';

/// Portuguese (PT) Brazil
class _StringsPtBr extends _StringsI18n {
  const _StringsPtBr();

  @override
  String getCancelText() => 'Cancelar';

  @override
  String getDoneText() => 'Feito';

  @override
  List<String> getMonths() => [
        'Janeiro',
        'Fevereiro',
        'Março',
        'Abril',
        'Maio',
        'Junho',
        'Julho',
        'Agosto',
        'Setembro',
        'Outubro',
        'Novembro',
        'Dezembro'
      ];

  @override
  List<String> getWeeksFull() => [
        'Segunda',
        'Terca',
        'Quarta',
        'Quinta',
        'Sexta',
        'Sabado',
        'Domingo',
      ];

  @override
  List<String>? getWeeksShort() => null;
}
