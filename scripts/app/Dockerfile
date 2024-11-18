FROM alpine:latest
RUN apk add --no-cache bash curl
RUN curl -L https://github.com/Bearer/bearer/releases/download/vX.Y.Z/bearer_X.Y.Z_linux_amd64.tar.gz | tar xz -C /usr/local/bin
WORKDIR /app
COPY /src /app/src
COPY /config /app/config
ENTRYPOINT ["bearer", "scan"]

# O que este Dockerfile faz:
    # Define a imagem base
    # Instala as dependências necessárias (opcional para o Bearer)
    # Baixa e configura o Bearer CLI
    # Define o diretório de trabalho
    # Copia os arquivos necessários para o contêiner (opcional)
    # Executa o comando padrão para executar análises
