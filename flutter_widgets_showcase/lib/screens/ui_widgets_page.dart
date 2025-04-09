import 'package:flutter/material.dart';

class UiWidgetsPage extends StatefulWidget {
  const UiWidgetsPage({super.key});

  @override
  State<UiWidgetsPage> createState() => _UiWidgetsPageState();
}

class _UiWidgetsPageState extends State<UiWidgetsPage> {
  bool _isFavorite = false;
  double _sliderValue = 0.5;
  bool _switchValue = true;
  bool _checkboxValue = true;
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets de UI'),
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
                    'Widgets de UI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Os widgets de UI são os componentes visuais que o usuário interage. '
                    'Aqui estão os widgets de UI mais comuns e importantes do Flutter.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Text Widget
          const SectionTitle(title: 'Text'),
          const SectionDescription(
            description: 'O widget Text é usado para exibir texto na tela. '
                'Ele oferece diversas opções de personalização.',
          ),
          
          // Exemplo de Text
          const ExampleCard(
            title: 'Exemplos de Text',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Texto simples',
                ),
                SizedBox(height: 8),
                Text(
                  'Texto com estilo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Texto com múltiplas linhas que vai quebrar quando chegar ao final do contêiner',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          
          // Código do Text
          const CodeSnippetCard(
            title: 'Código do Text',
            code: '''
Text(
  'Olá, Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.2,
    fontFamily: 'Roboto',
  ),
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  maxLines: 2,
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Button Widgets
          const SectionTitle(title: 'Button Widgets'),
          const SectionDescription(
            description: 'Flutter oferece vários tipos de botões para diferentes necessidades.',
          ),
          
          // Exemplo de Buttons
          ExampleCard(
            title: 'Exemplos de Botões',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ElevatedButton
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: 16),
                
                // TextButton
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('TextButton'),
                ),
                const SizedBox(height: 16),
                
                // OutlinedButton
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(height: 16),
                
                // IconButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      color: Colors.red,
                      tooltip: 'Favoritar',
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                    const Text('IconButton'),
                  ],
                ),
              ],
            ),
          ),
          
          // Código dos Buttons
          const CodeSnippetCard(
            title: 'Código do ElevatedButton',
            code: '''
ElevatedButton(
  onPressed: () {
    print('Botão pressionado!');
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Text('Clique Aqui'),
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Image
          const SectionTitle(title: 'Image'),
          const SectionDescription(
            description: 'O Flutter oferece várias formas de exibir imagens.',
          ),
          
          // Exemplo de Image
          const ExampleCard(
            title: 'Exemplo de Imagem',
            child: Column(
              children: [
                // Placeholder simulando uma imagem
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Placeholder(
                    color: Colors.blue,
                    strokeWidth: 2.0,
                    fallbackHeight: 100,
                    fallbackWidth: 200,
                  ),
                ),
                SizedBox(height: 8),
                Text('Placeholder no lugar da imagem'),
              ],
            ),
          ),
          
          // Código do Image
          const CodeSnippetCard(
            title: 'Código do Image',
            code: '''
// Imagem da internet
Image.network(
  'https://picsum.photos/250?image=9',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
)

// Imagem do asset
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Card
          const SectionTitle(title: 'Card'),
          const SectionDescription(
            description: 'Widget para criar cartões com elevação e bordas arredondadas.',
          ),
          
          // Exemplo de Card
          ExampleCard(
            title: 'Exemplo de Card',
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Título do Card',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Este é o conteúdo do card onde você pode adicionar uma descrição mais detalhada.'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('CANCELAR'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('CONFIRMAR'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Código do Card
          const CodeSnippetCard(
            title: 'Código do Card',
            code: '''
Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Título do Card',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text('Este é o conteúdo do card onde você pode adicionar uma descrição mais detalhada.'),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('CANCELAR'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('CONFIRMAR'),
            ),
          ],
        ),
      ],
    ),
  ),
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Progress Indicators
          const SectionTitle(title: 'Progress Indicators'),
          const SectionDescription(
            description: 'Widgets para indicar o progresso de uma operação.',
          ),
          
          // Exemplo de Progress Indicators
          const ExampleCard(
            title: 'Exemplos de Indicadores de Progresso',
            child: Column(
              children: [
                // Circular
                CircularProgressIndicator(
                  value: 0.7,
                  color: Colors.blue,
                  strokeWidth: 5,
                ),
                SizedBox(height: 16),
                // Linear
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Color(0xFFE0E0E0),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
          
          // Código dos Progress Indicators
          const CodeSnippetCard(
            title: 'Código dos Progress Indicators',
            code: '''
// Indicador circular
CircularProgressIndicator(
  value: 0.7, // Se null, mostra um progresso indeterminado
  color: Colors.blue,
  strokeWidth: 5,
)

// Indicador linear
LinearProgressIndicator(
  value: 0.5, // Se null, mostra um progresso indeterminado
  backgroundColor: Colors.grey[300],
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Switch, Checkbox e Radio
          const SectionTitle(title: 'Switch, Checkbox e Radio'),
          const SectionDescription(
            description: 'Widgets para seleção de estados.',
          ),
          
          // Exemplo de Switch, Checkbox e Radio
          ExampleCard(
            title: 'Exemplos de Widgets de Seleção',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Switch
                Row(
                  children: [
                    Switch(
                      value: _switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const SizedBox(width: 16),
                    Text(_switchValue ? 'Ativo' : 'Inativo'),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxValue,
                      onChanged: (bool? value) {
                        setState(() {
                          _checkboxValue = value ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const SizedBox(width: 16),
                    const Text('Aceito os termos'),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Radio
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value ?? 1;
                        });
                      },
                    ),
                    const Text('Opção 1'),
                    const SizedBox(width: 16),
                    Radio<int>(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value ?? 2;
                        });
                      },
                    ),
                    const Text('Opção 2'),
                  ],
                ),
              ],
            ),
          ),
          
          // Código do Switch, Checkbox e Radio
          const CodeSnippetCard(
            title: 'Código do Switch, Checkbox e Radio',
            code: '''
// Switch (Interruptor)
Switch(
  value: true,
  onChanged: (bool value) {
    // Atualizar estado
  },
  activeColor: Colors.green,
)

// Checkbox
Checkbox(
  value: true,
  onChanged: (bool? value) {
    // Atualizar estado
  },
  activeColor: Colors.blue,
)

// Radio
Radio<int>(
  value: 1,
  groupValue: 1, // Valor selecionado do grupo
  onChanged: (int? value) {
    // Atualizar estado
  },
)''',
          ),
          
          const SizedBox(height: 24),
          
          // Slider
          const SectionTitle(title: 'Slider'),
          const SectionDescription(
            description: 'Widget para selecionar um valor de um intervalo.',
          ),
          
          // Exemplo de Slider
          ExampleCard(
            title: 'Exemplo de Slider',
            child: Column(
              children: [
                Text('Valor: ${(_sliderValue * 100).round()}'),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  label: (_sliderValue * 100).round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
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
