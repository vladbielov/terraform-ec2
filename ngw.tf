resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public3.id}"
}

resource "aws_eip" "nat" {
  vpc  = true
}
