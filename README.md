# Sistema de Gerenciamento de Empresas e Licenças Ambientais

Este projeto é um sistema de gerenciamento desenvolvido com Flutter e Firebase Firestore. Ele permite criar, ler, atualizar e excluir empresas e suas licenças ambientais correspondentes. Além disso, inclui funcionalidades de autenticação de usuários através do FirebaseAuth.

## Funcionalidades

- **Autenticação de Usuários:** Login e criação de conta utilizando FirebaseAuth.

https://github.com/LuanFortunato/desafio_flutter_ambisis/assets/66745466/fe9f9400-f8ea-4569-bec6-f89885d51a48


  
- **CRUD de Empresas:** Permite a gestão de empresas, incluindo a adição, leitura, atualização e exclusão de registros.

https://github.com/LuanFortunato/desafio_flutter_ambisis/assets/66745466/31d01b54-a6e9-479f-8107-2e921ae44758


- **CRUD de Licenças Ambientais:** Gerenciamento de licenças ambientais associadas a empresas específicas.

https://github.com/LuanFortunato/desafio_flutter_ambisis/assets/66745466/645103a2-dbab-4988-a8df-d53ec8df406d


- **Segurança de Dados:** Acesso ao Firestore restrito a usuários logados.

## Configuração do Ambiente

Para executar este projeto localmente, siga os passos abaixo:

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) instalado na sua máquina.
- Uma conta no [Firebase](https://firebase.google.com/) e um projeto criado para este app.

### Passos para Execução

1. **Clone o repositório**

    ```bash
    git clone <URL_DO_REPOSITORIO>
    cd <NOME_DO_PROJETO>
    ```

2. **Configuração do Firebase**

    - Vá até o [console do Firebase](https://console.firebase.google.com/), selecione o projeto criado e adicione um novo app Flutter.
    - Siga as instruções para baixar o arquivo `google-services.json` e coloque-o dentro da pasta `android/app` do projeto Flutter.
    - Faça o mesmo para a versão iOS baixando o arquivo `GoogleService-Info.plist` e colocando-o no local especificado pelas instruções do Firebase.

3. **Instale as dependências**

    Dentro do diretório do projeto, execute:

    ```bash
    flutter pub get
    ```

4. **Execute o aplicativo**

    Certifique-se de ter um dispositivo ou emulador conectado e execute:

    ```bash
    flutter run
    ```
