#!/usr/bin/env python3
import os
import yaml
import json
import sys

class Config(object):
  def __init__(self, f):
    self.vimscript_content = []
    self.configs = self.load(f)
    self.add_plugins(self.configs.get('plugins', []))

  def load(self, f):
    return yaml.load(f)

  def add_plugins(self, plugins):
    for plugin in plugins:
      self.add_plugin(plugin)

  def add_plugin(self, plugin):
    if 'repo' in plugin:
      repo = plugin['repo']
      options = {k: v for k, v in plugin.items() if k != 'repo'}
      if not options:
        self.vimscript_content.append(
          "call dein#add('{}')".format(repo))
      else:
        self.vimscript_content.append(
          "call dein#add('{}', {})".format(repo, json.dumps(options)))
    elif 'repos_include' in plugin:
      
      plugins = self.load(open(os.path.join(os.path.dirname(source), 'dein-repos-yml', plugin['repos_include'])))
      self.add_plugins(plugins or [])

  def get_vim_script(self):
    return '\n'.join(self.vimscript_content)

source = sys.argv[1]
target = sys.argv[2]
try:
  text = Config(open(source)).get_vim_script()
  target_file = open(target, 'w+')
  target_file.write(text)
except Exception as e:
  print(e)
