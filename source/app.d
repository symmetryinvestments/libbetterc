version(RunTests) {
void main() {
	import std.typecons;
	import betterc.str;
	import betterc.rbtree;
	import betterc.map;
	import betterc.dynamicarray;
	import core.stdc.stdio;
	printf("libbetterc\n");

	printf("String\n");
	foreach(u; __traits(getUnitTests, betterc.str)) {
		u();
	}
	printf("rbtree\n");
	foreach(u; __traits(getUnitTests, betterc.rbtree)) {
		u();
	}
	printf("rbtree\n");
	foreach(u; __traits(getUnitTests, betterc.map)) {
		u();
	}
	printf("dynamicarray\n");
	foreach(u; __traits(getUnitTests, betterc.dynamicarray)) {
		u();
	}
}
}
