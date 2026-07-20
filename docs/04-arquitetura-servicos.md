# Arquitetura de serviços

A stack observada em `docker-compose.yml` contém os seguintes serviços:

## 1. Proxy reverso
Função:
- terminar HTTP/HTTPS
- expor rotas públicas controladas
- encaminhar tráfego para os serviços internos

Tecnologia observada:
- Caddy 2.8

## 2. Banco de dados principal
Função:
- persistência relacional
- suporte ao ecossistema Hermes/n8n/Evolution
- armazenamento vetorial para RAG via pgvector

Tecnologia observada:
- PostgreSQL 16 com imagem `pgvector/pgvector`

## 3. Redis
Função:
- suporte auxiliar de cache/fila onde aplicável

Tecnologia observada:
- Redis 7.4

## 4. n8n
Função:
- automação de workflows
- entrada por webhook
- integração com mensageria e rotinas auxiliares

Tecnologia observada:
- n8n 1.121.3

## 5. Evolution API
Função:
- camada operacional de mensageria
- envio de texto e mídia
- suporte a fluxos como áudio/PTT

Tecnologia observada:
- Evolution API 2.3.7

## 6. Worker de RAG
Função:
- ingestão de arquivos
- geração de embeddings
- escrita no banco vetorial
- operação offline de modelos locais

Características observadas:
- embeddings locais com modelo em disco
- execução em CPU
- uploads montados via volume compartilhado

## Redes Docker
- `public` — rede exposta para serviços que precisam ingress público
- `internal` — rede interna isolada entre serviços

## Estado observado dos containers
No momento da coleta, estavam saudáveis:
- proxy reverso
- banco de dados
- redis
- n8n
- Evolution API
- worker de RAG
