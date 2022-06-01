module main

import os
import io
import nbt

fn main() {
	mut file := os.open("./v.mod") or { panic(err) }
	defer {
		file.close()
	}
	mut r := io.new_buffered_reader(reader: file, cap: 16)
	decoder := nbt.new_decoder(r)
}
