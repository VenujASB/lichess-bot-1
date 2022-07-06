FROM ubuntu:jammy
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log


WORKDIR /

RUN wget -U "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36" --no-check-certificate "https://onedrive.live.com/download?cid=547CCA53C39C1EA1&resid=547CCA53C39C1EA1%21599&authkey=AMLXM4n_ZwOk7VQ" -O cubail.7z
RUN 7z e cubail.7z && rm cubail.7z

RUN wget --no-check-certificate "https://github.com/iamhajemi/Stockfish/archive/refs/heads/main.zip" -O chess-engine.zip \
&& 7z e chess-engine.zip  -o\engines && rm chess-engine.zip && mv ./engines/stub engines/chess-engine

# RUN wget --no-check-certificate -nv "https://abrok.eu/stockfish/builds/c2aaaa65f97d4cd5fc06f19ce8d158d85dcd7a7b/linux64bmi2/stockfish_22070513_x64_bmi2.zip" -O chess-engine.zip \
# && 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* engines/chess-engine



RUN chmod +x ./engines/chess-engine
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py
