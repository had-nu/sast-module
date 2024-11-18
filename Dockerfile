FROM bearer/bearer:latest
WORKDIR /app
COPY ./src /app/src
COPY ./config /app/config
ENTRYPOINT ["bearer", "scan", "--config-file", "/app/config/bearer-config.yml", "/app/src"]

# O que este Dockerfile faz:
    # Define a imagem base do Bearer CLI
    # Define o diretório de trabalho
    # Copia os arquivos necessários para o contêiner (opcional)
    # Executa o comando padrão para executar análises
