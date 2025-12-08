# ansible-repo

## Ansible playbook information

- To run playbooks on the inventory: `ansible-playbook playbook/all.yml`
- To run a playbook individually (trailing comma is important): `ansible-playbook playbook/debug.yml -i localhost,`

## Quick commands

- Test if hosts are reachable: `ansible all -m ping`
- List ansible information about a host: `ansible -m setup <hostname> | less`

## Older notes

**Run all commands in the ansible folder.**
Add `ansible-exe` to path:
`export PATH=$PATH:$(realpath ansible-exe/bin)`

Run command on all hosts:
`ansible-exe/bin/ansible -i ./hosts all -a "ls"`
Run command on only servers:
`ansible-exe/bin/ansible -i ./hosts master -a "ls"`
