module betterc.sumtype;

public import sumtype;

@nogc @safe nothrow:

unittest {
	double abs(double a) {
		return a < 0.0 ? -a : a;
	}

	bool approxEqual(double a, double b) {
		return a < b ? abs(b - a) < 0.001 : abs(a - b) < 0.001;
	}

	struct Fahrenheit { double degrees; }
	struct Celsius { double degrees; }
	struct Kelvin { double degrees; }

	alias Temperature = SumType!(Fahrenheit, Celsius, Kelvin);

	// Construct from any of the member types.
	Temperature t1;
	Temperature t2;
	Temperature t3;

	() @trusted {
		t1 = Fahrenheit(98.6);
		t2 = Celsius(100);
		t3 = Kelvin(273);
	}();

	// Use pattern matching to access the value.
	Fahrenheit toFahrenheit(Temperature t) pure @safe @nogc nothrow
	{
		return Fahrenheit(
			t.match!(
				(Fahrenheit f) => f.degrees,
				(Celsius c) => c.degrees * 9.0/5 + 32,
				(Kelvin k) => k.degrees * 9.0/5 - 459.4
			)
		);
	}

	assert(approxEqual(toFahrenheit(t1).degrees, 98.6));
	assert(approxEqual(toFahrenheit(t2).degrees, 212));
	assert(approxEqual(toFahrenheit(t3).degrees, 32));
}
