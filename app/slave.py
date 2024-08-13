import sys
from bugs.bottle import error, route, run, static_file#, template

### Default settings ###
@error(404)
def go_default(error):
     return 'notmyproblem .!.'

@route('/static/<file:path>')
def static(file):
     return static_file(file, root='./static')

@route('/info.mjs')
def info():
     return static_file('/info.mjs', root='.')

@route('/manifest.json')
def manifest():
     return static_file('/manifest.json', root='.')

### Real sh1t ###
@route('/')
def hello():
     return static_file('index.html', root='.')

if __name__ == '__main__':
     if len(sys.argv) != 3: raise Exception('EXPLODE')
     print(f'Running in mode {sys.argv[1]} on port {sys.argv[2]}...')
     if sys.argv[1] == 'dev':
          run(host='0.0.0.0', port=int(sys.argv[2]), debug=True, reloader=True)
     if sys.argv[1] == 'FTW':
          run(host='0.0.0.0', port=int(sys.argv[2]))

#ned