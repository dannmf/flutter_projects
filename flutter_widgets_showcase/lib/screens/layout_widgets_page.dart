import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets de Layout'),
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
                    'Widgets de Layout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Os widgets de layout são fundamentais para organizar outros widgets na tela, '
                    'criando estruturas visuais complexas a partir de componentes simples.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Widgets de Layout Básicos
          const SectionTitle(title: 'Widgets de Layout Básicos'),

          // Container
          const SectionSubtitle(subtitle: 'Container'),
          const SectionDescription(
            description:
                'Cria um elemento visual retangular, oferecendo controle sobre posicionamento, '
                'tamanho e decoração.',
          ),

          // Exemplo de Container
          ExampleCard(
            title: 'Exemplo de Container',
            child: Container(
              width: 200,
              height: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Olá, Flutter!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Código do Container
          const CodeSnippetCard(
            title: 'Código do Container',
            code: '''
Container(
  width: 200,
  height: 100,
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: Text(
      'Olá, Flutter!',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)''',
          ),

          const SizedBox(height: 24),

          // Row
          const SectionSubtitle(subtitle: 'Row'),
          const SectionDescription(
            description: 'Organiza widgets filhos na horizontal.',
          ),

          // Exemplo de Row
          ExampleCard(
            title: 'Exemplo de Row',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, color: Colors.amber[700]),
                  Icon(Icons.star, color: Colors.amber[700]),
                  Icon(Icons.star, color: Colors.amber[700]),
                ],
              ),
            ),
          ),

          // Código do Row
          const CodeSnippetCard(
            title: 'Código do Row',
            code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.star, color: Colors.amber[700]),
    Icon(Icons.star, color: Colors.amber[700]),
    Icon(Icons.star, color: Colors.amber[700]),
  ],
)''',
          ),

          const SizedBox(height: 24),

          // Column
          const SectionSubtitle(subtitle: 'Column'),
          const SectionDescription(
            description: 'Organiza widgets filhos na vertical.',
          ),

          // Exemplo de Column
          ExampleCard(
            title: 'Exemplo de Column',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Primeiro item'),
                  SizedBox(height: 8),
                  Text('Segundo item'),
                  SizedBox(height: 8),
                  Text('Terceiro item'),
                ],
              ),
            ),
          ),

          // Código do Column
          const CodeSnippetCard(
            title: 'Código do Column',
            code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  children: [
    Text('Primeiro item'),
    SizedBox(height: 8),
    Text('Segundo item'),
    SizedBox(height: 8),
    Text('Terceiro item'),
  ],
)''',
          ),

          const SizedBox(height: 24),

          // Stack
          const SectionSubtitle(subtitle: 'Stack'),
          const SectionDescription(
            description: 'Empilha widgets um sobre o outro.',
          ),

          // Exemplo de Stack
          ExampleCard(
            title: 'Exemplo de Stack',
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  // Em um app real, usaríamos Image.network
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue[400]!, Colors.blue[900]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      'Legenda',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Código do Stack
          const CodeSnippetCard(
            title: 'Código do Stack',
            code: '''
Stack(
  children: [
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: Text(
        'Legenda',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)''',
          ),

          const SizedBox(height: 24),

          // Widgets de Layout Avançados
          const SectionTitle(title: 'Widgets de Layout Avançados'),

          // ListView
          const SectionSubtitle(subtitle: 'ListView'),
          const SectionDescription(
            description:
                'Cria uma lista rolável de widgets, ideal para listas longas.',
          ),

          // Exemplo de ListView
          ExampleCard(
            title: 'Exemplo de ListView',
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
            ),
          ),

          // Código do ListView
          const CodeSnippetCard(
            title: 'Código do ListView',
            code: '''
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('\${index + 1}'),
      ),
      title: Text('Item \${index + 1}'),
    );
  },
)''',
          ),

          const SizedBox(height: 24),

          // GridView
          const SectionSubtitle(subtitle: 'GridView'),
          const SectionDescription(
            description: 'Cria um grid rolável de widgets.',
          ),

          // Exemplo de GridView
          ExampleCard(
            title: 'Exemplo de GridView',
            child: SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return Card(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Código do GridView
          const CodeSnippetCard(
            title: 'Código do GridView',
            code: '''
GridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  children: List.generate(4, (index) {
    return Card(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text(
          'Item \${index + 1}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }),
)''',
          ),

          const SizedBox(height: 24),

          // Expanded e Flexible
          const SectionSubtitle(subtitle: 'Expanded e Flexible'),
          const SectionDescription(
            description:
                'Controlam como os widgets se expandem para preencher o espaço disponível.',
          ),

          // Exemplo de Expanded e Flexible
          ExampleCard(
            title: 'Exemplo de Expanded e Flexible',
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(color: Colors.red),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),

          // Código do Expanded e Flexible
          const CodeSnippetCard(
            title: 'Código do Expanded e Flexible',
            code: '''
Row(
  children: [
    // Ocupa 1/3 do espaço disponível
    Flexible(
      flex: 1,
      child: Container(color: Colors.red),
    ),
    // Ocupa 2/3 do espaço disponível
    Expanded(
      flex: 2,
      child: Container(color: Colors.blue),
    ),
  ],
)''',
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

  const SectionDescription({Key? key, required this.description})
      : super(key: key);

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

  const ExampleCard({Key? key, required this.title, required this.child})
      : super(key: key);

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

  const CodeSnippetCard({Key? key, required this.title, required this.code})
      : super(key: key);

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
