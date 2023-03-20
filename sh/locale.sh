#!/bin/bash
localectl set-locale LANG=zh_CN.UTF-8
echo "export LANGUAGE='en'" >> ~/.zshrc
echo "alias en='LANGUAGE=en zsh'" >> ~/.zshrc
echo "alias cn='LANGUAGE=zh_CN zsh'" >> ~/.zshrc
#echo "alias setproxy='export all_proxy=socks5://127.0.0.1:1089 && export http_proxy=http://127.0.0.1:8889/ && export https_proxy=http://127.0.0.1:8889/'" >> ~/.zshrc
#echo "alias unsetproxy='unset all_proxy && unset http_proxy && unset https_proxy'" >> ~/.zshrc
