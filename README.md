# Ansible Collection: `jeffkala.nautobot-eda`

EDA source plugin for Nautobot Changelogs

## Requirements

- Ansible >= 2.9


## Examples

```yaml
---
- name: Watch for new changelog entries
  hosts: localhost
  sources:
    - jeffkala.nautobot_eda.nautobot_changelog:
        instance: https://demo.nautobot.com)
        token: aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        interval: 1
  rules:
    - name: New changelog created
      condition: event.id is defined
      action:
        debug:
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

TBD
