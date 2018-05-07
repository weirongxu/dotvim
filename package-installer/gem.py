#!/usr/bin/env python3
import os
from pkg import Pkg, run

class Gem(Pkg):
  name = 'gem'

  def exists_package(self):
    return os.system('gem list -i ' + self.package_name) == 0

  def install(self):
    os.system('gem install ' + self.package_name)

  def uninstall(self):
    os.system('gem uninstall ' + self.package_name)

run(Gem)
