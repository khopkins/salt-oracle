oracle_install_params:
      oracle_edition: "EE"
      oracle_home: '/opt/oracle/home'
      oracle_base: '/opt/oracle'
      oracle_dba_group: 'dba'
      oracle_oper_group: 'dba'
      datafile_dest: '/db/{{ grains['host'] }}_data01/'
      recoveryarea_dest: '/db/{{ grains['host'] }}_flra01/'
      gdbname: {{ grains['fqdn'] }}
      dbname: {{ grains['host'] }}
