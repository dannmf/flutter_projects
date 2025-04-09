import 'package:flutter/material.dart';
import 'screens/stateless_vs_stateful_page.dart';
import 'screens/layout_widgets_page.dart';
import 'screens/ui_widgets_page.dart';
import 'screens/form_fields_page.dart';
import 'screens/navigation_page.dart';

void main() {
  runApp(const FlutterWidgetsShowcase());
}

class FlutterWidgetsShowcase extends StatelessWidget {
  const FlutterWidgetsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Showcase'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategoryCard(
            context,
            'Stateless vs Stateful Widgets',
            'Entenda a diferença entre widgets com e sem estado',
            Icons.widgets,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const StatelessVsStatefulPage()),
            ),
          ),
          _buildCategoryCard(
            context,
            'Widgets de Layout',
            'Conheça os principais widgets para organizar sua interface',
            Icons.grid_on,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LayoutWidgetsPage()),
            ),
          ),
          _buildCategoryCard(
            context,
            'Widgets de UI',
            'Explore os componentes visuais mais utilizados',
            Icons.palette,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UiWidgetsPage()),
            ),
          ),
          _buildCategoryCard(
            context,
            'Form Fields',
            'Colete informações do usuário com widgets de formulário',
            Icons.input,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormFieldsPage()),
            ),
          ),
          _buildCategoryCard(
            context,
            'Navegação entre Telas',
            'Aprenda como navegar entre diferentes páginas',
            Icons.navigation,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationPage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                radius: 24,
                child: Icon(icon, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
