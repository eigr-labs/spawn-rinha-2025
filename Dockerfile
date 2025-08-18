FROM elixir:1.18.1-alpine AS builder

ENV MIX_ENV=prod

WORKDIR /app

RUN apk add --no-cache --update git build-base ca-certificates zstd gcc pkgconfig openssl-dev

RUN mkdir config
COPY config/ ./config
COPY lib/ ./lib
COPY priv/ /app/priv
COPY mix.exs .
COPY mix.lock .

RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix release.init

ENV RELEASE_DISTRIBUTION="name"

# Overriden at runtime
ENV POD_IP="127.0.0.1"

# This will be the basename of node
ENV RELEASE_NAME="rinha_payments"

# This will be the full nodename
ENV RELEASE_NODE="${RELEASE_NAME}@${POD_IP}"

RUN mix deps.get \
    && mix release rinha_payments

# ---- Application Stage ----
FROM alpine:3.20

RUN apk add --no-cache --update zstd ncurses-libs libstdc++ libgcc protobuf

WORKDIR /app
RUN chown nobody /app

ENV MIX_ENV=prod
ENV HOME=/app

COPY rel/overlays/mtls.ssl.conf .
COPY --from=builder --chown=nobody:root /app/_build/${MIX_ENV}/rel/rinha_payments ./
COPY priv/ /app/priv

RUN mkdir -p /app/.cache/bakeware/ && chmod 777 /app/.cache/bakeware/
RUN touch /.erlang.cookie && chmod 777 /.erlang.cookie
RUN touch /app/.erlang.cookie && chmod 777 /app/.erlang.cookie

USER nobody

ENTRYPOINT ["/app/bin/rinha_payments", "start"]