oracle:
{% for group_name,group_id in pillar.get('oracle_groups',{}).items() %}
{{ group_name }}:
  group.present:
    - name: {{ group_name }}
    - value: {{ group_id }}
{% endfor %}

  user.present:
    - name: oracle
    - uid: 555
    - gid: 557
    - home: /home/oracle
    - shell: /bin/zsh
    - groups:
      - dba
      - oracle
      - oper
      - oinstall

{% for required_pkg in pillar.get('oracle11_2_pkgs') %}
{{ required_pkg }}:
  pkg.installed:
    - name: {{ required_pkg }}
{% endfor %}

{% for sys_param_name,sys_param_value in pillar.get('oracle_sysctl',{}).items() %}
{{ sys_param_name }}:
  sysctl.present:
    - name: {{ sys_param_name }}
    - value: {{ sys_param_value }}
{% endfor %}
