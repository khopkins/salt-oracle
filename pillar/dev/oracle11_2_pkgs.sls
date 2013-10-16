{% if grains['os'] == 'CentOS' %}
oracle11_2_pkgs:
  - binutils
  - glibc
  - nss-softokn-freebl
  - compat-libstdc++-33
  - glibc-common
  - glibc-devel
  - glibc-headers
  - elfutils-libelf
  - elfutils-libelf-devel
  - gcc
  - gcc-c++
  - ksh
  - libaio
  - libaio-devel
  - libgcc
  - libstdc++
  - libstdc++-devel
  - make
  - numactl-devel
  - sysstat
{% endif %}
