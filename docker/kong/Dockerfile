FROM kong:3.8.0

# ENV KONG_DATABASE="off" \
ENV KONG_DATABASE="postgres" \
    KONG_PG_HOST="db" \
    KONG_PG_PORT="5432" \
    KONG_PG_USER="ushms" \
    KONG_PG_PASSWORD="IIEvAIBADANBgkqhkiG" \
    KONG_DECLARATIVE_CONFIG="/usr/local/kong/declarative/kong.yml" \
    KONG_PROXY_LISTEN="0.0.0.0:8000" \
    KONG_PROXY_LISTEN_SSL="0.0.0.0:8443" \
    KONG_ADMIN_LISTEN="0.0.0.0:8001" \
    KONG_ADMIN_GUI_LISTEN="0.0.0.0:8002" \
    KONG_ADMIN_GUI_SSL="on" \
    KONG_ADMIN_GUI_SSL_CERT="/usr/local/kong/ssl/admin-gui-kong-default.crt" \
    KONG_ADMIN_GUI_SSL_CERT_KEY="/usr/local/kong/ssl/admin-gui-kong-default.key" \
    KONG_PROXY_ACCESS_LOG="/dev/stdout" \
    KONG_ADMIN_ACCESS_LOG="/dev/stdout" \
    KONG_PROXY_ERROR_LOG="/dev/stderr" \
    KONG_LOG_LEVEL="debug"

# Copy the declarative configuration file
COPY ./conf/kong.yml /usr/local/kong/declarative/kong.yml
USER kong

CMD ["kong", "start"]


# # Ensure SSL certificates are present (if needed for SSL in Admin GUI)
# # COPY ./ssl/admin-gui-kong-default.crt /usr/local/kong/ssl/
# # COPY ./ssl/admin-gui-kong-default.key /usr/local/kong/ssl/


