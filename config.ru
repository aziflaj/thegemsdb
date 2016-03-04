#\ -o 0.0.0.0 -p 3000
require "./main"
require "./gemstone_controller"

map('/gemstones') { run GemstoneController }
map('/') { run Website }
