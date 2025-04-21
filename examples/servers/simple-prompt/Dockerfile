# syntax=docker/dockerfile:1

FROM python:3.12-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PORT=8000

# Copia configurações e fontes do pacote
COPY pyproject.toml ./
COPY mcp_simple_prompt/ ./mcp_simple_prompt/

# Instala dependências e o pacote
RUN pip install --upgrade pip \
    && pip install "uvicorn[standard]" \
    && pip install .

# Porta do servidor
EXPOSE ${PORT}

# Comando padrão para rodar o app
CMD ["mcp-simple-prompt", "--transport", "sse", "--port", "8000"]
