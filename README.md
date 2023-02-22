# Ansible Collection: `jeffkala.nautobot-eda`

EDA source plugin for Nautobot Changelogs

## Requirements

- Ansible >= 2.9


**Collections:**




## Examples

```yaml
---
- name: Example usage of the collection
  hosts: all

  collections:
    - jeffkala.nautobot-eda

  tasks:
    - import_role:
        name: nautobot-eda
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
