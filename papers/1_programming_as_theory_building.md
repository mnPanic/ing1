# Discusión de papers #1

Papers:

- Programming as theory building (principal) ([link](https://www.dropbox.com/s/e2k1fuwlgehrk9a/Programming%20as%20Theory%20Building-1.doc?dl=0))
- Revisigint Naur's Programming as Theory Building for Enterprise Architecture
  Modelling ([link](http://e-centre.mdx.ac.uk/staffpages/tonyclark/Papers/CAISE-Final-v3-Barn-Clark.pdf))
- The Limits of Correctness ([link](https://student.cs.uwaterloo.ca/~cs492/11public_html/p18-smith.pdf))
- A Philosophical Re-Appraisal of Peter Naur's Notion of "programming as Theory
  Building"
  ([link](https://aisel.aisnet.org/cgi/viewcontent.cgi?article=1017&context=ecis2007))
  
## Programming as theory building (1985)

El paper quiere presentar la Theory Building View de la programación

- Muestra case studies (compilador y real time sytems) que muestran que con
  programas grandes, adaptarlos y corregir errores depende de cierto
  conocimiento que poseen los que lo armaron originalmente.

- Presenta **Ryle's notion of theory**, una definición de teoría que se usa para
  definir la diferencia entre actividades intelectuales y simpĺemente
  inteligentes.

- La teoría que debe ser construida por un programador entonces es la que indica
  como ciertas cosas del mundo van a ser manejadas por programas.

  Por qué el conocimiento de la teoria del programador trasciende el
  documentado?

- La teoría de un programa no puede ser expresado, está inextricablemente ligado
  a los seres humanos.

  >> Es raro que diga que no se puede expresar

> In preference to program revival, the Theory Building View suggests, the
> existing program text should be discarded and the new–formed programmer team
> should be given the opportunity to solve the given problem afresh. Such a
> procedure is more likely to produce a viable program than program revival, and
> at no higher, and possibly lower, cost

>> No estoy de acuerdo con eso. Los bugs que se fueron solucionando con el tiempo
>> se ven capturados en el código legacy. Con un complete rewrite, si bien formás
>> nueva teoría y los programadores están familiarizados con la codebase, se debe
>> considerar el costo adicional de arreglar todos los casos borde y bugs que
>> habían en el codebase viejo.