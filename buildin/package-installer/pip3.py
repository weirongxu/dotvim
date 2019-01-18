#!/usr/bin/env python3
import os
from pkg import Pkg, run

class Pip3(Pkg):
  name = 'pip3'

  def exists_package(self):
    os.system('pip3 show ' + self.package_name) == 0

  def install(self):
    os.system('pip3 install --user ' + self.package_name)

  def uninstall(self):
    os.system('pip3 uninstall ' + self.package_name)

run(Pip3)
