# The Flavius Josephus problem
## Avaliação pratica 4 de LiP

## Objetivos:
### <<<<<< 1º >>>>>>
Código Oz das três soluções (note que as duas primeiras já possuem o código na `Seção 7.8.3`);
---
The Flavius Josephus problem. `Section 7.8.3` solves this problem in two ways,
using active objects and using data-driven concurrency.For this exercise, do the
following:
- **A)** Use a third model, the sequential stateful model, to solve the problem.
Write two programs: the first without short-circuiting and the second with it.
Try to make both as concise and natural as possible in the model.For example,
without short-circuiting an array of booleans is a natural data structure to
represent the ring.Compare the structure of both programs with the two
programs in `section 7.8.3`.

| versão | filename |
|:-:|:-:|
| Data-Driven Concurrent |Josephus1.oz |
| Active Object |Josephus2.oz |
| The Sequential Stateful |Josephus3.oz|

---

### <<<<<< 2º >>>>>>
Relatório respondend o `item b`.
---

- **B)** Compare the execution times of the different versions.There are two
orthogonal analyses to be done.First, measure the advantages (if any) of using
short-circuiting for various values of n and k. This can be done in each of
the three computation models.For each model, divide the (n, k) plane into
two regions, depending on whether short-circuiting is faster or not.Are these
regions the same for each model? Second, compare the three versions with
short-circuiting.Do these versions have the same asymptotic time complexity
as a function of n and k?

---
## Executando programa:
Para executar o programa, basta executar o comando abaixo no terminal:
```bash 
$ echo "hello, pratica 4"
```

## Autores:
| Nome | 
|:-:|
| Jonanthan Aires |
| Antonio Gabriel |
