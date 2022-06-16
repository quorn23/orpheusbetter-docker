FROM cr.hotio.dev/hotio/base@sha256:4378603cfbdff1f02a33caee3e72e8e43d6236f4ac8461997f5ce142c59b3e4a

RUN apk add --no-cache python3 py3-lxml py3-packaging git mktorrent flac lame sox && \
    apk add --no-cache --virtual=build-dependencies py3-pip
	
COPY / "${APP_DIR}"

RUN pip3 install --no-cache-dir -r "${APP_DIR}"/requirements.txt
    
ARG VERSION
ARG GIT_BRANCH


RUN chmod -R u=rwX,go=rX "${APP_DIR}" && \
    echo "v${VERSION}" > "${APP_DIR}/version.txt" && \
    echo "${GIT_BRANCH}" > "${APP_DIR}/branch.txt" && \
    chmod +x "${APP_DIR}"/start.sh

ENTRYPOINT "${APP_DIR}"/start.sh
