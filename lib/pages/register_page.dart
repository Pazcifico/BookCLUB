import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Conta criada com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final purple = const Color(0xFF7B3EFF);
    final yellow = const Color(0xFFF5B800);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.menu_book_rounded, color: purple, size: 28),
                      const SizedBox(width: 8),
                      Text("BookCLUB",
                          style: TextStyle(
                              color: purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text("Cadastre-se",
                      style: TextStyle(
                          color: purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                      "Entre na maior rede social de livro da cidade de Americana!",
                      style: TextStyle(fontSize: 14, color: Colors.black87)),
                  const SizedBox(height: 30),

                  // Nome
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite seu Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: purple),
                      ),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Digite seu nome' : null,
                  ),
                  const SizedBox(height: 20),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Digite seu E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: purple),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Digite seu e-mail';
                      if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(v)) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirmar Email
                  TextFormField(
                    controller: _confirmEmailController,
                    decoration: InputDecoration(
                      labelText: 'Confirme seu E-mail',
                      hintText: 'Confirme seu E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: purple),
                      ),
                    ),
                    validator: (v) =>
                        v != _emailController.text ? 'E-mails não conferem' : null,
                  ),
                  const SizedBox(height: 20),

                  // Senha
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: purple),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: purple,
                        ),
                        onPressed: () =>
                            setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (v) => v == null || v.length < 6
                        ? 'A senha deve ter pelo menos 6 caracteres'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Confirmar Senha
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirme a sua senha',
                      hintText: 'Confirme sua Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: purple),
                      ),
                    ),
                    validator: (v) =>
                        v != _passwordController.text ? 'Senhas não conferem' : null,
                  ),
                  const SizedBox(height: 30),

                  // Botão Criar Conta
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _onRegister,
                      child: const Text("CRIAR CONTA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Center(
                    child: Text("Já tenho conta",
                        style: TextStyle(color: Colors.black87)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
