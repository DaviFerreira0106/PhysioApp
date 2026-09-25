# 🩺 PhysioApp — Sistema de Gestão para Fisioterapeutas

Aplicativo mobile desenvolvido como **Trabalho de Conclusão de Curso (TCC)**, utilizando **Flutter e Dart** no desenvolvimento do frontend e uma **API REST desenvolvida em Java** como backend.

O projeto tem como objetivo fornecer uma plataforma para auxiliar fisioterapeutas no gerenciamento de seus pacientes, exercícios e consultas, além de disponibilizar recursos de comunicação e acompanhamento para os pacientes.

---

## 📱 Sobre o Projeto

O **PhysioApp** foi desenvolvido com o propósito de centralizar diferentes recursos relacionados ao acompanhamento fisioterapêutico em uma única aplicação.

A plataforma possui diferentes funcionalidades para **fisioterapeutas e pacientes**, permitindo desde o gerenciamento de informações e exercícios até comunicação em tempo real.

Entre as principais funcionalidades estão:

- 👨‍⚕️ Cadastro e gerenciamento de pacientes
- 👤 Cadastro e acesso para pacientes
- 🔐 Autenticação de usuários
- 🏋️ Biblioteca de exercícios
- 🖼️ Exercícios com imagens
- 🎥 Exercícios demonstrados em vídeos
- 📋 Compartilhamento de exercícios com pacientes
- 📅 Agendamento de consultas
- 💬 Chat entre fisioterapeuta e paciente
- 📹 Videochamadas
- 📱 Aplicação mobile multiplataforma
- 🔄 Comunicação com API REST
- 🔐 Comunicação segura entre aplicação e backend

---

## 🎯 Objetivo

O principal objetivo do projeto é fornecer uma ferramenta digital capaz de auxiliar fisioterapeutas no gerenciamento de seus atendimentos e facilitar o acompanhamento dos pacientes.

A aplicação busca aproximar o profissional e o paciente através de recursos como:

- Gerenciamento de pacientes
- Biblioteca e compartilhamento de exercícios
- Agendamento de consultas
- Comunicação através de chat
- Videochamadas
- Acompanhamento dos exercícios disponibilizados pelo profissional

O projeto também teve como objetivo aplicar, em um cenário prático, conhecimentos relacionados ao desenvolvimento mobile, desenvolvimento de APIs, autenticação, comunicação entre sistemas e arquitetura cliente-servidor.

# 🏗️ Arquitetura

O aplicativo foi desenvolvido seguindo uma arquitetura baseada na separação entre **frontend mobile e backend**, utilizando uma abordagem cliente-servidor.

O aplicativo Flutter atua como cliente da aplicação, enquanto a API Java é responsável pelo processamento das requisições, regras de negócio e comunicação com os recursos do sistema.

```text
┌──────────────────────────────────────┐
│          Aplicativo Mobile           │
│                                      │
│            Flutter + Dart            │
│                                      │
│       Interface do usuário           │
└──────────────────┬───────────────────┘
                   │
                   │ HTTP / REST / JSON
                   │
                   ▼
┌──────────────────────────────────────┐
│             Backend API              │
│                                      │
│          Java + Spring Boot          │
│                                      │
│       Regras de negócio              │
│       Autenticação                   │
│       Endpoints REST                 │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│          Persistência de dados       │
│                                      │
│              Backend                 │
└──────────────────────────────────────┘

```


## Parte 3 — Flutter e Dart


# 📱 Frontend Mobile

O frontend da aplicação foi desenvolvido utilizando **Flutter e Dart**.

<p align="left">
  <img src="https://skillicons.dev/icons?i=flutter,dart" />
</p>

### Tecnologias principais

- Flutter
- Dart
- Material Design
- HTTP
- JSON
- REST API

O Flutter foi utilizado para desenvolver a aplicação mobile e suas interfaces, permitindo a construção de uma aplicação multiplataforma utilizando uma única base de código.

O Dart é utilizado como linguagem principal para implementação das telas, componentes, serviços e demais funcionalidades do aplicativo.


# 🔌 Comunicação com o Backend

O aplicativo realiza comunicação com uma **API REST desenvolvida em Java com Spring Boot**.

A comunicação entre frontend e backend ocorre através de requisições HTTP e troca de informações utilizando JSON.

Fluxo simplificado:

```text
Usuário
   │
   ▼
Aplicativo Flutter
   │
   │ HTTP Request
   ▼
API REST Java
   │
   ▼
Regras de negócio
   │
   ▼
Persistência
   │
   ▼
HTTP Response
   │
   ▼
Aplicativo Flutter
   │
   ▼
Interface do usuário
```


## Parte 5 — Autenticação e usuários


# 🔐 Autenticação e Usuários

A aplicação possui diferentes fluxos de acesso de acordo com o tipo de usuário.

O sistema contempla dois perfis principais:

- 👨‍⚕️ Fisioterapeuta
- 👤 Paciente

---

## 👨‍⚕️ Fisioterapeuta

O fisioterapeuta possui acesso aos recursos relacionados ao gerenciamento de seus pacientes e atendimentos.

Entre as funcionalidades estão:

- Login
- Cadastro
- Gerenciamento de pacientes
- Biblioteca de exercícios
- Compartilhamento de exercícios
- Agendamento de consultas
- Comunicação com pacientes
- Chat
- Videochamadas

---

## 👤 Paciente

O paciente possui uma área própria dentro da aplicação.

Entre os recursos disponíveis estão:

- Login
- Cadastro
- Visualização dos exercícios compartilhados
- Biblioteca de exercícios
- Acompanhamento dos exercícios
- Visualização de consultas
- Comunicação com o fisioterapeuta
- Chat
- Videochamadas

---

## 🔄 Fluxo de acesso

```text
                 Login
                   │
          ┌────────┴────────┐
          │                 │
          ▼                 ▼
   Fisioterapeuta        Paciente
          │                 │
          ▼                 ▼
 Recursos profissionais   Recursos do paciente
```


## Parte 6 — Gerenciamento de pacientes


# 👨‍⚕️ Gerenciamento de Pacientes

O aplicativo permite que o fisioterapeuta organize e acompanhe seus pacientes através da plataforma.

O gerenciamento estabelece uma relação entre o profissional e os pacientes atendidos.

Fluxo simplificado:

```text
Fisioterapeuta
      │
      ▼
   Pacientes
      │
      ├── Informações
      ├── Exercícios
      ├── Consultas
      └── Comunicação
```


## Parte 7 — Biblioteca e exercícios


# 🏋️ Biblioteca de Exercícios

Um dos principais recursos da aplicação é a **biblioteca de exercícios fisioterapêuticos**.

Os exercícios podem possuir diferentes tipos de conteúdo, incluindo:

- 🖼️ Imagens
- 🎥 Vídeos
- 📝 Informações descritivas

A biblioteca foi desenvolvida para facilitar a apresentação dos exercícios e auxiliar o paciente durante a execução das atividades recomendadas pelo fisioterapeuta.

---

## 📋 Compartilhamento de Exercícios

O fisioterapeuta pode selecionar exercícios e disponibilizá-los para seus pacientes.

Fluxo simplificado:

```text
Fisioterapeuta
      │
      ▼
Biblioteca de exercícios
      │
      ▼
Seleciona exercício
      │
      ▼
Seleciona paciente
      │
      ▼
Exercício disponibilizado
      │
      ▼
Paciente
```


## Parte 8 — Agendamento

# 📅 Agendamento de Consultas

O aplicativo também possui funcionalidades relacionadas ao **agendamento de consultas**.

O objetivo é permitir que fisioterapeuta e paciente tenham uma visão organizada dos compromissos relacionados ao atendimento.

Entre os recursos relacionados ao agendamento estão:

- Agendamento de consultas
- Visualização de consultas
- Organização dos horários
- Acompanhamento dos compromissos

O recurso faz parte da proposta de centralizar o acompanhamento do paciente dentro da aplicação.

# 💬 Chat

A aplicação possui um sistema de **chat** para comunicação entre fisioterapeutas e pacientes.

O recurso permite estabelecer uma comunicação direta entre os usuários da plataforma.

```text
┌────────────────┐             ┌────────────────┐
│ Fisioterapeuta │ ◄─────────► │    Paciente    │
└────────────────┘     Chat    └────────────────┘
```
```
┌─────────────────┐
│ Fisioterapeuta  │
│                 │
│       📹        │
└────────┬────────┘
         │
         │ Videochamada
         │
┌────────▼────────┐
│     Paciente    │
│                 │
│       📹        │
└─────────────────┘
```

## Parte 10 — Dependências Flutter


# 🧰 Bibliotecas e Dependências

Entre as principais dependências utilizadas no projeto estão:

```yaml
cupertino_icons: ^1.0.8
provider: ^6.1.5+1
http: ^1.5.0
encrypt: ^5.0.3
image_picker: ^1.2.0
intl: ^0.20.2
video_player: ^2.10.0
path_provider: ^2.1.5
path: ^1.9.0
qr_flutter: ^4.1.0
flutter_barcode_scanner: ^2.0.0
```

## Parte 11 — Tecnologias e funcionalidades

# 🧩 Principais Tecnologias

```text
Flutter
   │
   └── Dart
        │
        ├── Provider
        ├── HTTP
        ├── Encrypt
        ├── Image Picker
        ├── Video Player
        ├── QR Flutter
        ├── Barcode Scanner
        └── Path Provider

Backend
   │
   └── Java
   └── Spring Boot
   └── API REST
   └── JSON
   └── HTTP

Frontend
   │
   └── Flutter
   └── Dart
   └── Provider
   └── Material Design
```


## Parte 12 — Funcionalidades


# 📱 Principais Funcionalidades

| Funcionalidade | Descrição |
|---|---|
| 🔐 Autenticação | Login para fisioterapeutas e pacientes |
| 👨‍⚕️ Pacientes | Gerenciamento de pacientes |
| 🏋️ Exercícios | Biblioteca de exercícios |
| 🖼️ Imagens | Visualização de exercícios através de imagens |
| 🎥 Vídeos | Reprodução de vídeos de exercícios |
| 📋 Compartilhamento | Disponibilização de exercícios para pacientes |
| 📅 Consultas | Agendamento e visualização de consultas |
| 💬 Chat | Comunicação entre profissional e paciente |
| 📹 Videochamadas | Comunicação por vídeo |
| 📷 Imagens | Seleção e captura de imagens |
| 🔳 QR Code | Geração e utilização de QR Codes |
| 📱 Barcode | Leitura de códigos de barras |

# 🔄 Fluxo Geral da Aplicação

```text
                    ┌───────────────┐
                    │     Login     │
                    └───────┬───────┘
                            │
                 ┌──────────┴──────────┐
                 │                     │
                 ▼                     ▼
        ┌─────────────────┐   ┌─────────────────┐
        │ Fisioterapeuta  │   │    Paciente     │
        └────────┬────────┘   └────────┬────────┘
                 │                     │
        ┌────────┼────────┐            │
        │        │        │            │
        ▼        ▼        ▼            ▼
   Pacientes  Exercícios Consultas  Exercícios
        │        │        │            │
        │        │        └────────────┤
        │        │                     │
        └────────┴──────────┬──────────┘
                            │
                     ┌──────┴──────┐
                     │ Comunicação │
                     │             │
                     │ Chat        │
                     │ Videochamada│
                     └─────────────┘
```


## Parte 14 — Organização do projeto


# 🗂️ Organização do Projeto

O frontend foi organizado de forma a separar as diferentes responsabilidades da aplicação.

Uma estrutura conceitual do projeto pode ser representada da seguinte maneira:

```text
lib/
│
├── models/
│
├── services/
│
├── providers/
│
├── screens/
│
├── widgets/
│
├── utils/
│
└── main.dart
```

## Parte 15 — Desenvolvimento

# 🧑‍💻 Desenvolvimento

O projeto foi desenvolvido utilizando principalmente:

- **Flutter**
- **Dart**
- **Java**
- **Spring Boot**
- **API REST**
- **Git**

O frontend é responsável pela interface e interação com o usuário, enquanto o backend disponibiliza os serviços necessários através de uma API REST.

A comunicação entre as duas aplicações ocorre por meio de requisições HTTP e troca de dados estruturados em JSON.

# 🎓 Trabalho de Conclusão de Curso

Este projeto foi desenvolvido como parte do meu **Trabalho de Conclusão de Curso (TCC)** durante a graduação em **Engenharia de Software**.

O desenvolvimento envolveu conceitos relacionados ao desenvolvimento de aplicações mobile e à integração entre diferentes componentes de uma arquitetura cliente-servidor.

### Conhecimentos aplicados

- Desenvolvimento mobile
- Programação em Dart
- Desenvolvimento com Flutter
- Desenvolvimento de APIs REST
- Java e Spring Boot
- Arquitetura cliente-servidor
- Consumo de APIs
- Requisições HTTP
- Manipulação de JSON
- Autenticação de usuários
- Gerenciamento de estado
- Criptografia
- Manipulação de imagens
- Reprodução de vídeos
- Gerenciamento de arquivos
- Chat
- Videochamadas
- Integração entre frontend e backend

# 🚀 Objetivo do Projeto

O projeto foi desenvolvido com o objetivo de demonstrar como tecnologias de desenvolvimento mobile e backend podem ser integradas para criar uma solução voltada a um cenário real.

A proposta combina:

```text
        Flutter + Dart
              │
              ▼
       Aplicação Mobile
              │
              ▼
          REST API
              │
              ▼
       Backend Java
              │
              ▼
       Persistência
```

# 📌 Status do Projeto

> 🎓 Projeto desenvolvido como Trabalho de Conclusão de Curso (TCC).

<div align="center">
🩺 PhysioApp Flutter • Dart • Java • Spring Boot • REST API

Uma solução mobile para auxiliar fisioterapeutas e pacientes no acompanhamento de tratamentos.

</div>
