#!/usr/bin/env python3
import os
import yaml
import json
import sys

def parse(text):
  configs = yaml.load(text)
  vim_content = []
  for config in configs.get('plugins', {}):
    repo = config['repo']
    options = {k: v for k, v in config.items() if k != 'repo'}
    if not options:
      vim_content.append(
        "call dein#add('{}')".format(repo))
    else:
      vim_content.append(
        "call dein#add('{}', {})".format(repo, json.dumps(options)))
  return '\n'.join(vim_content)

source = sys.argv[1]
target = sys.argv[2]
try:
  text = parse(open(source).read())
  target_file = open(target, 'w+')
  target_file.write(text)
except Exception as e:
  print(e)
