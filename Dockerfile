FROM node:11.10.0
WORKDIR /usr/app
SHELL ["/bin/bash", "-c"]

COPY ./app ./

# Setup global node-modules.
ENV NODE_PATH=/usr/local/lib/node_modules
RUN node -e 'let dep = JSON.parse(fs.readFileSync("./simp/package.json")).dependencies; for(var k in dep) { console.log(`${k}@${dep[k]}`) };' | xargs npm install -g

# Setup initialization scripts.
RUN echo '. '$(pwd)'/init.sh' >> ~/.bashrc

# Setup entry.
RUN chmod +x ./entry.sh
ENTRYPOINT ["./entry.sh"]
CMD ". ./start.sh"
