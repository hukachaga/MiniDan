# MiniDan / Hermes Stack

Documentação pública sanitizada de um ambiente Hermes com orquestração por perfis, automações auxiliares e stack Docker para operação de agentes e integrações.

## Estrutura
- `docs/01-visao-geral.md`
- `docs/02-perfis-e-atribuicoes.md`
- `docs/03-infra-vps.md`
- `docs/04-arquitetura-servicos.md`
- `docs/05-rotinas-operacionais.md`
- `docs/06-passo-a-passo-implantacao.md`
- `docs/07-publicacao-no-github.md`
- `scripts/cleanup-storage.sh`
- `.env.example`
- `.gitignore`

## O que este repositório mostra
- como o agente principal funciona
- como os perfis especialistas são organizados
- visão sanitizada da infraestrutura
- arquitetura da stack Docker
- rotinas operacionais e housekeeping
- passo a passo de implantação

## O que este repositório não inclui
- segredos
- credenciais
- `.env` real
- logs
- bancos
- downloads operacionais
- caches de navegador ou sessão
- identificadores reais de usuários, contatos, grupos ou webhooks

## Uso recomendado
1. Leia `docs/06-passo-a-passo-implantacao.md`.
2. Preencha `.env.example` em um `.env` local com seus próprios valores.
3. Ajuste os perfis Hermes para o seu contexto.
4. Revise `scripts/cleanup-storage.sh` antes de ativar em produção.

## Aviso
Este pacote foi preparado para publicação pública. Mesmo assim, faça revisão manual final antes de subir para o GitHub.
