import os, sys
import collections

EXT_IMGS = ['png', 'jpg', 'jpeg', 'gif', 'bmp']
EXT_DOCS = ['txt', 'pdf', 'csv', 'html', 'xls']


# Create directories where to store the files
BASE_PATH = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
DEST_DIRS = ['Images', 'Documents']

for d in DEST_DIRS:
    dir_path = os.path.join(BASE_PATH)
    if not os.path.isdir(dir_path):
        os.makedirs(dir_path)

DESKTOP_PATH = os.path.join(BASE_PATH)
files_mapping = collections.defaultdict(list)
files_list = os.listdir(DESKTOP_PATH)

