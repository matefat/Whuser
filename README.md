# Whuser

**Whuser** é um aplicativo Flutter que consome a [RandomUser API](https://randomuser.me/) para exibir informações de pessoas aleatórias em tempo real, atualizando automaticamente a cada 5 segundos e persistindo o usuário.  
O app utiliza **MVVM**, **Repository Pattern**, **Orientação a Objetos** e **Persistência Local**, permitindo consultar a lista de usuários mesmo offline.

---

## Funcionalidades

- **Atualização automática** a cada 5 segundos (usando `Ticker`, não `Timer`)
- **Lista de usuários** obtidos da API RandomUser
- **Persistência local** (usuários salvos utilizando Hive)
- **Tela de detalhes** com informações completas (agrupadas por grupos e expansíveis/retráteis utilizando ExpansionTile)
- **Remover usuário** da persistência
- **Interface limpa e responsiva**
- **Arquitetura MVVM** + **Repository Strategy**

---

## Tecnologias

| Biblioteca | Função |
|-------------|--------|
| [Dio](https://pub.dev/packages/dio) | Cliente para consulta da API |
| [Provider](https://pub.dev/packages/provider) | Gerenciamento de estado |
| [Ticker](https://api.flutter.dev/flutter/scheduler/Ticker-class.html) | Atualização periódica |
| [GetX](https://pub.dev/packages/get) | Snackbars customizadas |
| [Hive / Hive Flutter](https://pub.dev/packages/hive_flutter) | Persistência local rápida e offline (NoSQL) |

---

## Padrões utilizados

- **MVVM (Model-View-ViewModel)**  
  ViewModels responsáveis por intermediar a lógica e o estado.

- **Repository Strategy**  
  Os dados são abstraídos em um repositório que decide entre origem local ou remota.

- **Orientação a Objetos**  
  Modelos, repositórios e datasources são implementados como classes bem definidas, respeitando princípios de encapsulamento.

---

## Telas

| Tela | Descrição |
|------|------------|
| **Home** | Lista de usuários da API, atualiza a cada 5s |
| **Detalhes** | Exibe todas as informações agrupadas (identidade, localização, login, etc.) |
| **Persistidos** | Lista de usuários salvos localmente, com opção de remoção |

---

## Observações técnicas

- Foi optado pela utilização do Hive por ser um banco NoSQL que possui mais desempenho em casos como esse, não sendo necessário a criação de diversas tabelas e conversão de objetos em queries SQL.
- O ícone foi gerado com inteligência artificial e os arquivos necessários para substituição no projeto foram obtidos com auxílio do appicon.co.
- A splash screen nativa foi configurada manualmente para ter a mesma cor de fundo primária do app e utilizar o ícone, porém com fundo transparente.
- Foram criados no arquivo theme.dart dois temas ( Light e Dark), sendo os mesmos aplicados automaticamente conforme a configuração do tema do dispositivo.
- Foram criados alguns Widgets reaproveitáveis no diretorio widgets, facilitando a reutilização dos mesmos e reduzindo boilerplate.
  
## Autor

Mateus Trierveiler
