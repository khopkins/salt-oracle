include:
  - database.oracle

oracle_sw_only:

  file.managed:
    - name: '/opt/oracle/oracle_sw_only.rsp'
    - source: salt://database/swonly_install.rsp
    - template: jinja
    - defaults:
      oracle_edition: {{ pillar['oracle_install_params']['oracle_edition'] }} 
      oracle_home: '/opt/oracle/home'
      oracle_base: '/opt/oracle'
      oracle_dba_group: 'dba'
      oracle_oper_group: 'dba'

  cmd.run:
    - name: '/install/database/runInstaller -silent -responseFile /opt/oracle/oracle_sw_only.rsp'
    - user: oracle
    - group: dba
    - require:
      - file: '{{ pillar['oracle_install_params']['oracle_base'] }}/oracle_sw_only.rsp'
    - unless: "file -f /opt/oracle/oraInventory/oraInst.loc"

