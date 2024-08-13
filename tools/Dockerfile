### actual sh1t ###
FROM python:3.12.4-alpine3.20 AS pydep

ENV PATH="/server/virt/bin:$PATH"
ENV VIRTUAL_ENV="/server/virt"

WORKDIR /server
RUN mkdir libs
RUN python -m venv virt
RUN python -m pip install --upgrade pip
COPY ./req.txt .
RUN pip install --no-cache-dir -r req.txt
RUN cp virt/lib/python3.12/site-packages/bottle* libs -r


### actual sh2t ###
FROM python:3.12.4-alpine3.20 AS app

ENV MODE="dev"
ENV PORT="10011"

WORKDIR /app
COPY ./app .
COPY --from=pydep /server/libs bugs

CMD python slave.py $MODE $PORT
