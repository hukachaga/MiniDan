# Infraestrutura disponível na VPS

## Sistema operacional
- Distribuição: Ubuntu 24.04 LTS
- Kernel: Linux 6.8.x
- Arquitetura: x86_64
- Python do host: 3.11.x

## Capacidade observada no momento do levantamento
- RAM total: ~7.8 GiB
- Swap: ~4 GiB
- Disco do volume principal: ~96 GiB
- Uso observado no momento da coleta: ~55%

> Esses números são uma fotografia do ambiente no momento da documentação. Não são garantia permanente de capacidade disponível.

## Diretórios relevantes
- `~/.hermes/profiles/` — perfis do Hermes
- `/opt/hermes-stack/` — stack Docker Compose e componentes auxiliares
- `/root/Downloads` — downloads locais do profile principal / sessão
- `/root/voice-memos` — áudios gerados para respostas e operações

## Perfis presentes no ambiente documentado
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
