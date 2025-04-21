# syntax=docker/dockerfile:1

FROM python:3.12-slim
WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PORT=8000

# Atualiza pip e instala uvicorn
RUN pip install --upgrade pip uvicorn[standard]

# Instala SDK mcp
COPY pyproject.toml .
COPY src/mcp ./src/mcp
RUN pip install .

# Instala exemplo simple-prompt
COPY examples/servers/simple-prompt /app/simple-prompt
RUN pip install /app/simple-prompt

# Expõe porta e define entrypoint
EXPOSE ${PORT}
CMD ["mcp-simple-prompt", "--transport", "sse", "--port", "8000"]
