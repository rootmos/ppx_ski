.PHONY: build
build:
	ocamlbuild -package compiler-libs.common ppx_ski.native
	ocamlfind ppx_tools/rewriter ./ppx_ski.native snippet.ml

.PHONY: parsetree
parsetree:
	ocamlc -dparsetree snippet.ml
	rm snippet.cm*
