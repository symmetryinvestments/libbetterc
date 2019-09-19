module betterc.algorithm.sorting;

template hasRandomAccess(T) {
	enum hasRandomAccess = __traits(compiles, T[1]);
}

unittest {
	static assert(hasRandomAccess!(int[]));
}
