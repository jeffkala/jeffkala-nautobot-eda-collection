# Ansible Collection: `jeffkala.nautobot-eda`

Ansible Event Drive (EDA) source plugin for Nautobot. This source plugin monitors the Nautobot Changelog. As changes are made in Nautobot events will be produced. 

## Requirements

- Ansible >= 2.9
- [dependencies](./pyproject.toml)

## Simple Example

```yaml
---
- name: Watch for new changelog entries
  hosts: localhost
  sources:
    # Specifies the Nautobot instance, token, and the polling interval.
    - jeffkala.nautobot_eda.nautobot_changelog:
        instance: https://demo.nautobot.com)
        token: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        interval: 1

  # This section defines the rules logic to implement.  In this example its simply capturing all events that have the event.id defined.
  # event.id in this case is the changelog id.
  rules:
    - name: New changelog created
      condition: event.id is defined
      # Action is triggered if condition is `true`.
      action:
        # For simple examples just print the event as a debug message.
        debug:

```

For more examples of how to trigger on more unique changelog events seen [playbooks](./playbooks/)

---
## Example Event Output

```python
(
    "{'id': '0cc0b56a-3894-403b-9ffc-de65da564c60', 'display': 'dcim | device "
    "azd01-dist-01 updated by demo', 'url': "
    "'https://demo.nautobot.com/api/extras/object-changes/0cc0b56a-3894-403b-9ffc-de65da564c60/', "
    "'time': '2023-02-23T01:29:43.007930Z', 'user': {'display': 'demo', 'id': "
    "'49f4bf26-45f8-4661-8e77-1a728fea9f3a', 'url': "
    "'https://demo.nautobot.com/api/users/users/49f4bf26-45f8-4661-8e77-1a728fea9f3a/', "
    "'username': 'demo'}, 'user_name': 'demo', 'request_id': "
    "'b5a75f51-927d-49d2-94ee-4e64ef477e88', 'action': {'value': 'update', "
    "'label': 'Updated'}, 'changed_object_type': 'dcim.device', "
    "'changed_object_id': 'ce99c3d8-47da-4f79-b960-b2ac5e97b1a3', "
    "'changed_object': {'display': 'azd01-dist-01', 'id': "
    "'ce99c3d8-47da-4f79-b960-b2ac5e97b1a3', 'url': "
    "'https://demo.nautobot.com/api/dcim/devices/ce99c3d8-47da-4f79-b960-b2ac5e97b1a3/', "
    "'name': 'azd01-dist-01'}, 'object_data': {'face': '', 'name': "
    "'azd01-dist-01', 'rack': None, 'site': "
    "'be54682a-a877-4564-a396-ff4694986046', 'tags': [], 'serial': '', 'status': "
    "'afbc8eec-50e0-4d31-b875-1022c8208b7b', 'tenant': "
    "'a39f2dd8-84c8-4816-9e6f-4a7c46e91a77', 'cluster': None, 'created': "
    "'2022-11-09', 'comments': '', 'location': None, 'platform': "
    "'df107d2a-b84f-4a30-9e48-093e9ad9a550', 'position': None, 'asset_tag': None, "
    "'device_role': '8acdfbc3-c3ae-4b52-b8a3-f8766edce039', 'device_type': "
    "'09dbb4e4-b258-4614-a85a-125f5c5caa9e', 'primary_ip4': None, 'primary_ip6': "
    "None, 'vc_position': None, 'vc_priority': None, 'last_updated': "
    "'2023-02-23T01:29:42.935Z', 'custom_fields': {}, 'secrets_group': None, "
    "'virtual_chassis': None, 'local_context_data': None, 'local_context_schema': "
    "None, 'device_redundancy_group': None, 'device_redundancy_group_priority': "
    "None, 'local_context_data_owner_object_id': None, "
    "'local_context_data_owner_content_type': None}}"
)
```

---
## Testing

For testing guidelines see explanation see [Testing](tests/README.md)

---

## Development and Contribution Guidelines

It is a standard Ansible collection module. So best practices are found [here](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html).

Steps:

### Build and test collection

After creation/modifications of roles, playbooks, or other modules are done, build and install the collection locally.

```shell
invoke build
invoke local-install
```

Perform tests locally before commiting and generating a PR for review.

### Publish collection

This is currently in alpha for development purposes. Eventually this collection will most likely be bundled with `networktocode.nautobot` collection for easier use.
