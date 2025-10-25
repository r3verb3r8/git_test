FROM ghcr.io/astral-sh/uv:python3.13-alpine

ADD . .

RUN uv sync --locked --no-dev

CMD ["uv", "run", "main.py"]