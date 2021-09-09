# Vue-rpg reverse-proxy

Laravel環境をDockerで構築する為の手順書

# 構成

| 名前 | バージョン |
| :--- | :---: |
| PHP | 8.0.3(php:8.0.3-fpm-alpine) |
| MySQL | 8.0 |
| Nginx | 1.19(nginx:1.19-alpine) |
| Laravel | 8.* |

---
# ローカル環境の構築(Mac)

## PHPのバージョン更新

```shell-session
$ brew search php@7
==> Formulae
php@7.2                    php@7.3                    php@7.4

$ brew install php@7.4
```

インストール中に下記のメッセージがある。
下記のメッセージを頼りに$PATHと設定する。

```shell-session
If you need to have apr first in your PATH run:
  echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.bash_profile
```
s
