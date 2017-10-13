#!/bin/bash

# nginx 源配置文件下载地址
repo_url="https://github.com/mrhuangyuhui/nginx-practice/raw/master/"
repo_file="/etc/yum.repos.d/nginx.repo"

# 下载源配置文件
function down_repo_file()
{
   # 如果源配置文件已经存在则删除
   if [ -e "${repo_file}" ]
   then
      rm -f "${repo_file}"
   fi
   wget -O "${repo_file}" "${repo_url}"
}

# 打印脚本的使用方法
function print_script_usage() {
   echo "脚本的使用方法：./${0} centos6 或 ./${0} centos7"
}

if [ "${#}" -eq 1 ]
then
   case "${1}" in
      centos6 | centos7)
         repo_url="${repo_url}nginx-${1}.repo"
         down_repo_file
         exit 0
         ;;
      *)
         echo "错误：脚本参数不正确。"
         print_script_usage
         exit 1
         ;;
   esac
else
   echo "错误：脚本参数的数量不正确，脚本只接受一个参数。"
   print_script_usage
   exit 1
fi

# 安装 nginx
# yum install -y nginx

# 打印 nginx 版本信息
# nginx -v
