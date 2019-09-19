module betterc.dynamicarray;

struct DynamicArray(T) {
	import core.stdc.stdlib : realloc, free;

	T* ptr;
	size_t length;
	private size_t _capacity;

	~this() {
		if(this.ptr) {
			free(cast(void*)ptr);
			this.length = 0;
			this._capacity = 0;
		}
	}
	@property size_t capacity() const {
		return this._capacity;
	}

	void assureCapacity(size_t cap) {
		if(cap > this.length) {
			this._capacity = cap;
			this.ptr = cast(T*)realloc(this.ptr, T.sizeof * this._capacity);
			assert(this.ptr);
		}
	}

	private void assureCapacity() {
		if(this.length == this._capacity) {
			this._capacity = this._capacity == 0 ? 10 : this._capacity * 2;
			this.assureCapacity(this._capacity);
		}
	}

	void append(T t) {
		this.assureCapacity();
		*(this.ptr + this.length) = t;
		++this.length;
	}

	ref T opIndex(size_t idx) {
		assert(idx < this.length);
		return *(this.ptr + idx);
	}

	@property ref T front() {
		return *(this.ptr);
	}

	@property ref T back() {
		return *(this.ptr + (this.length - 1));
	}
}

unittest {
	DynamicArray!int a;
}

unittest {
	DynamicArray!int a;
	a.append(1);
	assert(a.capacity == 10);
	assert(a.length == 1);
	assert(a[0] == 1);
}

unittest {
	DynamicArray!int a;
	foreach(it; 0 .. 100) {
		a.append(it);
		assert(a.front == 0);
		assert(a.back == it);
		foreach(jdx; 0 .. it) {
			assert(a[jdx] == jdx);
		}
	}
}
