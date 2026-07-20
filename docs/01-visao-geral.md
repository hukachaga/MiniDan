# Visão geral

## O que é o MiniDan
MiniDan é o agente principal do ambiente Hermes. Ele atua como:
- ponto de entrada das solicitações
- roteador para especialistas
- consolidador de respostas
- executor direto apenas de tarefas operacionais simples

## Modelo operacional
O desenho é de orquestração por perfis.

Em vez de concentrar tudo em um único agente, cada domínio relevante possui um profile próprio. O `main` quase nunca faz o trabalho especializado inteiro sozinho; ele envia a tarefa ao profile correto, recebe o retorno e entrega uma resposta limpa ao usuário.

## Princípios de funcionamento
- roteamento por domínio
- contexto autossuficiente em cada delegação
- validação com evidência real
- separação entre coordenação e execução especializada
- confirmação humana antes de ações externas irreversíveis
- sanitização antes de publicar artefatos técnicos

## Tipos de tarefa comuns
- operação web institucional
- emissão e validação de documentos
- automações de mensageria
- integração com agenda, e-mail e fluxos automatizados
- recuperação e organização de conhecimento via RAG
- manutenção operacional da própria VPS
