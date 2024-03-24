# Task 2 - Ansible Skills Test

#### Task name: Ansible

### Task Description

Manage Ansible scripts

## Task Execution

1. Connect to your DEVASC virtual machine and start your virtual router
2. Create an Ansible playbook for your virtual router:
   a. Collect information about IOS version
   b. Collect information about L3 interfaces
   c. Configure the logging buffer with a size of 5000 bytes
3. Adapt the Ansible scripts described in the urls shown under task source file in such a way that it can be executed as a playbook. It may be necessary to remove “cisco.ios” in the module reference of the task. Also, it does not matter if some commands are deprecated. This is related to the specific Ansible version in the virtual machine.
4. Name the playbook ios_facts
5. Run the playbook in your DEVASC virtual machine
6. Take screenshots indicating the success of your actions, save and upload your script files

Task source files

- URL2a: [Run commands on remote devices running Cisco IOS](https://docs.ansible.com/ansible/latest/collections/cisco/ios/ios_command_module.html#examples)

- URL2b: [Collect facts from remote devices running Cisco IOS](https://docs.ansible.com/ansible/latest/collections/cisco/ios/ios_facts_module.html#ansible-collections-cisco-ios-ios-facts-module)

- URL2c: [Logging resource module](https://docs.ansible.com/ansible/latest/collections/cisco/ios/ios_logging_module.html#examples)
