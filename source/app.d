version(RunTests) {
void main() {
	import std.typecons;
	import betterc.str;
	import betterc.rbtree;
	import core.stdc.stdio;
	printf("libbetterc\n");

	foreach(u; __traits(getUnitTests, betterc.str)) {
		printf("String\n");
		u();
	}
	foreach(u; __traits(getUnitTests, betterc.rbtree)) {
		printf("rbtree\n");
		u();
	}
}
}
