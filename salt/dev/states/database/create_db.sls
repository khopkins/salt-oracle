include:
  - database.oracle_sw_only

oracle_create_db:

  file.managed:
    - name: '/opt/oracle/dbca.rsp'
    - source: salt://database/dbca.rsp
    - template: jinja
    - defaults:
      oracle_edition: {{ pillar['oracle_install_params']['oracle_edition'] }}
      oracle_home: '/opt/oracle/home'
      oracle_base: '/opt/oracle'
      oracle_dba_group: 'dba'
      oracle_oper_group: 'dba'
      gdbname: {{ grains['fqdn'] }}
      dbname: {{ grains['localhost'] }}
      sys_pwd: bobo
      system_pwd: bobo
      datafile_dest: '/db/alpha_data01/{{ grains['localhost'] }}/'
      recoveryarea_dest: '/db/alpha_flra01/{{ grains['localhost'] }}/'
      storage_type: 'FS'
      init_params:
      auto_memory_management: FALSE

  cmd.run:
    - name: '{{ pillar['oracle_install_params']['oracle_home'] }}/bin/dbca -silent -responseFile /{{ pillar['oracle_install_params']['oracle_base'] }}/dbca.rsp'
    - user: oracle
    - group: dba
    - require:
      - file: '{{ pillar['oracle_install_params']['oracle_base'] }}/oracle_sw_only.rsp'

