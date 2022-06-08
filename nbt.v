module main

import os
import compress.deflate

fn main() {
	mut bytes := os.read_bytes("./signal_intervals.dat")?[10..]
	bytes = deflate.decompress(bytes)?
	println(bytes)
}
