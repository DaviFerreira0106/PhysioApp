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

### 🎨 Interface

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
