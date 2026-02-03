FROM ghcr.io/ggml-org/llama.cpp:server-b7903

RUN mkdir /models

ENV MODEL_PATH="/models/qwen2.5-coder-3b-instruct"

RUN curl -L 'https://huggingface.co/Qwen/Qwen2.5-Coder-3B-Instruct-GGUF/resolve/main/qwen2.5-coder-3b-instruct-q4_k_m.gguf' \
    --output "$MODEL_PATH"

COPY entrypoint.sh /app

RUN chmod +x /app/entrypoint.sh

EXPOSE 8080

ENTRYPOINT /app/entrypoint.sh