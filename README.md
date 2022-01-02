Ansible Role ilo_kickstart
=========

An role for os installation with an kickstart file on an HPE Proliant

Requirements
------------

- An Webserver the ilo has access to and ansible could post files to.
- an customized boot-iso for your OS. kickstart must be searched on an USB device.

Role Variables
--------------
This role uses: \
    - baseuri: <ilo-ip> \
    - username: <ilo-user> \
    - password: <ilo-password> \
    - webserver: <webserver from where to mount the virt. media> e.g.: "http://osdepl.demo.local/esx7" \
    - bootiso: <name of the iso file> e.g.: "esx72usb.iso" \
    - eject_usb: <true | false> optional, default true; wait for installation to complete and then eject usb media \
    - ksfile:  the roles has three examples ks-esx.j2, autoinst.j2 and ks-rocky.j2, but you could use your own in {{plabook_dir}} \
    - subnetmask, default: 255.255.255.0 \
    - nameserver:  default: 10.0.20.5 \


Dependencies
------------
    - hpe.ilo collection
    - community.general collection for the redfish commands

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: localhost \
  gather_facts: no \
  \
  vars:\
    - webserver: "http://osdepl.demo.local/esx7"\
    - esxiso: "esx72usb.iso"\
  vars_files:\
    - ilo-cred.yaml\
    
  roles:
  - { role: ilo-kickstart, baseuri: "xx.xx.xx.xx", myip: "xx.xx.xx.xx", myhostname: "xxxx.xxx.xxx.xxx.xxx", mygw: "xx.xx.xx.xx"  }
    

License
-------

BSD

Author Information
------------------
Stephan Koch
