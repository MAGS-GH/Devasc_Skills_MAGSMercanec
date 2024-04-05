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


Result : 

   devasc@labvm:~/Devasc_Skills_MAGSMercantec/Devasc_Skills/Task-2-Ansible-Skills$ ansible-playbook -i ansible.ini  ios_facts.yml

PLAY [Collect IOS Facts and Configure Logging Buffer] **************************************************************************

TASK [Collect IOS version information] *****************************************************************************************
ok: [192.168.56.101]

TASK [Display IOS version] *****************************************************************************************************
ok: [192.168.56.101] => {
    "ios_version.stdout": [
        "Cisco IOS XE Software, Version 16.09.05\nCisco IOS Software [Fuji], Virtual XE Software (X86_64_LINUX_IOSD-UNIVERSALK9-M), Version 16.9.5, RELEASE SOFTWARE (fc1)\nTechnical Support: http://www.cisco.com/techsupport\nCopyright (c) 1986-2020 by Cisco Systems, Inc.\nCompiled Thu 30-Jan-20 18:48 by mcpre\n\n\nCisco IOS-XE software, Copyright (c) 2005-2020 by cisco Systems, Inc.\nAll rights reserved.  Certain components of Cisco IOS-XE software are\nlicensed under the GNU General Public License (\"GPL\") Version 2.0.  The\nsoftware code licensed under GPL Version 2.0 is free software that comes\nwith ABSOLUTELY NO WARRANTY.  You can redistribute and/or modify such\nGPL code under the terms of GPL Version 2.0.  For more details, see the\ndocumentation or \"License Notice\" file accompanying the IOS-XE software,\nor the applicable URL provided on the flyer accompanying the IOS-XE\nsoftware.\n\n\nROM: IOS-XE ROMMON\n\nCSR1kv uptime is 19 minutes\nUptime for this control processor is 20 minutes\nSystem returned to ROM by reload\nSystem image file is \"bootflash:packages.conf\"\nLast reload reason: reload\n\n\n\nThis product contains cryptographic features and is subject to United\nStates and local country laws governing import, export, transfer and\nuse. Delivery of Cisco cryptographic products does not imply\nthird-party authority to import, export, distribute or use encryption.\nImporters, exporters, distributors and users are responsible for\ncompliance with U.S. and local country laws. By using this product you\nagree to comply with applicable laws and regulations. If you are unable\nto comply with U.S. and local laws, return this product immediately.\n\nA summary of U.S. laws governing Cisco cryptographic products may be found at:\nhttp://www.cisco.com/wwl/export/crypto/tool/stqrg.html\n\nIf you require further assistance please contact us by sending email to\nexport@cisco.com.\n\nLicense Level: ax\nLicense Type: Default. No valid license found.\nNext reload license Level: ax\n\n\nSmart Licensing Status: Smart Licensing is DISABLED\n\ncisco CSR1000V (VXE) processor (revision VXE) with 2182252K/3075K bytes of memory.\nProcessor board ID 9DNMON2OB1X\n1 Gigabit Ethernet interface\n32768K bytes of non-volatile configuration memory.\n3985032K bytes of physical memory.\n7774207K bytes of virtual hard disk at bootflash:.\n0K bytes of WebUI ODM Files at webui:.\n\nConfiguration register is 0x2102"
    ]
}

TASK [Gather information about L3 interfaces] **********************************************************************************
ok: [192.168.56.101]

TASK [Display L3 interfaces information] ***************************************************************************************
ok: [192.168.56.101] => {
    "l3_interfaces.stdout": [
        "GigabitEthernet1 is up, line protocol is up \n  Hardware is CSR vNIC, address is 0800.2773.1b29 (bia 0800.2773.1b29)\n  Description: IPv6 ADDRESS FROM ANSIBLE\n  Internet address is 192.168.56.101/24\n  MTU 1500 bytes, BW 1000000 Kbit/sec, DLY 10 usec, \n     reliability 255/255, txload 1/255, rxload 1/255\n  Encapsulation ARPA, loopback not set\n  Keepalive set (10 sec)\n  Full Duplex, 1000Mbps, link type is auto, media type is Virtual\n  output flow-control is unsupported, input flow-control is unsupported\n  ARP type: ARPA, ARP Timeout 04:00:00\n  Last input 00:00:00, output 00:00:00, output hang never\n  Last clearing of \"show interface\" counters never\n  Input queue: 0/375/0/0 (size/max/drops/flushes); Total output drops: 0\n  Queueing strategy: fifo\n  Output queue: 0/40 (size/max)\n  5 minute input rate 0 bits/sec, 0 packets/sec\n  5 minute output rate 0 bits/sec, 0 packets/sec\n     533 packets input, 105931 bytes, 0 no buffer\n     Received 0 broadcasts (0 IP multicasts)\n     0 runts, 0 giants, 0 throttles \n     0 input errors, 0 CRC, 0 frame, 0 overrun, 0 ignored\n     0 watchdog, 0 multicast, 0 pause input\n     287 packets output, 136458 bytes, 0 underruns\n     0 output errors, 0 collisions, 0 interface resets\n     1 unknown protocol drops\n     0 babbles, 0 late collision, 0 deferred\n     0 lost carrier, 0 no carrier, 0 pause output\n     0 output buffer failures, 0 output buffers swapped out\nLoopback1111 is up, line protocol is up \n  Hardware is Loopback\n  Description: Loopback interface 1111 created with Ansible\n  Internet address is 10.10.11.11/32\n  MTU 1514 bytes, BW 8000000 Kbit/sec, DLY 5000 usec, \n     reliability 255/255, txload 1/255, rxload 1/255\n  Encapsulation LOOPBACK, loopback not set\n  Keepalive set (10 sec)\n  Last input 00:07:37, output never, output hang never\n  Last clearing of \"show interface\" counters never\n  Input queue: 0/75/0/0 (size/max/drops/flushes); Total output drops: 0\n  Queueing strategy: fifo\n  Output queue: 0/0 (size/max)\n  5 minute input rate 0 bits/sec, 0 packets/sec\n  5 minute output rate 0 bits/sec, 0 packets/sec\n     0 packets input, 0 bytes, 0 no buffer\n     Received 0 broadcasts (0 IP multicasts)\n     0 runts, 0 giants, 0 throttles \n     0 input errors, 0 CRC, 0 frame, 0 overrun, 0 ignored, 0 abort\n     20 packets output, 1420 bytes, 0 underruns\n     0 output errors, 0 collisions, 0 interface resets\n     0 unknown protocol drops\n     0 output buffer failures, 0 output buffers swapped out"
    ]
}

TASK [Configure logging buffer size] *******************************************************************************************
ok: [192.168.56.101]

PLAY RECAP *********************************************************************************************************************
192.168.56.101             : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
