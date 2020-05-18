apache2:
  pkg.installed

/var/www/html/index.html:
  file.managed:
   - source: salt://apache/index.html

/etc/apache2/mods-enabled/userdir.conf:
 file.symlink:
   - target: ../mods-available/userdir.conf
/etc/apache2/mods-enabled/userdir.load:
 file.symlink:
   - target: ../mods-available/userdir.load

/etc/skel/public_html:
 file.directory:
   - name: /etc/skel/public_html
   - mode: 755

/etc/skel/public_html/index.html:
 file.managed:
   - source: salt://apache/kayttaja-index.html

apache2.service:
  service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-enabled/userdir.conf
     - file: /etc/apache2/mods-enabled/userdir.load

