module nbt

fn (mut d Decoder) read_tag() ?(u8, string) {
	tag_type := d.read_short()?
	tag_name := d.read_string()?

	return tag_type, tag_name
}

fn (mut d Decoder) read_byte() ?i8 {
	mut buf := []u8{len:1}
	d.read(mut buf)?
	return i8(buf[0])
}

fn (mut d Decoder) read_short() ?i16 {
	mut buf := []u8{len:2}
	d.read(mut buf)?
	return i16(buf[0]) << 8 | i16(buf[1])
}

fn (mut d Decoder) read_string() ?string {
	len := d.read_short()?

	if len < 0 {
		return error("string len cannot be less then 0")
	}

	mut s := ""

	if len > 0 {
		mut buf := []u8{len:int(len)}
		d.read(mut buf)?
		s = buf.bytestr()
	}

	return s
}
