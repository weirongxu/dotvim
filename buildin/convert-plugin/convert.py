#!/usr/bin/env python3
import os
import yaml
import json
import sys
import re
import glob
import traceback

class Config(object):
  def __init__(self, local_dir, source_file, cwd):
    self.local_dir = local_dir
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
      str = re.sub(r'"EVAL\((.*?)\)"', '\\1', str)
      str = re.sub(r'EVAL\((.*?)\)', '".\\1."', str)
      str = re.sub(r': ""\.', ': ', str)
      str = re.sub(r'\."",', ',', str)
      return str

    def _add_plugin(repo, options):
      if manager_type == 'vim-plug':
        template = "Plug '{}', {}"
      elif manager_type == 'dein.vim':
        options['merged'] = 0
        template = "call dein#add('{}', {})"
      self.vimscript_content.append(
        template.format(repo, parse_eval(json.dumps(options))))

    if 'repo' in plugin:
      _add_plugin(
        plugin['repo'],
        {k: v for k, v in plugin.items() if k != 'repo'},
      )

    elif 'repo_local' in plugin:
      _add_plugin(
        self.local_dir + '/' + plugin['repo_local'],
        {k: v for k, v in plugin.items() if k != 'repo_local'},
      )

    elif 'repos_include' in plugin:
      for path in glob.glob(os.path.join(self.cwd, plugin['repos_include'])):
        self.vimscript_content.append(Config(self.local_dir, open(path), os.path.dirname(path)).get_vim_script(manager_type))

  def get_yaml_list():
    pass

  def get_vim_script(self, manager_type):
    self.vimscript_content = []
    self.add_plugins(self.configs, manager_type)
    return '\n'.join(self.vimscript_content)


def run(local_dir, source, target, manager_type):
  try:
    text = Config(local_dir, open(source), os.path.dirname(source)).get_vim_script(manager_type)
    target_file = open(target, 'w+')
    target_file.write(text)
  except Exception as e:
    traceback.print_exc()

if len(sys.argv) >= 3:
  local_dir = sys.argv[1]
  source = sys.argv[2]
  target = sys.argv[3]
  manager_type = sys.argv[4]
  run(local_dir, source, target, manager_type)
