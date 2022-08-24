Ansible Role ilo_kickstart
=========
 
An role for os installation with an kickstart file on an HPE Proliant

      
Requirements
------------

- An Webserver the ilo has access to and ansible could post files to.
- an customized boot-iso for your OS. kickstart must be searched on an USB device.
  # ESX: boot.cfg tweaked with kernelopt=cdromBoot runweasel ks=usb:/ks.cfg
  # rocky:  linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=.... quiet nvme_core.multipath=N inst.ks=hd:sda1:/ks.cfg
  # opensusue:   linux /boot/x86_64/loader/linux splash=silent autoyast=usb:///ks.cfg

- create the iso with mkiso:
  #esx: mkisofs -relaxed-filenames -J -R -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e efiboot.img -boot-load-size 1 -no-emul-boot -o /tmp/customesxi.iso .
  #rocky:  mkisofs -o ../Rocky85.iso -b isolinux/isolinux.bin -J -R -l -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -graft-points -V \"Rocky-8-5-x86_64-dvd\" .
- be able to become root on the ansible workstation for inserting the kickstart file into the usb-stick image 

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
    - nameserver:  default: 10.0.20.5 


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
  vars:
    - webserver: "http://osdepl.demo.local/esx7"
    - esxiso: "esx72usb.iso"\
  vars_files:
    - ilo-cred.yaml
    
  roles:
  - { role: ilo-kickstart, baseuri: "xx.xx.xx.xx", myip: "xx.xx.xx.xx", myhostname: "xxxx.xxx.xxx.xxx.xxx", mygw: "xx.xx.xx.xx"  }
    

License
-------

BSD

Author Information
------------------
Stephan Koch
