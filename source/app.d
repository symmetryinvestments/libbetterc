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
	printf("Rbtree\n");
	foreach(u; __traits(getUnitTests, betterc.rbtree)) {
		u();
	}
	printf("Map\n");
	foreach(u; __traits(getUnitTests, betterc.map)) {
		u();
	}
	printf("DynamicArray\n");
	foreach(u; __traits(getUnitTests, betterc.dynamicarray)) {
		u();
	}
}
}
