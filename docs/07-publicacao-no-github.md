# Publicação no GitHub

## O que pode subir
- documentação sanitizada
- scripts genéricos sem segredos
- exemplos de arquitetura
- exemplos de workflows com placeholders
- templates de `.env.example`
- guias de implantação

## O que não deve subir
- `.env`
- credenciais reais
- nomes de usuários reais
- logs operacionais brutos
- prints com dados institucionais ou pessoais
- bancos de dados
- arquivos baixados de portais
- mídias trocadas via mensageria
- caches do navegador e do Hermes

## Sugestão de `.gitignore`
```gitignore
.env
.env.*
data/
uploads/
logs/
*.db
*.db-shm
*.db-wal
cache/
Downloads/
voice-memos/
sessions/
cron/output/
```

## Sugestão de arquivos públicos
- `README.md`
- `docs/`
- `docker-compose.example.yml`
- `.env.example`
- `scripts/cleanup-storage.sh`
- `docs/deployment.md`

## Nota de segurança
Mesmo após sanitização, revise manualmente o material antes de publicar. Em ambiente de automação institucional, pequenos vazamentos costumam aparecer em:
- exemplos de comando
- URLs de webhook
- nomes de grupos/contatos
- paths com nomes próprios
- screenshots
