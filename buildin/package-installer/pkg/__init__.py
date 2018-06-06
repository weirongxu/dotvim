import argparse
import shutil

def args(name):
  parser = argparse.ArgumentParser(prog=name)
  parser.add_argument('action')
  parser.add_argument('package_name')
  return parser.parse_args()

class Pkg:
  name = None
  cmd = None

  def __init__(self):
    if self.name is None:
      raise Exception('Pkg.name is None')
    if self.cmd is None:
      self.cmd = self.name
    self.args = args(self.name)
    self.action = self.args.action
    self.package_name = self.args.package_name

  def witch(self):
    return shutil.which(self.cmd)

  def exists_package(self):
    False

  def try_install(self):
    if not self.exists_package():
      self.install()

  def try_uninstall(self):
    if self.exists_package():
      self.uninstall()

  def try_update(self):
    if not self.exists_package():
      self.install()
    elif hasattr(self, 'update'):
      self.update()
    else:
      self.uninstall()
      self.install()

def run(App):
  app = App()
  if app.witch():
    if app.action == 'install':
      app.try_install()
    elif app.action == 'update':
      app.try_update()
    elif app.action == 'uninstall':
      app.try_uninstall()
