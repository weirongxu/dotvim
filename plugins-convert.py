#!/usr/bin/env python3
import os
import yaml
import json
import sys
import re
import glob
import traceback

class Config(object):
  def __init__(self, source_file, cwd):
    self.configs = self.load(source_file) or []
    self.cwd = cwd

  def load(self, source_file):
    lines = [line for line in source_file.readlines() if re.search(r'^\s*#', line) is None]
    return yaml.load(''.join(lines))

  def add_plugins(self, plugins, manager_type):
    for plugin in plugins:
      self.add_plugin(plugin, manager_type)

  def add_plugin(self, plugin, manager_type):
    def parse_eval(str):
      str = re.sub(r'"EVAL\((.*)\)"', '\\1', str)
      str = re.sub(r'EVAL\((.*)\)', '".\\1."', str)
      str = re.sub(r': ""\.', ': ', str)
      str = re.sub(r'\."",', ',', str)
      return str

    if 'repo' in plugin:
      repo = plugin['repo']
      options = {k: v for k, v in plugin.items() if k != 'repo'}

      if manager_type == 'vim-plug':
        template = "Plug '{}', {}"
      elif manager_type == 'dein.vim':
        template = "call dein#add('{}', {})"
      self.vimscript_content.append(
        template.format(repo, parse_eval(json.dumps(options))))

    elif 'repos_include' in plugin:
      for path in glob.glob(os.path.join(self.cwd, plugin['repos_include'])):
        self.vimscript_content.append(Config(open(path), os.path.dirname(path)).get_vim_script(manager_type))

  def get_yaml_list():
    pass

  def get_vim_script(self, manager_type):
    self.vimscript_content = []
    self.add_plugins(self.configs, manager_type)
    return '\n'.join(self.vimscript_content)

source = sys.argv[1]
target = sys.argv[2]
manager_type = sys.argv[3]

try:
  text = Config(open(source), os.path.dirname(source)).get_vim_script(manager_type)
  target_file = open(target, 'w+')
  target_file.write(text)
except Exception as e:
  traceback.print_exc()
