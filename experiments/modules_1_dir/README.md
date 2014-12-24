Question: is it possible to load multiple modules in the same file?

Hypothesis: Yes. Chapter 5 (i.e. *Modules*) of the 2010 language report certainly implies this is the case with a wide variety of examples.

Test: Tried it out, did not work (cf the `failed` directory).

Conclusion: I read section 2.2.1 (i.e. *Modules vs. filenames*) in the GHC user guide, and it explicitly said that there can only be one module per file.
