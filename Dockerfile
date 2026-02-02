FROM ghcr.io/ggml-org/llama.cpp:server-b7903

RUN mkdir /model

RUN curl 'https://huggingface.co/Qwen/Qwen2.5-Coder-3B-Instruct-GGUF/resolve/main/qwen2.5-coder-3b-instruct-q4_k_m.gguf' \
    -O '/models/qwen2.5-coder-3b-instruct'

EXPOSE 8080

CMD [ "/app/llama-server", "-m", "/models/qwen2.5-coder-3b-instruct" ]