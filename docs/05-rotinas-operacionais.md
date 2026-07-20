# Rotinas operacionais

## 1. Limpeza automática de armazenamento
Existe uma rotina de limpeza para impedir crescimento indefinido de artefatos temporários.

Política observada:
- downloads gerais: 90 dias
- áudios gerados: 30 dias
- screenshots/cache: 15 dias

Script observado:
- `cleanup-old-downloads-90d.sh`

Comportamento:
- remove arquivos vencidos
- não remove diretórios inteiros
- gera saída apenas quando há exclusões

## 2. Limpeza de screenshots web
Existe uma rotina separada para screenshots antigos do perfil web.

## 3. Agendamentos recorrentes
O ambiente utiliza cronjobs do próprio Hermes para:
- resumos periódicos
- tarefas de revisão operacional
- housekeeping local

## 4. Boas práticas operacionais
- manter artefatos baixados fora do versionamento
- não publicar bancos, logs, caches, downloads e arquivos de sessão
- validar envios com evidência real quando a operação tiver efeito externo
- usar perfis especialistas para tarefas longas ou sensíveis
