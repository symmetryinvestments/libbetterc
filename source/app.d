version(RunTests) {
void main() {
	import std.typecons;
	import betterc.str;
	import core.stdc.stdio;
	printf("libbetterc\n");

	foreach(u; __traits(getUnitTests, betterc.str)) {
		u();
	}
}
}
