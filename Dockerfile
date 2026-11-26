FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY progress-site.html /usr/share/nginx/html/index.html

COPY "Лицензия УФСБ.pdf" /usr/share/nginx/html/docs/license-ufsb.pdf
COPY "Лицензия МЧС на 04.08.2026.pdf" /usr/share/nginx/html/docs/license-mchs.pdf
COPY "СРО стройка от 06.10.2026.pdf" /usr/share/nginx/html/docs/license-sro-build.pdf
COPY "СРО проект от 03.06.2026.pdf" /usr/share/nginx/html/docs/license-sro-project.pdf
COPY "СВ-во электолаб. от 05.07.2024.pdf" /usr/share/nginx/html/docs/license-electro-lab.pdf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost/ || exit 1
