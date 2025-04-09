import 'package:flutter/material.dart';

class StatelessVsStatefulPage extends StatelessWidget {
  const StatelessVsStatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless vs Stateful'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Card de explicação
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'O que são Widgets?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Widgets são os blocos de construção básicos da interface do usuário no Flutter. '
                    'Eles podem ser Stateless (imutáveis) ou Stateful (mutáveis).',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Seção Stateless
          const SectionTitle(title: 'StatelessWidget'),
          const SectionDescription(
            description: 'Um StatelessWidget é imutável - depois de construído, suas propriedades não podem mudar. '
                'É ideal para partes da UI que não mudam dinamicamente.',
          ),
          
          // Exemplo de StatelessWidget
          const ExampleCard(
            title: 'Exemplo de StatelessWidget',
            child: ExampleStatelessWidget(texto: 'Este é um widget sem estado'),
          ),
          
          // Código do StatelessWidget
          const CodeSnippetCard(
            title: 'Código do StatelessWidget',
            code: '''
class ExampleStatelessWidget extends StatelessWidget {
  final String texto;

  const ExampleStatelessWidget({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(texto),
    );
  }
}''',
          ),

          const SizedBox(height: 24),
          
          // Seção Stateful
          const SectionTitle(title: 'StatefulWidget'),
          const SectionDescription(
            description: 'Um StatefulWidget pode mudar durante o tempo de vida do widget. '
                'É ideal para partes da UI que precisam ser atualizadas com base em interações do usuário ou dados que mudam.',
          ),
          
          // Exemplo de StatefulWidget
          const ExampleCard(
            title: 'Exemplo de StatefulWidget',
            child: ExampleStatefulWidget(titulo: 'Widget com estado'),
          ),
          
          // Código do StatefulWidget
          const CodeSnippetCard(
            title: 'Código do StatefulWidget',
            code: '''
// Classe StatefulWidget
class ExampleStatefulWidget extends StatefulWidget {
  final String titulo;

  const ExampleStatefulWidget({Key? key, required this.titulo}) : super(key: key);

  @override
  _ExampleStatefulWidgetState createState() => _ExampleStatefulWidgetState();
}

// Classe State
class _ExampleStatefulWidgetState extends State<ExampleStatefulWidget> {
  int contador = 0;

  void _incrementarContador() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('\${widget.titulo}: \$contador'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: _incrementarContador,
            child: Text('Incrementar'),
          ),
        ],
      ),
    );
  }
}''',
          ),

          const SizedBox(height: 24),
          
          // Ciclo de vida dos Widgets
          const SectionTitle(title: 'Ciclo de Vida dos Widgets'),
          
          // Ciclo de vida StatelessWidget
          const SectionSubtitle(subtitle: 'StatelessWidget:'),
          const SectionDescription(
            description: 'constructor → build\n\n'
                'Um StatelessWidget tem um ciclo de vida simples:\n'
                '1. constructor: O widget é criado e suas propriedades são inicializadas.\n'
                '2. build: O widget é renderizado na tela.',
          ),
          
          // Ciclo de vida StatefulWidget
          const SectionSubtitle(subtitle: 'StatefulWidget:'),
          const SectionDescription(
            description: 'O ciclo de vida de um StatefulWidget é mais complexo:\n'
                '1. constructor: O widget é criado.\n'
                '2. createState: Cria a instância da classe State.\n'
                '3. initState: Chamado quando o objeto State é inserido na árvore.\n'
                '4. didChangeDependencies: Chamado após initState e quando as dependências mudam.\n'
                '5. build: Constrói a interface do widget.\n'
                '6. didUpdateWidget: Chamado quando o widget pai é reconstruído.\n'
                '7. setState: Notifica o framework que o estado mudou.\n'
                '8. dispose: Chamado quando o widget é removido da árvore.',
          ),
          
          // Quando usar cada tipo
          const SectionTitle(title: 'Quando Usar Cada Tipo'),
          
          // Quando usar StatelessWidget
          const SectionSubtitle(subtitle: 'Use StatelessWidget quando:'),
          const SectionDescription(
            description: '• A parte da UI não depende de nada além das informações de configuração no próprio objeto.\n'
                '• Você precisa de uma UI que não muda dinamicamente (ex: ícones, textos estáticos).',
          ),
          
          // Quando usar StatefulWidget
          const SectionSubtitle(subtitle: 'Use StatefulWidget quando:'),
          const SectionDescription(
            description: '• A parte da UI depende de informações que mudam durante a execução.\n'
                '• A UI precisa ser atualizada em resposta a ações do usuário.\n'
                '• Você precisa manter estado entre reconstruções (ex: campos de texto, checkboxes).',
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Widgets de exemplo
class ExampleStatelessWidget extends StatelessWidget {
  final String texto;

  const ExampleStatelessWidget({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(texto),
    );
  }
}

class ExampleStatefulWidget extends StatefulWidget {
  final String titulo;

  const ExampleStatefulWidget({Key? key, required this.titulo}) : super(key: key);

  @override
  _ExampleStatefulWidgetState createState() => _ExampleStatefulWidgetState();
}

class _ExampleStatefulWidgetState extends State<ExampleStatefulWidget> {
  int contador = 0;

  void _incrementarContador() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.titulo}: $contador'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _incrementarContador,
            child: const Text('Incrementar'),
          ),
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

class SectionSubtitle extends StatelessWidget {
  final String subtitle;
  
  const SectionSubtitle({Key? key, required this.subtitle}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
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
