# easy-mock 
源项目出现404等错误无法使用，故修改之。   
使用方式：

```yaml
version: '3'

services:
  mongodb:
    image: mongo:3.4.1
    volumes:
      # ./data/db 数据库文件存放地址，根据需要修改为本地地址
      - './data/db:/data/db'
    networks:
      - easy-mock
    restart: always
  redis:
    image: redis:4.0.6
    command: redis-server --appendonly yes
    volumes:
      # ./data/redis redis 数据文件存放地址，根据需要修改为本地地址
      - './data/redis:/data'
    networks:
      - easy-mock
    restart: always
  web:
    image: ghcr.io/liubaicai/easy-mock:latest
    command: /bin/bash -c "npm start"
    depends_on:
      - mongodb
      - redis
    ports:
      - 10000:7300
    volumes:
      # 日志地址，根据需要修改为本地地址
      - './logs:/app/easy-mock/logs'
    networks:
      - easy-mock
    restart: always

networks:
  easy-mock:
```