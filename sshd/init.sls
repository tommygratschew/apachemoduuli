openssh-server:
 pkg.installed

/etc/ssh/sshd_config:
 file.managed:
   - source: salt://sshd/sshd_config

/etc/motd:
  file.managed:
   - source: salt://sshd/motd
   - template: jinja

sshd:
 service.running:
   - watch:
     - file: /etc/ssh/sshd_config
