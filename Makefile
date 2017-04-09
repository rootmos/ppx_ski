.PHONY: snippet
snippet: ppx_ski.native
	ocamlfind ppx_tools/rewriter ./$< snippet.ml

ppx_ski.native: src/*.ml*
	ocamlbuild -use-ocamlfind $@

.PHONY: sk.cma
sk.cma: sk/*.ml*
	ocamlbuild -use-ocamlfind $@

.PHONY: parsetree
parsetree:
	ocamlc -dparsetree snippet.ml
	rm snippet.cm*

.PHONY: dumpast
dumpast:
	ocamlfind ppx_tools/dumpast snippet.ml

.PHONY: utop
utop: ppx_ski.native sk.cma
	utop -ppx ./ppx_ski.native -I _build/sk _build/sk/sk.cma

.PHONY: clean
clean:
	ocamlbuild -clean
