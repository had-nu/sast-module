# SAST Module
Este módulo fornece um serviço de análise estática de segurança (SAST) usando o Bearer. 
Ele é projetado para integração em pipelines CI/CD: O workflow GitHub Actions executará automaticamente o SAST em cada push ou pull request para a branch main.

## Estrutura
- `/src`: Código a ser analisado.
- `/config`: Configurações do Bearer.
- `/scripts`: Scripts utilitários.
- `/ci_cd`: Workflows para integração com GitHub Actions.

## Configuração
1. Instale o Docker em seu sistema.
2. Configure os arquivos em `/config`.

## Uso
- **Execução Local:**  
  ```bash
  ./scripts/app/run-sast.sh