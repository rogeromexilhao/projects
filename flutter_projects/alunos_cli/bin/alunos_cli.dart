import 'package:alunos_cli/data/commands/students/students_commands.dart';

import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('ALUNOS CLI','ALUNOS CLI')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
