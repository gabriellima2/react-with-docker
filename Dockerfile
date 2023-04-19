FROM node:18-alpine

# Cria o diretório /app
RUN mkdir -p /app

# Entra para o diretório /app. (O comando acima pode ser apagado, pois ele criará o dir, caso não exista)
WORKDIR /app

# Copia os arquivos de deps para a raiz(/app) do container
COPY package.json package-lock.json ./

#  Instala as deps
RUN npm i

# Copia os arquivos local para a raiz(/app) do container
COPY . ./

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para executar o server no modo desejado, no caso dev
CMD ["npm", "run", "dev"]
