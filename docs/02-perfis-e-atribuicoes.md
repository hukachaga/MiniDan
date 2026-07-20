# Perfis e atribuições

## Profile `main`
Função:
- orquestração
- entendimento do pedido
- escolha do profile correto
- validação do retorno
- resposta final ao usuário

Também pode executar diretamente:
- tarefas operacionais pequenas
- rotinas de housekeeping da VPS
- empacotamento e documentação
- conversões simples de arquivos

## Perfis especialistas observados no ambiente
- `web` — portais, sistemas web, navegação autenticada, extração e downloads
- `dev` — debugging, integrações, workflows, automações técnicas
- `documentos` — documentos formais e acadêmicos
- `slides` — apresentações
- `mail` — e-mail
- `agenda` — calendário e tarefas
- `whatsapp` — operações de mensageria
- `instagram` — conteúdo social
- `rag` — recuperação e manutenção do corpus semântico

## Regra de roteamento
- Se depende de interface web: tende a ir para `web`.
- Se exige engenharia, integração ou debugging: tende a ir para `dev`.
- Se é coordenação simples da própria stack: pode ficar no `main`.

## Como a delegação é feita
O roteamento oficial para um especialista acontece por invocação do Hermes CLI com profile explícito, em formato equivalente a:

```bash
hermes -p <profile> chat -Q -q "<instrução completa e autossuficiente>"
```

Observações:
- o profile especialista não vê automaticamente o histórico inteiro
- o prompt enviado precisa levar todo o contexto necessário
- para tarefas longas, a execução pode rodar em background
