### actual sh1t ###
FROM python:3.12.4-alpine3.20 AS pydep

ENV PATH="/server/virt/bin:$PATH"
ENV VIRTUAL_ENV="/server/virt"

WORKDIR /server
RUN python -m venv virt
RUN python -m pip install --upgrade pip
COPY ./req.txt .
RUN pip install --no-cache-dir -r req.txt


### actual sh2t ###
FROM python:3.12.4-alpine3.20 AS server

ENV MODE="dev"
ENV PORT="10011"

WORKDIR /server/app
COPY --from=pydep /server/virt ../virt
COPY ./app .

CMD source ../virt/bin/activate && python slave.py $MODE $PORT
