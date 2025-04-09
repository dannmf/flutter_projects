import 'package:flutter/material.dart';

class FormFieldsPage extends StatefulWidget {
  const FormFieldsPage({super.key});

  @override
  State<FormFieldsPage> createState() => _FormFieldsPageState();
}

class _FormFieldsPageState extends State<FormFieldsPage> {
  // Chave global para acessar o formulário
  final _formKey = GlobalKey<FormState>();
  
  // Valores do formulário
  String? _nome;
  String? _email;
  String? _categoria;
  bool _notificar = false;
  double _avaliacao = 3;
  DateTime _dataNascimento = DateTime.now();
  
  // Opções da dropdown
  final List<String> _categorias = ['Trabalho', 'Pessoal', 'Estudo', 'Outro'];
  
  // Controladores para os campos de texto
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  
  // Método para selecionar data
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _dataNascimento,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (dataSelecionada != null) {
      setState(() {
        _dataNascimento = dataSelecionada;
      });
    }
  }
  
  // Método para enviar o formulário
  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // Mostrar confirmação
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário enviado com sucesso!')),
      );
    }
  }

  @override
  void dispose() {
    // Limpar os controladores quando o widget for removido
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Fields'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Introdução
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Form Fields',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'O Flutter fornece diversos widgets para coletar entradas do usuário, '
                    'desde texto simples até seleções complexas.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // TextField e TextFormField
          const SectionTitle(title: 'TextField e TextFormField'),
          const SectionDescription(
            description: 'O TextField é o widget básico para entrada de texto, enquanto o TextFormField '
                'é uma versão que pode ser usada dentro de um Form para validação.',
          ),
          
          // Exemplo de TextField
          ExampleCard(
            title: 'Exemplo de TextField',
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              controller: _nomeController,
              onChanged: (value) {
                // No mundo real, poderíamos salvar esse valor em uma variável de estado
              },
            ),
          ),
          
          // Código do TextField
          const CodeSnippetCard(
            title: 'Código do TextField',
            code: '''
TextField(
  decoration: InputDecoration(
    labelText: 'Nome',
    hintText: 'Digite seu nome',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    print('Texto digitado: \$value');
  },
)''',
          ),
          
          const SizedBox(height: 16),
          
          // Exemplo de TextFormField
          ExampleCard(
            title: 'Exemplo de TextFormField com Validação',
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'exemplo@email.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite um email';
                      }
                      if (!value.contains('@')) {
                        return 'Email inválido';
                      }
                      return null; // Retorna null se for válido
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    child: const Text('Validar Email'),
                  ),
                ],
              ),
            ),
          ),
          
          // Código do TextFormField
          const CodeSnippetCard(
            title: 'Código do TextFormField com Validação',
            code: '''
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'exemplo@email.com',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite um email';
    }
    if (!value.contains('@')) {
      return 'Email inválido';
    }
    return null; // Retorna null se for válido
  },
  onSaved: (value) {
    // Salvar o valor quando o formulário for submetido
  },
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Tipos de Teclado
          const SectionTitle(title: 'Tipos de Teclado'),
          const SectionDescription(
            description: 'O Flutter permite especificar o tipo de teclado apropriado para cada tipo de entrada.',
          ),
          
          // Exemplo de Tipos de Teclado
          const ExampleCard(
            title: 'Exemplos de Tipos de Teclado',
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Texto Normal',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Números',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
          
          // Código dos Tipos de Teclado
          const CodeSnippetCard(
            title: 'Código dos Tipos de Teclado',
            code: '''
// Teclado para texto normal
TextField(keyboardType: TextInputType.text)

// Teclado para números
TextField(keyboardType: TextInputType.number)

// Teclado para email
TextField(keyboardType: TextInputType.emailAddress)

// Teclado para URL
TextField(keyboardType: TextInputType.url)

// Teclado para telefone
TextField(keyboardType: TextInputType.phone)

// Teclado para senhas
TextField(
  obscureText: true, // Oculta o texto digitado
  keyboardType: TextInputType.visiblePassword,
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Form
          const SectionTitle(title: 'Form'),
          const SectionDescription(
            description: 'O widget Form é usado para agrupar e validar múltiplos campos de formulário.',
          ),
          
          // Código do Form
          const CodeSnippetCard(
            title: 'Código do Form',
            code: '''
// Crie uma GlobalKey para acessar o estado do formulário
final _formKey = GlobalKey<FormState>();

// No método build
Form(
  key: _formKey,
  child: Column(
    children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Nome'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, digite um nome';
          }
          return null;
        },
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, digite um email';
          }
          return null;
        },
      ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          // Validar o formulário
          if (_formKey.currentState!.validate()) {
            // Se for válido, salvar os dados
            _formKey.currentState!.save();

            // Processar os dados
            print('Formulário válido, processando...');
          }
        },
        child: Text('Enviar'),
      ),
    ],
  ),
)''',
          ),
          
          const SizedBox(height: 24),
          
          // DropdownButton
          const SectionTitle(title: 'DropdownButton'),
          const SectionDescription(
            description: 'Para selecionar uma opção de uma lista.',
          ),
          
          // Exemplo de DropdownButton
          ExampleCard(
            title: 'Exemplo de DropdownButton',
            child: Column(
              children: [
                DropdownButton<String>(
                  value: _categoria,
                  hint: const Text('Selecione uma opção'),
                  isExpanded: true,
                  onChanged: (String? novoValor) {
                    setState(() {
                      _categoria = novoValor;
                    });
                  },
                  items: _categorias.map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(valor),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Text(_categoria != null ? 'Selecionado: $_categoria' : 'Nada selecionado'),
              ],
            ),
          ),
          
          // Código do DropdownButton
          const CodeSnippetCard(
            title: 'Código do DropdownButton',
            code: '''
String? _valorSelecionado;
final _opcoes = ['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4'];

DropdownButton<String>(
  value: _valorSelecionado,
  hint: Text('Selecione uma opção'),
  onChanged: (String? novoValor) {
    setState(() {
      _valorSelecionado = novoValor;
    });
  },
  items: _opcoes.map<DropdownMenuItem<String>>((String valor) {
    return DropdownMenuItem<String>(
      value: valor,
      child: Text(valor),
    );
  }).toList(),
)''',
          ),
          
          const SizedBox(height: 24),
          
          // CheckboxListTile e RadioListTile
          const SectionTitle(title: 'CheckboxListTile e RadioListTile'),
          const SectionDescription(
            description: 'Para criar caixas de seleção e botões de rádio em forma de lista.',
          ),
          
          // Exemplo de CheckboxListTile
          ExampleCard(
            title: 'Exemplo de CheckboxListTile',
            child: CheckboxListTile(
              title: const Text('Aceito os termos e condições'),
              value: _notificar,
              onChanged: (bool? value) {
                setState(() {
                  _notificar = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading, // Posiciona o checkbox no início
            ),
          ),
          
          // Código do CheckboxListTile
          const CodeSnippetCard(
            title: 'Código do CheckboxListTile',
            code: '''
bool _aceitarTermos = false;

CheckboxListTile(
  title: Text('Aceito os termos e condições'),
  value: _aceitarTermos,
  onChanged: (bool? value) {
    setState(() {
      _aceitarTermos = value ?? false;
    });
  },
  controlAffinity: ListTileControlAffinity.leading, // Posiciona o checkbox no início
)''',
          ),
          
          const SizedBox(height: 16),
          
          // Exemplo de RadioListTile
          ExampleCard(
            title: 'Exemplo de RadioListTile',
            child: Column(
              children: <Widget>[
                RadioListTile<int>(
                  title: const Text('Opção 1'),
                  value: 1,
                  groupValue: 1,
                  onChanged: (int? value) {
                    // No exemplo real, mudaríamos o valor do estado
                  },
                ),
                RadioListTile<int>(
                  title: const Text('Opção 2'),
                  value: 2,
                  groupValue: 1,
                  onChanged: (int? value) {
                    // No exemplo real, mudaríamos o valor do estado
                  },
                ),
              ],
            ),
          ),
          
          // Código do RadioListTile
          const CodeSnippetCard(
            title: 'Código do RadioListTile',
            code: '''
enum SexoOpcao { masculino, feminino, outro }

SexoOpcao? _sexoSelecionado;

Column(
  children: <Widget>[
    RadioListTile<SexoOpcao>(
      title: Text('Masculino'),
      value: SexoOpcao.masculino,
      groupValue: _sexoSelecionado,
      onChanged: (SexoOpcao? value) {
        setState(() {
          _sexoSelecionado = value;
        });
      },
    ),
    RadioListTile<SexoOpcao>(
      title: Text('Feminino'),
      value: SexoOpcao.feminino,
      groupValue: _sexoSelecionado,
      onChanged: (SexoOpcao? value) {
        setState(() {
          _sexoSelecionado = value;
        });
      },
    ),
  ],
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Slider
          const SectionTitle(title: 'Slider'),
          const SectionDescription(
            description: 'Para selecionar um valor de um intervalo contínuo.',
          ),
          
          // Exemplo de Slider
          ExampleCard(
            title: 'Exemplo de Slider',
            child: Column(
              children: [
                Text('Valor: ${_avaliacao.round()}'),
                Slider(
                  value: _avaliacao,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _avaliacao.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _avaliacao = value;
                    });
                  },
                ),
              ],
            ),
          ),
          
          // Código do Slider
          const CodeSnippetCard(
            title: 'Código do Slider',
            code: '''
double _valorSlider = 50;

Column(
  children: <Widget>[
    Text('Valor: \${_valorSlider.round()}'),
    Slider(
      value: _valorSlider,
      min: 0,
      max: 100,
      divisions: 10, // Divisões opcionais
      label: _valorSlider.round().toString(), // Rótulo que aparece ao arrastar
      onChanged: (value) {
        setState(() {
          _valorSlider = value;
        });
      },
    ),
  ],
)''',
          ),
          
          const SizedBox(height: 24),
          
          // DatePicker e TimePicker
          const SectionTitle(title: 'DatePicker e TimePicker'),
          const SectionDescription(
            description: 'Para selecionar data e hora.',
          ),
          
          // Exemplo de DatePicker
          ExampleCard(
            title: 'Exemplo de DatePicker',
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Data: ${_dataNascimento.day}/${_dataNascimento.month}/${_dataNascimento.year}'),
                    const Spacer(),
                    TextButton(
                      onPressed: () => _selecionarData(context),
                      child: const Text('Selecionar Data'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Código do DatePicker e TimePicker
          const CodeSnippetCard(
            title: 'Código do DatePicker e TimePicker',
            code: '''
// DatePicker
Future<void> _selecionarData(BuildContext context) async {
  final DateTime? dataSelecionada = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (dataSelecionada != null) {
    setState(() {
      // Processar a data selecionada
      print('Data selecionada: \$dataSelecionada');
    });
  }
}

// TimePicker
Future<void> _selecionarHorario(BuildContext context) async {
  final TimeOfDay? horarioSelecionado = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (horarioSelecionado != null) {
    setState(() {
      // Processar o horário selecionado
      print('Horário selecionado: \$horarioSelecionado');
    });
  }
}''',
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Widgets de suporte para a UI
class SectionTitle extends StatelessWidget {
  final String title;
  
  const SectionTitle({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionDescription extends StatelessWidget {
  final String description;
  
  const SectionDescription({Key? key, required this.description}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String title;
  final Widget child;
  
  const ExampleCard({Key? key, required this.title, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

class CodeSnippetCard extends StatelessWidget {
  final String title;
  final String code;
  
  const CodeSnippetCard({Key? key, required this.title, required this.code}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              code,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
