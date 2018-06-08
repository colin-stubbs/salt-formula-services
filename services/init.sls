# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "services/map.jinja" import services_map with context %}

{% for service_name in services_map.enable %}
service-{{ service_name }}-enable:
  service.running:
    - name: {{ service_name }}
    - enable: True
{% endfor %}

{% for service_name in services_map.disable %}
service-{{ service_name }}-disable:
  service.disabled:
    - name: {{ service_name }}
{% endfor %}

{% for service_name in services_map.start %}
service-{{ service_name }}-start:
  service.running:
    - name: {{ service_name }}
{% endfor %}

{% for service_name in services_map.stop %}
service-{{ service_name }}-stop:
  service.dead:
    - name: {{ service_name }}
{% endfor %}

{# EOF #}
