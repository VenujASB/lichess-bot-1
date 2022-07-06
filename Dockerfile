FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt-get install -y wget unzip python3 python3-pip p7zip > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/main/Goi5.1.bin.7z" -O Goi5.1.bin.7z \
&& 7zr e Goi5.1.bin.7z && rm Goi5.1.bin.7z && mv Goi5.1.bin engines/books/Goi5.1.bin

RUN wget -U "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36" --no-check-certificate "https://onedrive.live.com/download?cid=547CCA53C39C1EA1&resid=547CCA53C39C1EA1%21599&authkey=AMLXM4n_ZwOk7VQ" -O cubail.7z
RUN 7zr e cubail.7z && rm cubail.7z

RUN wget https://zipproth.de/Brainfish/Cerebellum_Light_3Merge_200916.7z -O Cerebellum.7z
RUN 7zr e Cerebellum.7z && rm Cerebellum.7z

#RUN wget --no-check-certificate -nv "https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip" -O chess-engine.zip \
#&& wget --no-check-certificate -nv "https://tests.stockfishchess.org/api/nn/nn-3475407dc199.nnue" -O nn-3475407dc199.nnue \
#&& 7z e stockfish.zip && rm stockfish.zip && mv stockfish* /engines/stockfish

#RUN wget https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip -O stockfish.zip
#RUN unzip stockfish.zip && rm stockfish.zip

RUN chmod +x engines/stockfish
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u
