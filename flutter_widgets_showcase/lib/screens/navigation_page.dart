import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação entre Telas'),
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
                    'Navegação entre Telas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A navegação é um componente essencial de qualquer aplicativo. '
                    'O Flutter oferece várias maneiras de navegar entre diferentes telas.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Navigator
          const SectionTitle(title: 'Navigator'),
          const SectionDescription(
            description: 'Navigator é a classe que gerencia um conjunto de widgets filho (rotas) '
                'usando a disciplina de pilha.',
          ),
          
          // Navegação Básica
          const SectionSubtitle(subtitle: 'Navegação Básica'),
          
          // Exemplo de Navegação Básica
          ExampleCard(
            title: 'Exemplo de Navegação Básica',
            child: Column(
              children: [
                // Botão para ir para a segunda tela
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SegundaTela()),
                    );
                  },
                  child: const Text('Ir para Segunda Tela'),
                ),
              ],
            ),
          ),
          
          // Código da Navegação Básica
          const CodeSnippetCard(
            title: 'Código da Navegação Básica',
            code: '''
// Ir para a segunda tela
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaTela()),
);

// Voltar para a tela anterior
Navigator.pop(context);''',
          ),
          
          const SizedBox(height: 24),
          
          // Navegação com Dados
          const SectionSubtitle(subtitle: 'Navegação com Dados'),
          
          // Exemplo de Navegação com Dados
          ExampleCard(
            title: 'Exemplo de Navegação com Dados',
            child: Column(
              children: [
                // Botão para ir para a tela com dados
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaComDados(
                          dadoEnviado: 'Olá da primeira tela!',
                        ),
                      ),
                    );
                  },
                  child: const Text('Enviar Dados para Tela'),
                ),
                const SizedBox(height: 16),
                // Botão para receber dados da tela
                ElevatedButton(
                  onPressed: () async {
                    final resultado = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TelaRetornaDados()),
                    );
                    
                    if (resultado != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Retornou: $resultado')),
                      );
                    }
                  },
                  child: const Text('Receber Dados da Tela'),
                ),
              ],
            ),
          ),
          
          // Código da Navegação com Dados
          const CodeSnippetCard(
            title: 'Código da Navegação com Dados',
            code: '''
// Enviando dados para a segunda tela
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SegundaTela(dadoEnviado: 'Olá da primeira tela!'),
  ),
);

// Recebendo dados da segunda tela
final resultado = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaTela()),
);''',
          ),
          
          const SizedBox(height: 24),
          
          // Rotas Nomeadas
          const SectionSubtitle(subtitle: 'Rotas Nomeadas'),
          const SectionDescription(
            description: 'As rotas nomeadas permitem referir-se às rotas usando strings, '
                'o que facilita a navegação em aplicativos mais complexos.',
          ),
          
          // Exemplo de Rotas Nomeadas
          const ExampleCard(
            title: 'Configuração no MaterialApp',
            child: CodeBlock(
              code: '''
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaPrincipal(),
    '/segunda': (context) => SegundaTela(),
    '/terceira': (context) => TerceiraTela(),
  },
);''',
            ),
          ),
          
          // Navegando com Rotas Nomeadas
          const ExampleCard(
            title: 'Navegando com Rotas Nomeadas',
            child: CodeBlock(
              code: '''
// Navegando com rotas nomeadas
Navigator.pushNamed(context, '/segunda');

// Navegando com dados
Navigator.pushNamed(
  context,
  '/segunda',
  arguments: {'mensagem': 'Olá!'},
);

// Acessando argumentos na tela de destino
final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
final mensagem = args['mensagem'];''',
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Drawer
          const SectionTitle(title: 'Drawer'),
          const SectionDescription(
            description: 'O Drawer é um menu lateral deslizante usado em muitos aplicativos para navegação.',
          ),
          
          // Código do Drawer
          const CodeSnippetCard(
            title: 'Código do Drawer',
            code: '''
Scaffold(
  appBar: AppBar(title: Text('App com Drawer')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Início'),
          onTap: () {
            // Navegar para a tela inicial
            Navigator.pop(context); // Fecha o drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configurações'),
          onTap: () {
            // Navegar para a tela de configurações
            Navigator.pop(context); // Fecha o drawer
          },
        ),
      ],
    ),
  ),
  body: Center(
    child: Text('Conteúdo Principal'),
  ),
)''',
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Telas de exemplo para navegação
class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esta é a segunda tela'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaComDados extends StatelessWidget {
  final String dadoEnviado;
  
  const TelaComDados({super.key, required this.dadoEnviado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela com Dados'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dados recebidos: $dadoEnviado'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaRetornaDados extends StatelessWidget {
  const TelaRetornaDados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retornar Dados'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selecione um valor para retornar:'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Valor A');
              },
              child: const Text('Retornar "Valor A"'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Valor B');
              },
              child: const Text('Retornar "Valor B"'),
            ),
          ],
        ),
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

class CodeBlock extends StatelessWidget {
  final String code;
  
  const CodeBlock({Key? key, required this.code}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
