Role Name
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------
This role uses:
    - baseuri: <ilo-ip>
    - username: <ilo-user>
    - password: <ilo-password>
    - webserver: <webserver from where to mount the virt. media> e.g.: "http://osdepl.demo.local/esx7"
    - esxiso: <name of the iso file> e.g.: "esx72usb.iso"


Dependencies
------------
    - hpe.ilo collection
    - community.general collection for the redfish commands

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: localhost
  gather_facts: no
  #collections:
  #  - hpe.ilo
  
  vars:
    - webserver: "http://osdepl.demo.local/esx7"
    - esxiso: "esx72usb.iso"
  vars_files:
    - ilo-cred.yaml
    
  roles:
  - { role: ilo-kickstart, myip: "xx.xx.xx.xx", myhostname: "xxxx.xxx.xxx.xxx.xxx", mygw: "xx.xx.xx.xx"  }
    

License
-------

BSD

Author Information
------------------
Stephan Koch, HPE
