ufw enable:
  cmd.run:
    - unless: "ufw status|grep 'Status: active'"

ufw allow 22/tcp:
  cmd.run:
    - unless: "ufw status verbose|grep '22/tcp'"

ufw allow 80/tcp:
  cmd.run:
    - unless: "ufw status verbose|grep '80/tcp'"



