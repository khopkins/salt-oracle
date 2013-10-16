{% if grains['os'] == 'CentOS' %}
oracle_groups:
   oinstall: 501
   oper: 503
   asmadmin: 504
   asmdba: 506
   asmoper: 507
   dba: 557
   oracle: 555
{% endif %}
