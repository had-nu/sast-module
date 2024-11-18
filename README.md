# SAST Toolkit
Este módulo fornece um serviço de análise estática de segurança (SAST) usando o Bearer. 
Ele é projetado para integração em pipelines CI/CD: O workflow GitHub Actions executará automaticamente o SAST em cada push ou pull request para a branch main.

## Pré-requisitos
Antes de usar a ferramenta, é necessário ter os seguintes itens instalados:

- [Docker](https://www.docker.com/): A ferramenta utiliza o Docker para executar o processo de escaneamento.

## Estrutura
`sast-module/`
- `/config`: Configurações do Bearer.
- `/src`: Código-fonte a ser analisado.
- `/scripts`: Scripts utilitários.
- `/ci_cd`: Workflows para integração com GitHub Actions.

### Arquivos Importantes
- `config/bearer-config.yml`: Arquivo de configuração do Bearer para definir as regras e opções do scan.
    - rules: Definem as regras de escaneamento e sua severidade.
    - scan: Diretório e tipos de arquivos a serem escaneados.
    - output: Formato e local de saída do relatório.
- `src/`: Diretório onde o código-fonte a ser escaneado deve ser colocado.

## Configuração
1. Instale o Docker em seu sistema.
2. Configure as regras e oções do scan do Bearer em `/config`.
    Nota: Por padrão, o comando `scan` usa a varredura SAST, entretanto outros tipos de varredura estão disponíveis. Consulte a [documentação oficial](https://docs.bearer.com/explanations/scanners) do Bearer.

- **Docker Compose**
  ```bash
  docker-compose run --rm sast-toolkit

## Relatórios de Saída
O relatório de escaneamento será gerado em JSON e ficará disponível no diretório de resultados dentro do contêiner. Você pode acessá-lo na pasta results após a execução do scan.

### Testando a Ferramenta
Disponibilizamos por padrão o [OWASP Juice Shop](https://github.com/juice-shop/juice-shop/fork) no diretório `src/`, como uma maneira mais fácil de experimentar o Bearer CLI em uma simulação de aplicação JavaScript realista com falhas de segurança comuns. Ao executar o comando `docker-compose`, a ferramenta vai scanear o conteúdo do diretório `src/` automaticamente.

#### Analisando os Relatórios

O relatório de segurança é uma visão facilmente digerível dos problemas de segurança detectados pelo Bearer CLI. Um relatório é composto por:

- A lista de [regras](https://docs.bearer.com/reference/rules/) executadas em seu código.
- Cada descoberta detectada, contendo o local do arquivo e as linhas que acionaram a descoberta da regra.
- Uma seção de estatísticas com um resumo das verificações de regras, descobertas e avisos.

O OWASP Juice Shop acionará descobertas de regras e produzirá um relatório completo. Eis um exemplo de uma seção da saída:

```
...
HIGH: Sensitive data stored in HTML local storage detected. [CWE-312]
https://docs.bearer.com/reference/rules/javascript_lang_session
To skip this rule, use the flag --skip-rule=javascript_lang_session

File: juice-shop/frontend/src/app/login/login.component.ts:102

 102       localStorage.setItem('email', this.user.email)


=====================================

59 checks, 40 findings

CRITICAL: 0
HIGH: 16 (CWE-22, CWE-312, CWE-798, CWE-89)
MEDIUM: 24 (CWE-327, CWE-548, CWE-79)
LOW: 0
WARNING: 0
```
Além do relatório de segurança, você também pode executar um [relatório de privacidade](https://docs.bearer.com/explanations/reports/#privacy-report).

Opções adicionais para usar e configurar o comando `scan` podem ser encontradas em [configurando o comando scan](https://docs.bearer.com/guides/configure-scan/).

---

## Contribuindo

Contribuições são bem-vindas! Este é um projeto em construção de um estudante, então seja legal. 
Por favor, siga as diretrizes no arquivo `CONTRIBUTING.md` para submeter issues ou pull requests.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

