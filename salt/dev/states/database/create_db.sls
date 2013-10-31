include:
  - database.oracle_sw_only

oracle_create_db:

  file.managed:
    - name: '{{ pillar['oracle_install_params']['oracle_base'] }}/dbca.rsp'
    - source: salt://database/dbca.rsp
    - template: jinja
    - defaults:
      oracle_edition: {{ pillar['oracle_install_params']['oracle_edition'] }}
      oracle_home: '/opt/oracle/home'
      oracle_base: '/opt/oracle'
      oracle_dba_group: 'dba'
      oracle_oper_group: 'dba'
      gdbname: {{ pillar['oracle_install_params']['gdbname'] }}
      dbname: {{ pillar['oracle_install_params']['dbname'] }} 
      sys_pwd: bobo
      system_pwd: bobo
      datafile_dest: {{ pillar['oracle_install_params']['datafile_dest'] }} 
      recoveryarea_dest: {{ pillar['oracle_install_params']['recoveryarea_dest'] }} 
      storage_type: 'FS'
      init_params:
      auto_memory_management: FALSE

  cmd.run:
    - name: '{{ pillar['oracle_install_params']['oracle_home'] }}/bin/dbca -silent -responseFile /{{ pillar['oracle_install_params']['oracle_base'] }}/dbca.rsp'
    - user: oracle
    - group: dba
    - require:
      - file: '{{ pillar['oracle_install_params']['oracle_base'] }}/dbca.rsp'
    - unless: 'test -f /etc/oratab'

