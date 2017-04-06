.PHONY: snippet
snippet: ppx_ski.native
	ocamlfind ppx_tools/rewriter ./$< snippet.ml

ppx_ski.native: src/ppx_ski.ml
	ocamlbuild -use-ocamlfind $@

.PHONY: parsetree
parsetree:
	ocamlc -dparsetree snippet.ml
	rm snippet.cm*
