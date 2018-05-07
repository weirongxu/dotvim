#!/usr/bin/env python3
import os
import subprocess
import re
from pkg import Pkg, run

class Npm(Pkg):
  name = 'npm'

  def get_root_path(self):
    s = subprocess.check_output(['npm', 'root', '-g']).decode()
    lines = [line for line in s.splitlines() if not re.match('Now using node v\d+\.\d+\.\d+', str(line))]
    return ''.join(lines).strip()

  def exists_package(self):
    return os.path.isdir(self.get_root_path() + '/' + self.package_name)

  def install(self):
    os.system('npm install -g ' + self.package_name)

  def uninstall(self):
    os.system('npm uninstall -g ' + self.package_name)

run(Npm)
