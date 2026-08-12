curl -s https://pypi.org/pypi/buildstream-plugins/json | \
  python3 -c "
import json, sys
data = json.load(sys.stdin)
latest = data['info']['version']
for f in data['releases'][latest]:
    if f['filename'].endswith('.tar.gz'):
        print('URL:', f['url'])
        print('REF:', f['digests']['sha256'])
"
