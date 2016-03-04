require "./main"
require "./gemstone_controller"

map('/gemstones') { run GemstoneController }
map('/') { run Website }
