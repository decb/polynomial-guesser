# polynomial-guesser

Think of a polynomial in _x_ of arbitrary degree with non-negative integer coefficients, this program can guess it given just two points on the polynomial.

For example, given _x<sup>2</sup> + 3x + 9_:

```
$ polynomial-guesser
What is the value for x = 1? 13
What is the value for x = 14? 247
Your polynomial is:
 2
x  + 3x + 9
```

## Installing and running

Requires the Haskell tool [Stack](https://docs.haskellstack.org/en/stable/README/).

```
stack build
stack exec polynomial-guesser
```

### Running tests

```
stack test
```

## References

1. [Math &cap; Programming, _Learning a single-variable polynomial, or the power of adaptive queries_](https://jeremykun.com/2014/11/18/learning-a-single-variable-polynomial-or-the-power-of-adaptive-queries/)
