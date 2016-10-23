#!/usr/bin/env python3
import os
import yaml
import json
import sys
import re
import traceback

class Config(object):
  def __init__(self, source_file, include_root_dir):
    self.configs = self.load(source_file) or []
    self.include_root_dir = include_root_dir

  def load(self, source_file):
    lines = [line for line in source_file.readlines() if re.search(r'^\s*#', line) is None]
    return yaml.load(''.join(lines))

  def add_plugins(self, plugins, target_type):
    for plugin in plugins:
      self.add_plugin(plugin, target_type)

  def add_plugin(self, plugin, target_type):
    def parse_eval(str):
      str = re.sub(r'"EVAL\((.*)\)"', '\\1', str)
      str = re.sub(r'EVAL\((.*)\)', '".\\1."', str)
      str = re.sub(r': ""\.', ': ', str)
      str = re.sub(r'\."",', ',', str)
      return str

    def append_line(repo, options={}):
      if target_type == 'vim-plug':
        template = "Plug '{}', {}"
      elif target_type == 'dein.vim':
        template = "call dein#add('{}', {})"
      self.vimscript_content.append(
        template.format(repo, parse_eval(json.dumps(options))))

    if 'repo' in plugin:
      repo = plugin['repo']
      options = {k: v for k, v in plugin.items() if k != 'repo'}
      append_line(repo, options)
    elif 'repos_include' in plugin:
      plugins = self.load(open(
        os.path.join(self.include_root_dir, plugin['repos_include'])
      ))
      self.add_plugins(plugins or [], target_type)

  def get_vim_script(self, target_type):
    self.vimscript_content = []
    self.add_plugins(self.configs, target_type)
    return '\n'.join(self.vimscript_content)

source = sys.argv[1]
target = sys.argv[2]
target_type = sys.argv[3]
include_root_dir = sys.argv[4]

try:
  text = Config(open(source), include_root_dir).get_vim_script(target_type)
  target_file = open(target, 'w+')
  target_file.write(text)
except Exception as e:
  traceback.print_exc()
