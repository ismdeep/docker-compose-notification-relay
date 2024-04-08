services:
  ${NOTIFICATION_RELAY_CONTAINER_NAME}:
    container_name: ${NOTIFICATION_RELAY_CONTAINER_NAME}
    image: ismdeep/notification-relay:latest
    environment:
      FORWARD_TARGETS: https://notification.ismdeep.com
      FORWARD_SECURE_PIPE_AES_KEY: '${FORWARD_SECURE_PIPE_AES_KEY}'
      FORWARD_SECURE_PIPE_TOKEN: '${FORWARD_SECURE_PIPE_TOKEN}'
      AUTHORIZATION_RELAY_AUTH: '${AUTHORIZATION_RELAY_AUTH}'
    ports:
      - '${NOTIFICATION_RELAY_PORT}:80'
    restart: always
