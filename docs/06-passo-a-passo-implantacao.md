# Passo a passo de implantação

> Este roteiro é sanitizado. Substitua placeholders pelos valores reais no seu ambiente.

## Visão geral da implantação
A implantação combina:
1. preparo do host Linux
2. instalação do Hermes CLI/ambiente Python
3. organização dos perfis Hermes
4. subida da stack Docker Compose
5. configuração dos workflows e integrações
6. validação operacional
7. housekeeping e publicação segura

---

## Etapa 1 — Preparar o host

### 1.1 Atualizar o sistema
```bash
sudo apt update && sudo apt upgrade -y
```

### 1.2 Instalar dependências base
```bash
sudo apt install -y \
  git curl wget unzip zip jq ffmpeg \
  python3 python3-venv python3-pip \
  ca-certificates
```

### 1.3 Instalar Docker e Compose plugin
Siga o procedimento oficial do Docker para sua distribuição.

Verificação:
```bash
docker --version
docker compose version
```

---

## Etapa 2 — Preparar diretórios de trabalho

Exemplo de estrutura:
```text
/opt/hermes-stack/
~/.hermes/profiles/
```

Criar diretórios principais:
```bash
sudo mkdir -p /opt/hermes-stack
mkdir -p ~/.hermes/profiles
```

---

## Etapa 3 — Instalar/configurar o Hermes

### 3.1 Criar ambiente Python isolado
```bash
python3 -m venv ~/venvs/hermes
source ~/venvs/hermes/bin/activate
```

### 3.2 Instalar o Hermes Agent
Use o método oficial do projeto/versão adotada.

Exemplo genérico:
```bash
pip install -U hermes-agent
```

### 3.3 Validar a CLI
```bash
hermes --help
```

---

## Etapa 4 — Criar os perfis

Estruture os perfis por domínio. Exemplo observado:
- `main`
- `web`
- `dev`
- `documentos`
- `slides`
- `mail`
- `agenda`
- `whatsapp`
- `instagram`
- `rag`

Princípio:
- `main` orquestra
- especialistas executam

Configurar prompts, skills e permissões por profile conforme a responsabilidade de cada um.

---

## Etapa 5 — Subir a stack Docker

### 5.1 Preparar arquivos
Na stack, mantenha pelo menos:
- `docker-compose.yml`
- `.env` (não publicar)
- diretórios de `data/`, `uploads/`, `configs/` e scripts auxiliares

### 5.2 Preencher variáveis sensíveis
Defina no `.env` valores como:
- usuários e senhas de banco
- chaves de API
- domínios
- segredos de criptografia
- timezone

### 5.3 Subir os containers
```bash
cd /opt/hermes-stack
docker compose up -d
```

### 5.4 Conferir saúde
```bash
docker ps
docker compose logs --tail=100
```

---

## Etapa 6 — Integrar os serviços

### 6.1 Proxy reverso
- configurar hostnames públicos
- ativar TLS
- restringir acesso conforme necessário

### 6.2 Banco e pgvector
- garantir criação das extensões necessárias
- separar schemas quando fizer sentido

### 6.3 n8n
- apontar para PostgreSQL
- configurar URL base, webhooks e chave de criptografia
- importar/exportar workflows com cuidado

### 6.4 Evolution API
- configurar autenticação
- conectar ao banco
- validar operação de texto e mídia

### 6.5 Worker de RAG
- montar diretório de uploads
- apontar para o banco
- fornecer modelo local ou remoto de embeddings
- validar ingestão ponta a ponta

---

## Etapa 7 — Criar rotinas de manutenção

### 7.1 Housekeeping local
Implementar scripts para:
- limpeza de downloads
- limpeza de áudios temporários
- limpeza de screenshots e caches

### 7.2 Agendar execuções
Exemplo de política observada:
- housekeeping diário em horário de baixa atividade

### 7.3 Testar antes de automatizar
Sempre execute os scripts manualmente antes de agendar.

---

## Etapa 8 — Validar os fluxos principais

Checklist mínimo:
- `main` responde e roteia
- `web` consegue operar navegação autenticada
- `dev` consegue inspecionar/ajustar workflows
- `whatsapp` ou rota operacional equivalente consegue enviar texto
- envio de áudio/PTT funciona com formato compatível
- RAG responde consultas usando corpus indexado
- cronjobs disparam sem erro

---

## Etapa 9 — Preparar para GitHub

Nunca subir:
- `.env`
- logs
- bancos SQLite/Postgres dumps não sanitizados
- caches
- downloads
- áudios gerados
- dados de sessão
- arquivos com webhooks, IPs e chaves reais

Antes de publicar:
- revisar nomes próprios
- trocar domínios por placeholders
- remover IDs de contato e grupos
- substituir segredos por `<REDACTED>`
