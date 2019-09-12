module betterc.nullable;

struct Nullable(T) {
	T value;
	bool isNull = true;

	this(T nv) {
		this.value = nv;
		this.isNull = false;
	}

	ref T get() {
		assert(!this.isNull);
		return this.value;
	}

	ref const(T) get() const {
		assert(!this.isNull);
		return this.value;
	}
}
