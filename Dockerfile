# NGINX 웹 서버가 설치된 Alpine 기반 이미지를 사용
FROM nginx:alpine

# 커스텀 이미지의 용도를 설명하는 메타데이터
LABEL org.opencontainers.image.title="codyssey-workstation-web"

# 내가 작성한 웹페이지를 NGINX의 웹 문서 폴더로 복사
COPY site/ /usr/share/nginx/html/

# 컨테이너의 웹 서버가 사용하는 포트를 문서화
EXPOSE 80
