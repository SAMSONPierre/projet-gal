all:
	ocamllex lexeur.mll
	ocamlc token.ml
	ocamlc lexeur.ml
	ocamlc -o main lexeur.cmo token.cmo main.ml
clean:
	rm a.out
	rm lexeur.cmi
	rm lexeur.cmo
	rm main
	rm main.cmi
	rm main.cmo
	rm token.cmi
	rm token.cmo
